#!/bin/awk -f
BEGIN { 
    FS = ","
    print "create sequence discoverers_seq"
    print " minvalue 1"
    print " start with 1"
    print " increment by 1"
    print " cache 20;"
    print 
    print "create table discoverers ("
    print " id number constraint pk_discoverers primary key,"
    print " firstname varchar2(20) not null,"
    print " middlenames varchar2(25),"
    print " lastname varchar2(20),"
    print " yearOfBirth number,"
    print " yearOfDeath number"
    print ");"
    print

    counter = 0
    while ( getline < "data-discoverers.csv" > 0 ) {
        counter++
        if ($1 ~ "ngcid") { continue }
        discoverers[$3$4$5$6$7] = $3","$4","$5","$6","$7
    }
    for (x in discoverers) {
        split(discoverers[x],record,",")
        firstname = "'" record[1] "'"
        middlenames = "'" record[2] "'"
        lastname = "'" record[3] "'"
        yearOfBirth = record[4]
        yearOfDeath = record[5]
        if (lastname ~ "''") {lastname = "null"}
        if (middlenames ~ "''") {middlenames = "null"}
        if (!yearOfBirth) {yearOfBirth = "null"}
        if (!yearOfDeath) {yearOfDeath = "null"}
        sub(/'d'Arrest'/,"'d''Arrest'",lastname)
        firstname = replaceUmlauts(firstname)
        middlenames = replaceUmlauts(middlenames)
        lastname = replaceUmlauts(lastname)

        print "insert into discoverers values(discoverers_seq.nextval,  unistr("firstname"), unistr("middlenames"), unistr("lastname"),"yearOfBirth","yearOfDeath");"
    }
} 
function replaceUmlauts(input)
{
    gsub(/\xfc/,"\\00fc",input) #ü
    gsub(/\xf6/,"\\00f6",input) #ö
    gsub(/\xf2/,"\\00f2",input) #ò
    gsub(/\xe4/,"\\00e4",input) #ä
    return input
}
