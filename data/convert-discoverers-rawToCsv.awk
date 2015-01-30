#!/bin/awk -f
BEGIN { 
    FS = " "
    print "ngcid,yearOfDiscovery,firstname,middlenames,lastname,yearOfBirth,yearOfDeath,telType,telInch"
} 
{
    if (NR <= 3 || NR > 7843) { next }
    middlenames = null
    firstname = $3
    
    if ($(NF-2) ~ "Eye") { 
        yearOfDiscovery = $(NF-5)
        telType = $(NF-3) " " $(NF-2)
        telInch = $(NF-4)
        if ($(NF-6) ~ "Sufi" || $(NF-6) ~ "Soli") {
            lastname = $(NF-7) " " $(NF-6)
            yearOfBirth = $(NF-11)
            yearOfDeath = $(NF-9)
        } else {
            lastname = $(NF-6)
            yearOfBirth = $(NF-10)
            yearOfDeath = $(NF-8)
            for (i = (NF-12); i>3; --i) middlenames = $i " " middlenames
        }
    } else {
        yearOfDiscovery = $(NF-4)
        telType = $(NF-2)
        telInch = $(NF-3)
        if ($(NF-5) ~ "Cheseaux" || $(NF-5) ~ "Lacaille" || $(NF-5) ~ "Peiresc" || $(NF-5) ~ "Struve" || $(NF-5) ~ "Auwers" || $(NF-5) ~ "Pellepoix" || $(NF-5) ~ "Mairan") {
            lastname = $(NF-6) " " $(NF-5)
            yearOfBirth = $(NF-10)
            yearOfDeath = $(NF-8) 
            for (i = (NF-13); i>3; --i) middlenames = $i " " middlenames
        } else {
            lastname = $(NF-5)
            yearOfBirth = $(NF-9)
            yearOfDeath = $(NF-7)
            for (i = (NF-11); i>3; --i) middlenames = $i " " middlenames
        }
    }

    if (telType ~ "-") { telType = null }
    if (telInch ~ "-") { telInch = null }
    if (lastname ~ "-") { lastname = null }
    if (middlenames ~ "Parsons,.*") { middlenames = null }
    if (yearOfDeath ~ "?") {yearOfDeath = null}
    if (yearOfBirth ~ "?") {yearOfBirth = null}

    sub(/\(/, "", yearOfBirth)
    sub(/\)/, "", yearOfDeath)
    sub(/ $/, "", middlenames)

    printf "%04d,%d,%s,%s,%s,%s,%s,%s,%s\n",$2,yearOfDiscovery,firstname,middlenames,lastname,yearOfBirth,yearOfDeath,telType,telInch

}

