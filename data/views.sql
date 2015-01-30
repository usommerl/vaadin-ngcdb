create view view_images as 
    select i.id IID, p.abbr PID, i.description 
    from images i, imageproviders p 
    where i.providerid = p.abbr;

create view view_searchImageComponent as 
    select n.id NGCID, n.objecttypeid OID, i.* 
    from view_images i, imagerelations r, ngcobjects n 
    where IID = r.imageid and r.ngcobjectid = n.id order by IID;

create view view_searchObjectComponent as    
    select n.id NGCID, n.discovererid DID, o.name OBJECTTYPE, n.objecttypeid OID, c.name CONSTELLATION, 
           n.constellationid CID, n.yearofdiscovery, n.ra, n.dec, n.m, c.meaning, d.firstname, 
           d.middlenames, d.lastname, d.yearofbirth, d.yearofdeath 
    from ngcobjects n, objecttypes o, constellations c, discoverers d
    where n.objecttypeid = o.id and n.constellationid = c.abbr and n.discovererid = d.id; 
