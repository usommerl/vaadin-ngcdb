#!/bin/awk -f
BEGIN { 
    
    FS = "|"
    counter = 0
    while ( getline < "data-images.csv" > 0 ) {
        counter++
        if (counter < 2 || !$0) { continue }
        relations[$2] = $3
    }
    print "create table imagerelations ("
    print " imageID number,"
    print " ngcobjectID number,"
    print " constraint fk_imagerelations1 foreign key (imageID) references images,"
    print " constraint fk_imagerelations2 foreign key (ngcobjectID) references ngcobjects"
    print ");"
    print ""

    for (filename in relations){
        split(relations[filename],objectIDs,",")
        for (idx in objectIDs){
            print "insert into imagerelations values ((select id from images i where i.image.getSourceName() = '"filename"'),"objectIDs[idx]");"    
        }

    }
    
}
