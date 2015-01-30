#!/bin/awk -f
BEGIN { 
    
    FS = "|"
    counter = 0
    while ( getline < "data-images.csv" > 0 ) {
        counter++
        if (counter < 2 || !$0) { continue }
        $4 = gensub(/'/,"''","g",$4)
        filedescriptions[$2] = $1 "|" $4
    }
    varrayStrg = null
    for (filename in filedescriptions) {
        varrayStrg = varrayStrg ",'" filename "'"
    }

    varrayStrg = varrayStrg ")"
    sub(/^,/,"t_filenames(",varrayStrg)

    print "create table images ("
    print " id number constraint images_pk primary key,"
    print " description varchar2(3000),"
    print " image ORDSYS.ORDImage,"
    print " imageSignature ORDSYS.ORDImageSignature,"
    print " providerID varchar2(4),"
    print " constraint fk_images foreign key (providerID) references imageproviders"
    print ");"
    print ""
    
    print "prompt 'Insert images'"
    print "declare"
    print "   type t_collection is table of varchar2(4) index by varchar2(20);"
    print "   collection t_collection;"
    print "   imageObj ORDSYS.ORDImage;"
    print "   ctx RAW(4000) := null;"
    print "   key varchar2(20);"
    print "   counter number := 1;"
    print "begin"
    for (elem in filedescriptions) {
        split(filedescriptions[elem],values,"|")
        print "collection('"elem"') := '"values[1]"';"
    }
    print ""
    print "key := collection.first;"
    print "while key is not null loop"
    print "   dbms_output.put_line (collection(key));"
    print "   insert into images values (counter,null,ORDSYS.ORDImage.init(),ORDSYS.ORDImageSignature.init(),(select abbr from imageproviders where abbr = collection(key)));"
    print
    print "   select image into imageObj from images where id = counter for update;"
    print "   imageObj.setSource('file','IMGDIR10',key);"
    print "   imageObj.setProperties;"
    print "   imageObj.import(ctx);"
    print "   update images set image = imageObj where id = counter;"
    print "   counter := counter + 1;"
    print "   key := collection.next(key);" 
    print "end loop;"
    print "commit;"
    print "end;"
    print "/"
    print ""
   
    print "prompt 'Create basic lexer and storage preference'"
    print "begin"
    print "ctx_ddl.create_preference('lexer', 'BASIC_LEXER' );"
    print "ctx_ddl.set_attribute ( 'lexer', 'mixed_case', 'NO' );"
    print "ctx_ddl.create_preference('storage', 'BASIC_STORAGE');"
    print "ctx_ddl.set_attribute('storage', 'I_TABLE_CLAUSE', 'tablespace INDX');"
    print "ctx_ddl.set_attribute('storage', 'K_TABLE_CLAUSE', 'tablespace INDX');"
    print "ctx_ddl.set_attribute('storage', 'R_TABLE_CLAUSE', 'tablespace INDX');"
    print "ctx_ddl.set_attribute('storage', 'N_TABLE_CLAUSE', 'tablespace INDX');"
    print "ctx_ddl.set_attribute('storage', 'I_INDEX_CLAUSE', 'tablespace INDX');"
    print "ctx_ddl.set_attribute('storage', 'P_TABLE_CLAUSE', 'tablespace INDX');"
    print "end;"
    print "/"
    print ""

    print "prompt 'Create context index for image descriptions'"
    print "create index descriptionIndex on images ( description )"
    print "    indextype is ctxsys.context"
    print "    parameters ( 'LEXER lexer STORAGE storage SYNC (ON COMMIT)' );"
    print ""

    print "prompt 'Insert descriptions'"
    for (filename in filedescriptions){
        split(filedescriptions[filename],values,"|")
        print "update images"
        print "set description = '" values[2] "'"
        print "where id = (select id from images i where i.image.getSourceName() = '"filename"');"
        print ""
    }
}
