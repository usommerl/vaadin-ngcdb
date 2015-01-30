#!/bin/awk -f
BEGIN { 
    FS = ","
    print "create table ngcobjects ("
    print " id number(4) constraint pk_ngcobjects primary key,"
    print " ra varchar2(20) not null,"
    print " dec varchar2(20) not null,"
    print " m float,"
    print " constellationID varchar(3) not null,"
    print " yearOfDiscovery number,"
    print " objectTypeID number not null,"
    print " discovererID number not null,"
    print " constraint fk_ngcobjects1 foreign key (constellationID) references constellations (abbr),"
    print " constraint fk_ngcobjects2 foreign key (objectTypeID) references objecttypes (id),"
    print " constraint fk_ngcobjects3 foreign key (discovererID) references discoverers (id)"
    print ");"
    print

    while ( getline < "data-discoverers.csv" > 0 ) {
              discoveryYears[$1] = $2
              firstnames[$1] = $3
              mnames[$1] = $4
              lastnames[$1] = $5
    }
    counter = 0
    while ( getline < "data-ngcobjects.csv" > 0) {
        counter++
        sub(/'/, "''", $6)
        sub(/′/, "''", $6)
        sub(/″/, "\"", $6)
        sub(/°/,"\\00B0",$6)
        $6 = gensub(/^([[:digit:]])/,"+\\1","g",$6)
        if (counter < 3) { continue }
        if ($7) { m = $7 } else { m = "null" }
        firstname = "'" firstnames[$1] "'"
        middlenames = "'" mnames[$1] "'"
        sub(/'/,"''",lastnames[$1])
        lastname = "'" lastnames[$1] "'"
        firstname = replaceUmlauts(firstname)
        middlenames = replaceUmlauts(middlenames)
        lastname = replaceUmlauts(lastname)
        
        if (length(middlenames) == 2 ) { middlesql = "middlenames is null" } else { middlesql = "middlenames = unistr(" middlenames")"}
        if (length(lastname) == 2) { lastsql = "lastname is null" } else {lastsql = "lastname = unistr(" lastname")"}

        print "insert into ngcobjects(id,ra,dec,m,objectTypeID,constellationID,yearOfDiscovery,discovererID) values("$1",'"$5"',unistr('"$6"'),"m",(select id from objecttypes where name = '"capitalize($3)"'),(select abbr from constellations where name = '"capitalize($4)"'),"discoveryYears[$1]",(select id from discoverers where firstname = unistr("firstname") and "middlesql" and "lastsql"));"
    }
} 

function capitalize(input,result, words, n, i, w)
{
    result = ""
    n = split(input, words, " ")
    for (i = 1; i <= n; i++) {
        w = words[i]
        w = toupper(substr(w, 1, 1)) substr(w, 2)
        if (i > 1)
            result = result " "
        result = result w
    }
    return result
}
function replaceUmlauts(input)
{
    gsub(/\xfc/,"\\00fc",input) #ü
    gsub(/\xf6/,"\\00f6",input) #ö
    gsub(/\xf2/,"\\00f2",input) #ò
    gsub(/\xe4/,"\\00e4",input) #ä
    return input
}
