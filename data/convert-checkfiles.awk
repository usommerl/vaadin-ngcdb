#!/bin/awk -f
# generates script for execution on kain.imn.htwk-leipzig.de

BEGIN{
    FS = "|"
    print "#!/usr/bin/bash"
    print " "
}
{
    if (NR < 2 || !$0) { next }
    print "FILE=/home/usommerl/mmdb-data/ngc-images/"$2
    print "if [ ! -f $FILE ];"
    print "then"
    print "   echo \"$FILE does not exist!\""
    print "fi"
    print " "
}
