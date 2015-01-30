#!/usr/bin/awk -f
{
   if($0 ~ /.*FFFFFF">NGC.*/) {
       id = gensub(/.*FFFFFF">NGC\s+([[:digit:]]+).*/,"\\1","g",$0)
       #print "id: "id 
   }
  
  if($0 ~ /.+Right Ascension \(2000\)/) {
      ra = gensub(/^.*Right Ascension \(2000\).*<b>([[:digit:]]{1,2}h.*[[:digit:]]+[sm])<\/b>.*/,"\\1",$0)
      de = gensub(/^.*Declination \(2000\):&nbsp;&nbsp;<\/b><font color="#FFFFC0"><b>([+-][[:digit:]]{1,2}&ordm;\s[[:digit:]]{1,2}'\s[[:digit:]]{1,2}")<\/b>.*/,"\\1",$0)
      sub(/&ordm;/,"°",de)
      type = gensub(/^.*Object Type:&nbsp;&nbsp;<\/b><font color="#FFFFC0"><b>([[:alnum:][:space:]\.\/]+[[:alnum:]])<\/b>.*/,"\\1",$0)
      ma = gensub(/^.*Visual Magnitude:&nbsp;&nbsp;<\/b><font color="#FFFFC0"><b>([[:alnum:]]+\.[[:alnum:]]|----)<\/b>.*/,"\\1",$0)
      sub(/----/,"",ma)
      constellation = gensub(/^.*Constellation:&nbsp;&nbsp;<\/b><font color="#FFFFC0"><b>([[:alnum:][:space:]]+[[:alnum:]])<\/b>.*/,"\\1",$0)
      
  }
    
}END{
    print id",,"type","constellation","ra","de","ma","
}
