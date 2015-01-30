create table images (
 id number constraint images_pk primary key,
 description varchar2(3000),
 image ORDSYS.ORDImage,
 imageSignature ORDSYS.ORDImageSignature,
 providerID varchar2(4),
 constraint fk_images foreign key (providerID) references imageproviders
);

prompt 'Insert images'
declare
   type t_collection is table of varchar2(4) index by varchar2(20);
   collection t_collection;
   imageObj ORDSYS.ORDImage;
   ctx RAW(4000) := null;
   key varchar2(20);
   counter number := 1;
begin
collection('heic0910s.jpg') := 'ESA';
collection('aat041.jpg') := 'AAO';
collection('eso0949n.jpg') := 'ESO';
collection('uks012.jpg') := 'AAO';
collection('eso9948f.jpg') := 'ESO';
collection('aat118.jpg') := 'AAO';
collection('uks013.jpg') := 'AAO';
collection('eso0934a.jpg') := 'ESO';
collection('eso1006a.jpg') := 'ESO';
collection('aat038.jpg') := 'AAO';
collection('uks001.jpg') := 'AAO';
collection('heic0706a.jpg') := 'ESA';
collection('uks009.jpg') := 'AAO';
collection('aat026.jpg') := 'AAO';
collection('eso0834a.jpg') := 'ESO';
collection('aat014.jpg') := 'AAO';
collection('aat065.jpg') := 'AAO';
collection('int001.jpg') := 'INT';
collection('eso1033a.jpg') := 'ESO';
collection('aat053.jpg') := 'AAO';
collection('uks017a.jpg') := 'AAO';
collection('eso1201a.jpg') := 'ESO';
collection('aat054.jpg') := 'AAO';
collection('aat035a.jpg') := 'AAO';
collection('eso1101a.jpg') := 'ESO';
collection('eso0926a.jpg') := 'ESO';
collection('aat031.jpg') := 'AAO';
collection('aat039.jpg') := 'AAO';
collection('eso0938a.jpg') := 'ESO';
collection('aat027.jpg') := 'AAO';
collection('aat100.jpg') := 'AAO';
collection('eso1005a.jpg') := 'ESO';
collection('int002.jpg') := 'INT';
collection('heic0817a.jpg') := 'ESA';
collection('eso1017a.jpg') := 'ESO';
collection('aat007a.jpg') := 'AAO';
collection('aat055.jpg') := 'AAO';
collection('uks026.jpg') := 'AAO';
collection('eso1205a.jpg') := 'ESO';
collection('aat019a.jpg') := 'AAO';
collection('eso1105a.jpg') := 'ESO';
collection('aat044.jpg') := 'AAO';
collection('aat014a.jpg') := 'AAO';
collection('uks015.jpg') := 'AAO';
collection('heic1104a.jpg') := 'ESA';
collection('aat032.jpg') := 'AAO';
collection('heic0912a.jpg') := 'ESA';
collection('aat101.jpg') := 'AAO';
collection('eso1109a.jpg') := 'ESO';
collection('eso0925a.jpg') := 'ESO';
collection('aat021.jpg') := 'AAO';
collection('aat038a.jpg') := 'AAO';
collection('aat029.jpg') := 'AAO';
collection('aat102.jpg') := 'AAO';
collection('int003.jpg') := 'INT';
collection('eso1009a.jpg') := 'ESO';
collection('aat060.jpg') := 'AAO';
collection('aat017.jpg') := 'AAO';
collection('heic0804a.jpg') := 'ESA';
collection('aat068.jpg') := 'AAO';
collection('uks031.jpg') := 'AAO';
collection('int004.jpg') := 'INT';
collection('aat056.jpg') := 'AAO';
collection('eso0949a.jpg') := 'ESO';
collection('eso0544a.jpg') := 'ESO';
collection('uks028.jpg') := 'AAO';
collection('aat014b.jpg') := 'AAO';
collection('opo9935e.jpg') := 'ESA';
collection('heic0711a.jpg') := 'ESA';
collection('aat018a.jpg') := 'AAO';
collection('uks015a.jpg') := 'AAO';
collection('uks005.jpg') := 'AAO';
collection('eso0848a.jpg') := 'ESO';
collection('aat103.jpg') := 'AAO';
collection('aat018.jpg') := 'AAO';
collection('aat061.jpg') := 'AAO';
collection('eso0104a.jpg') := 'ESO';
collection('aat069.jpg') := 'AAO';
collection('uks032.jpg') := 'AAO';
collection('int005.jpg') := 'INT';
collection('aat057.jpg') := 'AAO';
collection('eso1008a.jpg') := 'ESO';
collection('eso0936a.jpg') := 'ESO';
collection('aat007.jpg') := 'AAO';
collection('aat058.jpg') := 'AAO';
collection('ape.jpg') := 'PSSC';
collection('uks029.jpg') := 'AAO';
collection('aat069a.jpg') := 'AAO';
collection('eso1003a.jpg') := 'ESO';
collection('aat097.jpg') := 'AAO';
collection('heic0703a.jpg') := 'ESA';
collection('eso1031b.jpg') := 'ESO';
collection('opo0501a.jpg') := 'ESA';
collection('tarantula.jpg') := 'ESO';
collection('uks010.jpg') := 'AAO';
collection('eso1208a.jpg') := 'ESO';
collection('aat035.jpg') := 'AAO';
collection('uks006.jpg') := 'AAO';
collection('aat116.jpg') := 'AAO';
collection('aat023.jpg') := 'AAO';
collection('aat074.jpg') := 'AAO';
collection('aat017a.jpg') := 'AAO';
collection('heic0615a.jpg') := 'ESA';
collection('heic0911b.jpg') := 'ESA';
collection('aat062.jpg') := 'AAO';
collection('eso1103a.jpg') := 'ESO';
collection('uks026a.jpg') := 'AAO';
collection('int006.jpg') := 'INT';
collection('aat012.jpg') := 'AAO';
collection('aat063.jpg') := 'AAO';
collection('aat008.jpg') := 'AAO';
collection('uks022.jpg') := 'AAO';
collection('aat059.jpg') := 'AAO';
collection('eso9846a.jpg') := 'ESO';
collection('aat047.jpg') := 'AAO';
collection('aat100a.jpg') := 'AAO';
collection('aat009.jpg') := 'AAO';
collection('aat098.jpg') := 'AAO';
collection('aat056a.jpg') := 'AAO';
collection('uks023.jpg') := 'AAO';
collection('eso0650a.jpg') := 'ESO';
collection('eso1119a.jpg') := 'ESO';
collection('aat040.jpg') := 'AAO';
collection('aat048.jpg') := 'AAO';
collection('uks011.jpg') := 'AAO';
collection('eso0930a.jpg') := 'ESO';
collection('aat036.jpg') := 'AAO';
collection('uks006a.jpg') := 'AAO';
collection('aat012a.jpg') := 'AAO';
collection('aat075.jpg') := 'AAO';
collection('heic0911c.jpg') := 'ESA';
collection('eso9946a.jpg') := 'ESO';
collection('eso1207a.jpg') := 'ESO';
collection('uks008.jpg') := 'AAO';
collection('aat075a.jpg') := 'AAO';
collection('opo0624a.jpg') := 'ESA';
collection('aat013.jpg') := 'AAO';
collection('uks013a.jpg') := 'AAO';
collection('aat064.jpg') := 'AAO';
collection('aat036a.jpg') := 'AAO';
collection('aat052.jpg') := 'AAO';
collection('aat031a.jpg') := 'AAO';
collection('eso0907a.jpg') := 'ESO';
collection('aat099.jpg') := 'AAO';
collection('uks024.jpg') := 'AAO';

key := collection.first;
while key is not null loop
   dbms_output.put_line (collection(key));
   insert into images values (counter,null,ORDSYS.ORDImage.init(),ORDSYS.ORDImageSignature.init(),(select abbr from imageproviders where abbr = collection(key)));

   select image into imageObj from images where id = counter for update;
   imageObj.setSource('file','IMGDIR10',key);
   imageObj.setProperties;
   imageObj.import(ctx);
   update images set image = imageObj where id = counter;
   counter := counter + 1;
   key := collection.next(key);
end loop;
commit;
end;
/

prompt 'Create basic lexer and storage preference'
begin
ctx_ddl.create_preference('lexer', 'BASIC_LEXER' );
ctx_ddl.set_attribute ( 'lexer', 'mixed_case', 'NO' );
ctx_ddl.create_preference('storage', 'BASIC_STORAGE');
ctx_ddl.set_attribute('storage', 'I_TABLE_CLAUSE', 'tablespace INDX');
ctx_ddl.set_attribute('storage', 'K_TABLE_CLAUSE', 'tablespace INDX');
ctx_ddl.set_attribute('storage', 'R_TABLE_CLAUSE', 'tablespace INDX');
ctx_ddl.set_attribute('storage', 'N_TABLE_CLAUSE', 'tablespace INDX');
ctx_ddl.set_attribute('storage', 'I_INDEX_CLAUSE', 'tablespace INDX');
ctx_ddl.set_attribute('storage', 'P_TABLE_CLAUSE', 'tablespace INDX');
end;
/

prompt 'Create context index for image descriptions'
create index descriptionIndex on images ( description )
    indextype is ctxsys.context
    parameters ( 'LEXER lexer STORAGE storage SYNC (ON COMMIT)' );

prompt 'Insert descriptions'
update images
set description = 'This is the first image of a celestial object taken with the newly repaired Advanced Camera for Surveys (ACS). The camera was restored to operation during the STS-125 Servicing Mission to upgrade the NASA/ESA Hubble Space Telescope. The barred spiral galaxy NGC 6217 was photographed on 13 June and 8 July 2009, as part of the initial testing and calibration of Hubble''s ACS. The galaxy lies 6 million light-years away in the north circumpolar constellation Ursa Major.'
where id = (select id from images i where i.image.getSourceName() = 'heic0910s.jpg');

update images
set description = 'This galaxy is of interest because of its similarity to the Large Magellanic Cloud, (LMC) our nearest extra-galactic neighbour. Like the LMC, its light comes predominantly from young stars, which are hotter than the Sun and give the galaxy a bluish colour. However, because this galaxy is over 80 million light-years distant we see only the integrated light of millions of unresolved stars, rather than the individuals we see in the LMC. NGC 4027 has a somewhat distorted appearance and an elongated spiral arm, probably due to the gravitational effect of a smaller companion galaxy, not visible in this photograph but rather obvious on a much deeper image. NGC 4027 is less than half a degree south of the Antennae interacting galaxies.'
where id = (select id from images i where i.image.getSourceName() = 'aat041.jpg');

update images
set description = 'This VISTA image shows the spectacular star-forming region known as the Flame Nebula, or NGC 2024, in the constellation of Orion (the Hunter) and its surroundings. In views of this evocative object in visible light the core of the nebula is completely hidden behind obscuring dust, but in this VISTA view, taken in infrared light, the cluster of very young stars at the object''s heart is revealed. The wide-field VISTA view also includes the glow of the reflection nebula NGC 2023, just below centre, and the ghostly outline of the Horsehead Nebula (Barnard 33) towards the lower right. The bright bluish star towards the right is one of the three bright stars forming the Belt of Orion. The image was created from VISTA images taken through J, H and Ks filters in the near-infrared part of the spectrum. The image shows the full area of the VISTA field and is one degree by 1.5 degrees in extent. The total exposure time was 14 minutes.'
where id = (select id from images i where i.image.getSourceName() = 'eso0949n.jpg');

update images
set description = 'The star-forming nebulae NGC 6334 (UKS 11) and NGC 6357 show no evidence of a blue component in their colour - indeed, the blue-light plate used in these 3-colour pictures had no nebulous image at all - nor is there any obvious sign of the bright blue stars normally found in these objects. They are excellent examples of the phenomenon known as ''interstellar reddening'', the selective removal of blue light by minute particles of dust in the line of sight. This accounts for both the ruddy hue and apparent absence of blue stars. The hot stars are present but only some of the red part of their light is seen so they are not conspicuous. These nebulae are quite nearby (5500 light years) in the direction of Scorpius, but located close to the Galactic plane and buried in the dust of the Milky Way. Careful measurement of the colour of stars associated with the nebulae indicate that they are dimmed by a factor of about 10 in the green part of the spectrum, much more in the blue, but relatively little at red wavelengths. The scattering of bright stars seen here are in the foreground so are relatively unaffected by interstellar reddening. Some care has been taken to ensure that these images are as close to true-colour as possible. '
where id = (select id from images i where i.image.getSourceName() = 'uks012.jpg');

update images
set description = 'This photo shows a three colour composite of the well-known Crab Nebula (also known as Messier 1), as observed with the FORS2 instrument in imaging mode in the morning of November 10, 1999. It is the remnant of a supernova explosion at a distance of about 6,000 light-years, observed almost 1,000 years ago, in the year 1054. It contains a neutron star near its center that spins 30 times per second around its axis (see below). In this picture, the green light is predominantly produced by hydrogen emission from material ejected by the star that exploded. The blue light is predominantly emitted by very high-energy ("relativistic") electrons that spiral in a large-scale magnetic field (so-called synchrotron emission). It is believed that these electrons are continuously accelerated and ejected by the rapidly spinning neutron star at the centre of the nebula and which is the remnant core of the exploded star. This pulsar has been identified with the lower/right of the two close stars near the geometric center of the nebula, immediately left of the small arc-like feature, best seen in ESO Press Photo eso9948. Technical information: ESO Press Photo eso9948 is based on a composite of three images taken through three different optical filters: B (429 nm; FWHM 88 nm; 5 min; here rendered as blue), R (657 nm; FWHM 150 nm; 1 min; green) and S II (673 nm; FWHM 6 nm; 5 min; red) during periods of 0.65 arcsec (R, S II) and 0.80 (B) seeing, respectively. The field shown measures 6.8 x 6.8 arcminutes and the images were recorded in frames of 2048 x 2048 pixels, each measuring 0.2 arcseconds. North is up; East is left.'
where id = (select id from images i where i.image.getSourceName() = 'eso9948f.jpg');

update images
set description = 'NGC 1316-17 are on the outskirts of a nearby cluster of galaxies in the southern constellation of Fornax, at a distance of about 60 million light years. At first glance, the optical image of these galaxies does not seem to be very unusual. However, closer inspection shows that the larger galaxy, the elliptical NGC 1316, has distinct dust lanes in its inner regions, and NGC 1317 is a strangely distorted spiral. The dust lanes strongly suggest that NGC 1316 has recently absorbed a dusty spiral galaxy, and that the merger is not yet complete. The colour picture also hints at faint arcs or shells of stars in the outer parts of the galaxy, another strong indication of recent merger activity. A much deeper picture reveals enormous loops and shell-like structures extending far beyond this photograph, again supporting the merger hypothesis. If any more evidence were needed, it is provided by radio astronomers, who see Fornax A as one of the strongest and largest sources in the sky, with radio lobes extending over several degrees of sky. However, unlike the faint optical extensions, the radio lobes extend roughly E-W across the sky. There is another southern galaxy with many of these characteristics -- dusty elliptical, faint outer shells and somewhat detached from a cluster of galaxies. This is NGC 5128, Centaurus A, a confimed merger remnant. '
where id = (select id from images i where i.image.getSourceName() = 'aat118.jpg');

update images
set description = 'Galaxies can be separated by their appearance into two broad groups, spirals and ellipticals. An example of a spiral galaxy, NGC 1365, is seen in the lower right corner of this picture. In contrast, most of the galaxies in this cluster are ellipticals, which contain little or no gas or evidence of star formation; indeed they are composed millions of rather old, yellowish stars. Unlike many of the stars in spiral systems, those in ellipticals have orbits which are not confined to a narrow plane, so the galaxy can have a shape anywhere between a perfect sphere and an American football. This kind of galaxy is the most common type in the photograph as it is in all of the nearby Universe. The picture also illustrates another distinctive property of ellipticals, their gregarious nature - they congregate in clusters, like this group of galaxies in > Fornax, 60 million light years distant. We also have a wider field view of the cluster that includes Fornax A (NGC 1316-17) and a much deeper image that shows how large these galaxies are.'
where id = (select id from images i where i.image.getSourceName() = 'uks013.jpg');

update images
set description = 'The second of three images of ESO''s GigaGalaxy Zoom project is a new and wonderful 340-million-pixel vista of the central parts of our galactic home, a 34 by 20-degree wide image that provides us with a view as experienced by amateur astronomers around the world. Taken by Stéphane Guisard, an ESO engineer and world-renowned astrophotographer, from Cerro Paranal, home of ESO''s Very Large Telescope, this second image directly benefits from the quality of Paranal''s sky, one of the best on the planet. The image shows the region spanning the sky from the constellation of Sagittarius (the Archer) to Scorpius (the Scorpion). The very colourful Rho Ophiuchi and Antares region features prominently to the right, as well as much darker areas, such as the Pipe and Snake Nebulae. The dusty lane of our Milky Way runs obliquely through the image, dotted with remarkable bright, reddish nebulae, such as the Lagoon and the Trifid Nebulae, as well as NGC 6357 and NGC 6334. This dark lane also hosts the very centre of our Galaxy, where a supermassive black hole is lurking. The image was obtained by observing with a 10-cm Takahashi FSQ106Ed f/3.6 telescope and a SBIG STL CCD camera, using a NJP160 mount. Images were collected through three different filters (B, V and R) and then stitched together. This mosaic was assembled from 52 different sky fields made from about 1200 individual images totalling 200 hours exposure time, with the final image having a size of 24 403 x 13 973 pixels. Note that the final, full resolution image is only available through Stéphane Guisard.'
where id = (select id from images i where i.image.getSourceName() = 'eso0934a.jpg');

update images
set description = 'This wide-field view of the Orion Nebula (Messier 42), lying about 1350 light-years from Earth, was taken with the VISTA infrared survey telescope at ESO''s Paranal Observatory in Chile. The new telescope''s huge field of view allows the whole nebula and its surroundings to be imaged in a single picture and its infrared vision also means that it can peer deep into the normally hidden dusty regions and reveal the curious antics of the very active young stars buried there. This image was created from images taken through Z, J and Ks filters in the near-infrared part of the spectrum. The exposure times were ten minutes per filter. The image covers a region of sky about one degree by 1.5 degrees.'
where id = (select id from images i where i.image.getSourceName() = 'eso1006a.jpg');

update images
set description = 'These two star-formation regions appear side by side in Carina and seem to be linked as parts of an extensive nebula. However, the apparent intimacy is a line-of-sight effect because these two objects are at quite different distances from the Sun. The curious looped nebula NGC 3576 is about 7000 light years from us while its neighbour NGC 3603 is more than twice as far away. That NGC 3603 is the more distant is confirmed by its colour, which is a ruddier red than the pinkish hue of NGC 3576. The change in colour is due to absorption of the blue-light component of the nebulosity by dust particles in the much longer line of sight. This effect is known as interstellar reddening, though it would be better described as ''de-blueing''. It is also seen in the Horsehead nebula.'
where id = (select id from images i where i.image.getSourceName() = 'aat038.jpg');

update images
set description = 'This distinctive red emission nebula (IC 434) is the result of radiation from sigma Orionis interacting with the surface of a dusty cloud of gas from which projects the dark shape of the head of a horse. Sigma is the second brightest star in the picture and is at about the same distance from the Sun as the nebula. The brightest star here is zeta Orionis, easily visible to the unaided eye as the easternmost star in the line of three which form Orion''s Belt. Partly obscured by the glare of zeta is the curious yellowish nebula NGC 2024, whose energy comes from stars hidden in the dark lane, while other nebulae simply reflect the light of embedded hot stars and appear blue. All the nebulous objects and the dark cloud of dust that hides distant stars are about 1350 light years away.'
where id = (select id from images i where i.image.getSourceName() = 'uks001.jpg');

update images
set description = 'The barred spiral galaxy NGC 1672, showing up clusters of hot young blue stars along its spiral arms, and clouds of hydrogen gas glowing in red. Delicate curtains of dust partially obscure and redden the light of the stars behind them. NGC 1672''s symmetric look is emphasised by the four principal arms, edged by eye-catching dust lanes that extend out from the centre.'
where id = (select id from images i where i.image.getSourceName() = 'heic0706a.jpg');

update images
set description = 'The Rosette Nebula exhibits a striking circular symmetry which gives it the appearance of a partly opened rose, an allusion further enhanced by the rich red hues seen in this colour photograph. The colours here are real, but the eye is insensitive to the colour of faint light, so they remain unseen by the human eye, even with the largest telescopes. Near the centre of the nebula is a cluster of blue stars catalogued as NGC 2244. These stars are responsible for making the nebula visible and for creating the hollowed-out central cavity. This cluster of stars formed in darkness from the gas and traces of dust which now surrounds it, less than a million years ago. NGC 2244 is thus very young on the cosmic timescale, but its existence, along with many others in the Milky Way, is vivid evidence that our Galaxy is actively producing stars. The gas and dust at the centre of the nebula have been forced away from the bright stars by radiation pressure and the intense stellar wind which is often associated with very hot stars, forming a hollow centred on the cluster. This will gradually expand and dissipate until the stars are free from nebulosity. Perhaps eventually there will be a young open cluster in Monoceros looking like the young open cluster NGC 3293. '
where id = (select id from images i where i.image.getSourceName() = 'uks009.jpg');

update images
set description = 'NGC 6822 is one of the nearest galaxies to the Milky Way and is thus a member of a small cluster known as the Local Group to which our Galaxy belongs. It is close enough to be resolved into individual stars, though because of its distance (about 1.8 million light years) only the brightest are seen, even with a telescope as powerful as the AAT. The galaxy is in the direction of Sagittarius, so is seen through a rich field of stars. Like the nearby Large Magellanic Cloud, NGC 6822 seems to be without symmetry and is classified as an irregular. At one end of a prominent bar a few clouds of glowing gas can be seen; at the other, bright bluish stars are scattered out into what appears to be the first signs of a straggling spiral arm.'
where id = (select id from images i where i.image.getSourceName() = 'aat026.jpg');

update images
set description = 'This new portrait of the bright star-forming region NGC 346, in which different wavelengths of light swirl together like watercolours, reveals new information about how stars form. NGC 346 is located 210,000 light-years away in the Small Magellanic Cloud, a neighbouring dwarf galaxy of the Milky Way. The image is based on data from ESA XMM-Newton (X-rays; blue), ESO''s New Technology Telescope (visible light; green), and NASA''s Spitzer (infrared; red). The infrared light shows cold dust, while the visible light denotes glowing gas, and the X-rays represent very hot gas. Ordinary stars appear as blue spots with white centres, while young stars enshrouded in dust appear as red spots with white centres.'
where id = (select id from images i where i.image.getSourceName() = 'eso0834a.jpg');

update images
set description = 'The region around the 4.7 magnitude star S Mon is a fascinating mixture of red fluorescent hydrogen and dark, obscuring dust lanes. Some dust patches are close enough to bright stars to reflect light from them; these appear blue for the same reason that the day-time sky is blue - because some of the interstellar particles preferentially scatter blue light. Some of the wispy tendrils of nebulosity are Herbig-Haro objects, jets of matter ejected from newly-formed stars still hidden within the nebula. About 250 stars have been recognised as members of NGC 2264 which is in Monoceros at a distance of about 2700 light years.'
where id = (select id from images i where i.image.getSourceName() = 'aat014.jpg');

update images
set description = 'NGC 4038 and 4039 are the well-known pair of interacting galaxies that show two broadly curved tails of stars, the ''antennae'', extending a considerable distance from the action. This distinctive display is seen on a deeper deep image and gives the structure its popular name: it seems to have distracted attention from the interacting galaxies themselves. It is possible that one of the two disc galaxies involved was a ''gas-less spiral'' (S0), because the most southerly of the pair is distinctly yellow, while the outer parts its companion are bluer. The colour picture reveals the burst of star formation triggered by the encounter, the large numbers of pink emission nebulae in the inter-galaxy region and the location of the numerous dark, brownish-yellow clouds of dust. The yellow nuclei of the two galaxies are also still visible in the colour picture as separate entities. The galaxies are in Corvus at a distance of about 45 million light years.'
where id = (select id from images i where i.image.getSourceName() = 'aat065.jpg');

update images
set description = 'The nearest comparable spiral galaxy to the Milky Way is M31 (NGC 224), the great galaxy in Andromeda. It is visible to the unaided eye and has been known as a curious hazy patch since ancient times. Only in the last 75 years has its nature as a distant city of stars like the Milky Way become apparent. This picture covers almost half a degree of sky (about the size of the full moon), but wide angle telescopes show the galaxy to be over three degrees long at its widest. Here we see only the central part of M31, the huge mass of stars that are in orbit around its nucleus. Silhouetted against this starry background are tangled sheets and curtains of dust, very reminiscent of dust clouds we see in our own galaxy. M31 is in the Local Group of galaxies of which the Milky Way is the other prominent member. These galaxies are gravitationally bound to each other and do not share in the general expansion of the universe. M31 and the Milky Way are approaching each other at a velocity of about 300 km per second, which is a very modest speed on the cosmic scale. Like all the images on these pages, this picture was made from three black and white glass negatives. Some care has been taken to ensure that the colours seen here are realistic. '
where id = (select id from images i where i.image.getSourceName() = 'int001.jpg');

update images
set description = 'This VISTA image shows the spectacular 30 Doradus star-forming region, also called the Tarantula Nebula. At its core is a large cluster of stars known as R 136, in which some of the most massive stars known are located. This infrared image, made with ESO''s VISTA survey telescope, is from the VISTA Magellanic Cloud Survey. The project will scan a vast area - 184 square degrees of the sky (corresponding to almost one thousand times the apparent area of the full Moon), including our nearby neighbouring galaxies, the Large and Small Magellanic Clouds. The end result will be a detailed study of the star formation history and three-dimensional geometry of the Magellanic system. This image was created from images taken through Y, J and Ks filters in the near-infrared part of the spectrum (coloured blue, green and red respectively). The exposure times were 40, 47 and 81 minutes per filter respectively. The image covers a region of sky about 52 by 70 arcminutes.'
where id = (select id from images i where i.image.getSourceName() = 'eso1033a.jpg');

update images
set description = 'Messier 87 (NGC 4486) lies near the centre of the nearby cluster of galaxies in Virgo at a distance of about 50 million light years. Although the physical boundaries of elliptical galaxies are not well defined, (see deep image) their mass can be, and by any standards M87 is enormous. It contains several thousand billion stars. Associated with this giant galaxy are large numbers of globular clusters, visible in this photograph as the cloud of slightly fuzzy objects around it. Like all ellipticals, M 87 is composed mainly of old stars and is largely devoid of the materials needed to make new ones. The galaxy is not inert however; high energy X-rays have been detected from an extensive outer halo and the galaxy itself is also known as Virgo A, the strongest radio source in the Virgo cluster, which emerges as a jet to the north-west (upper right) of the galaxy. The optical counterpart of the jet is just visible against the glow of the galaxy itself. The source for this extreme behavior is probably a massive black hole at the centre of the galaxy.'
where id = (select id from images i where i.image.getSourceName() = 'aat053.jpg');

update images
set description = 'The Small Magellanic Cloud (SMC) is the second nearest galaxy to the Milky Way, (the LMC being the nearest) and is at the distance of about 240,000 light years in the constellation of Tucana, quite close enough for it to be resolved into individual stars on this colour picture made from plates taken on the UK Schmidt Telescope. The shape of the SMC defies description and it is therefore classified as an ''irregular'' galaxy. However, since galaxies show a strong tendency to be symmetrical and irregulars are rather rare we could be seeing first hand evidence of its recent tidal disruption by the combined effects of both our Galaxy and the LMC. Since the SMC is the least massive of the three it is the most likely member of this interacting trio to be seriously distorted by the encounter. The evidence is that the SMC is elongated more or less along our line of sight, as though we are looking into sausage-shaped galaxy from one end. The large globular cluster at right is 47 Tucanae, while a smaller one at the top of the picture is NGC 362. It is about 30,000 light years distant, twice as far away as 47 Tuc.'
where id = (select id from images i where i.image.getSourceName() = 'uks017a.jpg');

update images
set description = 'This image of the Omega Nebula (Messier 17), captured by ESO''s Very Large Telescope (VLT), is one of the sharpest of this object ever taken from the ground. It shows the dusty, rosy central parts of the famous star-forming region in fine detail.'
where id = (select id from images i where i.image.getSourceName() = 'eso1201a.jpg');

update images
set description = 'NGC 1566 is the brightest member of a nearby galaxy group in Dorado and is at a distance of about 50 million light years. It has beautifully symmetrical, tightly-wound spiral arms, which on deep images appear to almost encircle the galaxy. This striking object is also of interest because it has a very luminous nucleus which has many of the characteristics of a quasar, though it is much less energetic. Galaxies of this type are known as Seyfert galaxies, after Carl Seyfert who first recognised their peculiar nature in 1943. The active region at the centre of NGC 1566 has recently been found to vary on a timescale of less than a month, which indicates that it is extremely compact. Spectra show that hot gas near the tiny nucleus is moving at an abnormally high velocity, usually an indication that it may be in orbit around a massive black hole at the heart of NGC 1566.'
where id = (select id from images i where i.image.getSourceName() = 'aat054.jpg');

update images
set description = 'In the hollowed-out centre of the Rosette nebula in Monoceros lies NGC 2244, the cluster of young stars recently formed there. The cluster has itself created the cavity, radiation pressure and stellar winds from the stars blowing the gas and dust away from the young cluster. The hottest (and brightest) members of the group are seen as distinctly blue on this photograph, a colour corresponding to a surface temperature around 20,000K which may be compared with the Sun''s 5500K. The nebula and its cluster is at a distance of about 4500 light years and shows many streaks and globules of dust, remnants of the cloud from which the stars formed.'
where id = (select id from images i where i.image.getSourceName() = 'aat035a.jpg');

update images
set description = 'This new infrared view of the star formation region Messier 8, often called the Lagoon Nebula, was captured by the VISTA telescope at ESO''s Paranal Observatory in Chile. This colour picture was created from images taken through J, H and Ks near-infrared filters, and which were acquired as part of a huge survey of the central parts of the Milky Way. The field of view is about 34 by 15 arcminutes.'
where id = (select id from images i where i.image.getSourceName() = 'eso1101a.jpg');

update images
set description = 'Three-colour composite mosaic image of the Eagle Nebula (Messier 16, or NGC 6611), based on images obtained with the Wide-Field Imager camera on the MPG/ESO 2.2-metre telescope at the La Silla Observatory. At the centre, the so-called "Pillars of Creation" can be seen. This wide-field image shows not only the central pillars, but also several others in the same star-forming region, as well as a huge number of stars in front of, in, or behind the Eagle Nebula. The cluster of bright stars to the upper right is NGC 6611, home to the massive and hot stars that illuminate the pillars. The "Spire" - another large pillar - is in the middle left of the image. This image is a composite of 3 filters in the visible range: B (blue), V (green) and R (red).'
where id = (select id from images i where i.image.getSourceName() = 'eso0926a.jpg');

update images
set description = 'At the heart of the Lagoon Nebula in Sagittarius lies the tiny Hourglass Nebula. This extremely bright object is associated with the blue star immediately to the right (west) of the Hourglass. This star is named Herschel 36 after its discoverer. John Herschel described M8 as ''A noble nebula'' and ''a fine and complicated nebula'', but he was clearly intrigued by the Hourglass which he compared to the nucleus of the Andromeda nebula, M31 as ''decidedly not stellar''. The tiny bright nebula that captures Herschel''s attention is energised partly by the bright star H36 and partly by a star which, for the present, remains hidden in the pinched waist of the Hourglass. The obscured star is only visible in infrared light which can penetrate the thick clouds of dust seen over much of the Lagoon Nebula and clearly evident in a recent Hubble Space Telescope photograph. These stars are probably less than 10,000 years old, about as old as the Hourglass itself, and are evidence of recent star-formation in this very dusty and active region. '
where id = (select id from images i where i.image.getSourceName() = 'aat031.jpg');

update images
set description = 'The stars that excite this unusual nebula in Carina are not visible on this photograph. They are hidden in the dusty cloud at the ''base'' (south) of the huge loops of nebulosity. This is material that has been blown out by radiation pressure and stellar winds from the concealed stars. Silhouetted against the tenuous loops are dark clouds of dust with bright rims which indicate the direction of the stars which excite the nebula. This large complex of gas and dust is at about the same distance as the much brighter Eta Carinae nebula, about 7000 light years away. '
where id = (select id from images i where i.image.getSourceName() = 'aat039.jpg');

update images
set description = 'Astronomers obtained this portrait of Barnard''s Galaxy using the Wide Field Imager attached to the 2.2-metre MPG/ESO telescope at ESO''s La Silla Observatory in northern Chile. Also known as NGC 6822, this dwarf irregular galaxy is one of the Milky Way''s galactic neighbours. The dwarf galaxy has no shortage of stellar splendour and pyrotechnics. Reddish nebulae in this image reveal regions of active star formation, wherein young, hot stars heat up nearby gas clouds. Also prominent in the upper left of this new image is a striking bubble-shaped nebula. At the nebula''s centre, a clutch of massive, scorching stars send waves of matter smashing into surrounding interstellar material, generating a glowing structure that appears ring-like from our perspective. Other similar ripples of heated matter thrown out by feisty young stars are dotted across Barnard''s Galaxy. The image was made from data obtained through four different filters (B, V, R, and H-alpha). The field of view is 35 x 34 arcmin.'
where id = (select id from images i where i.image.getSourceName() = 'eso0938a.jpg');

update images
set description = 'Very hot, massive stars lose substantial amounts of matter from their surfaces during much of their brief lives. Mass-loss is usually a fairly steady process but some stars occasionally develop instabilities and have major outbursts. This star has thrown off at least two distinct lots of material during its lifetime, the brightest and most recent being the bright lobes of NGC 6164-5 at the centre of the picture (see image AAT 21 ) while a much fainter rim of nebulosity can be seen at a considerable distance from the central star, indicating an earlier episode of violent ejection. The nebula is in Norma, in the southern Milky Way at a distance of about 4200 light years.'
where id = (select id from images i where i.image.getSourceName() = 'aat027.jpg');

update images
set description = 'The Sombrero, named after the broad-brimmed Mexican hat it superficially resembles, is probably the most famous galaxy in the sky. The light from this remarkable spiral system is dominated by the billions of old, faint stars that form the vast ''bulge'' around its tiny hidden nucleus. Most spirals, including the Milky Way, have clouds of old, faint stars around their nuclei, but in M104 the galaxy''s light is dominated by them. This effect is enhanced because disk of the galaxy is seen nearly edge-on and dust in its outer parts is in silhouette as it crosses the picture. Within the dusty disk are low contrast structures that show this galaxy to be a genuine spiral, immersed in an unusually large central bulge. The bulge is seen best on a deep image and is much bigger than it appears here. It also shows some extremely faint features that are suggestive of tidal tails -- merger remnants. The galaxy is about 65 million light years distant, on Virgo''s southern border.'
where id = (select id from images i where i.image.getSourceName() = 'aat100.jpg');

update images
set description = 'NGC 3603 is a starburst region : a cosmic factory where stars form frantically from the nebula''s extended clouds of gas and dust. Located 22,000 light-years away from the Sun, it is the closest region of this kind known in our galaxy, providing astronomers with a local test bed for studying the intense star formation processes, very common in other galaxies, but hard to observe in detail because of their large distance. The newly released image, obtained with the FORS instrument attached to one of the four 8.2-metre VLT Unit Telescopes at Cerro Paranal, Chile, is a three-colour combination of exposures acquired through visible and near-infrared (V, R, I) filters. This image portrays a wider field around the stellar cluster and reveals the rich texture of the surrounding clouds of gas and dust. The field of view is 7 arcminutes wide.'
where id = (select id from images i where i.image.getSourceName() = 'eso1005a.jpg');

update images
set description = 'At the heart of the nearby spiral galaxy M31 is a tiny, bright nucleus, seen to be slightly elongated on this colour picture. Hubble Space Telescope pictures show the nucleus to be a double structure, possibly the remains of the nucleus of another galaxy which has now been almost completely absorbed in M31. Around the binary nucleus swirls a huge cloud of mostly old, faint stars. These haze of stars is unresolved on the plates that were used to make this picture and have been removed by a photographic process known as ''unsharp masking''. This not only reveals the inner nucleus but also shows traces of dust which seem to stream into the bright central part of the galaxy. Studies of the stars around the nucleus strongly suggest that at the heart of M31 there lurks a black hole, accelerating stars close to it to abnormally high velocities. Similar effects are seen in the Milky Way, but in our galaxy the nucleus is hidden at optical wavelengths, so observations are made in the infrared and at radio wavelengths. '
where id = (select id from images i where i.image.getSourceName() = 'int002.jpg');

update images
set description = 'This stunning image of NGC 1275 was taken using the NASA/ESA Hubble Space Telescope''s Advanced Camera for Surveys in July and August 2006. It provides amazing detail and resolution of the fragile filamentary structures, which show up as a reddish lacy structure surrounding the central bright galaxy NGC 1275. These filaments are cool despite being surrounded by gas that is around 55 million degrees Celsius hot. They are suspended in a magnetic field which maintains their structure and demonstrates how energy from the central black hole is transferred to the surrounding gas. By observing the filamentary structure, astronomers were, for the first time, able to estimate the magnetic field''s strength. Using this information they demonstrated how the extragalactic magnetic fields have maintained the structure of the filaments against collapse caused by either gravitational forces or the violence of the surrounding cluster during their 100-million-year lifetime. This is the first time astronomers have been able to differentiate the individual threads making up such filaments to this degree. Astonishingly, they distinguished threads a mere 200 light-years across. By contrast, the filaments seen here can be a gaping 200 000 light-years long. The entire image is approximately 260 000 light-years across. Also seen in the image are impressive lanes of dust from a separate spiral galaxy. It lies partly in front of the giant elliptical central cluster galaxy and has been completed disrupted by the tidal gravitational forces within the galaxy cluster. Several striking filaments of blue newborn stars are seen crossing the image.'
where id = (select id from images i where i.image.getSourceName() = 'heic0817a.jpg');

update images
set description = 'Infrared view of the Cat''s Paw Nebula (NGC 6334) taken by VISTA. NGC 6334 is a vast region of star formation about 5500 light-years from Earth in the constellation of Scorpius. The whole gas cloud is about 50 light-years across. NGC 6334 is one of the most active nurseries of young massive stars in our galaxy, some nearly ten times the mass of our Sun and most born in the last few million years. The images were taken through Y, J and Ks filters (shown as blue, green and red respectively) and the exposure time was five minutes per filter. The field of view is about one degree across.'
where id = (select id from images i where i.image.getSourceName() = 'eso1017a.jpg');

update images
set description = 'NGC 5128 is in Centaurus in the southern sky, located not far above the Galactic plane, which accounts for the richness of the star field in which it is set. The circular, uniformly bright part of the galaxy is composed of several thousand million stars, most of them old and yellowish, as in an elliptical galaxy. However, unusually, this galaxy is girded by a dense dust lane which obscures and reddens the light of stars behind it while some younger, blue stars can be seen at the edges of the dust cloud. One of the nearer galaxies, 10 million light years away, NGC 5128 is also known as Centaurus A, the most powerful nearby radio source and is also a copious source of X- and gamma rays as well as visible and infrared radiation. This wide field view is just under a degree across, but the radio lobes extend many degrees of arc beyond the confines of this image.'
where id = (select id from images i where i.image.getSourceName() = 'aat007a.jpg');

update images
set description = 'Galaxies occur in a variety of shapes, but among the most eye-catching are the spirals, especially barred spirals. One of the finest in the sky is NGC 1365, the largest spiral in the southern constellation of Fornax, at a distance of about 60 million light years. This beautiful galaxy is about as massive as the Milky Way, itself a substantial galaxy. Not much is known about how galaxies take on their beautiful forms, but a good deal is known about their internal organisation. The obvious ''bar'' has the nucleus of the galaxy at its hub and is surrounded by masses of cooler stars that appear yellow on colour photographs. The bar itself is also yellowish, and has distinct dust lanes but it terminates abruptly in slender, curved arms that are lit by blue stars and the pink star-forming regions from which they spring. This galaxy is a member of the nearby Fornax cluster of galaxies that includes NGC 1316-17, the radio source Fornax A.'
where id = (select id from images i where i.image.getSourceName() = 'aat055.jpg');

update images
set description = 'The dust clouds of the Milky Way are mostly dark, as is evident from a normal camera view of this part of the sky. The dark clouds contain gas and dust and are tightly constrained to the plane of the Milky Way. The dust hosts simple compounds that have condensed on the tiny grains and these molecules can be detected by radio telescopes. However, here and there stars have formed from the molecular clouds, lighting up the darkness. The brightest nebulae here are M20 (top) and M8 (lower centre) can be seen with the unaided eye in Sagittarius, and were catalogued by Charles Messier over 200 years ago.'
where id = (select id from images i where i.image.getSourceName() = 'uks026.jpg');

update images
set description = 'ESO''s Visible and Infrared Survey Telescope for Astronomy (VISTA) has captured this unusual view of the Helix Nebula (NGC 7293), a planetary nebula located 700 light-years away. The coloured picture was created from images taken through Y, J and K infrared filters. While bringing to light a rich background of stars and galaxies, the telescope''s infrared vision also reveals strands of cold nebular gas that are mostly obscured in visible images of the Helix.'
where id = (select id from images i where i.image.getSourceName() = 'eso1205a.jpg');

update images
set description = 'This image is a slightly wider view than AAT 19. The Orion Nebula is famous for a number of reasons. It is the nearest bright nebula to us and can be seen with the naked eye. Its brightness led to it being the first nebula ever photographed (in 1882) and its proximity (1350 light years) means that we know more about it than any other star-forming region. It is also in a very active stage of star formation and it is perfectly placed for us to explore the intimate details of the birth of stars. The inner regions are glowing mainly in the red light of excited hydrogen, which together with some green emission from oxygen give the centre of the nebula a yellowish colour. The energy for this spectacular display comes from the small cluster of stars in the brightest part of the nebula. Three, five-minute exposures were used to make this picture, which covers a slightly wider field than AAT 19. An unsharp mask was used during the copying stage. '
where id = (select id from images i where i.image.getSourceName() = 'aat019a.jpg');

update images
set description = 'This new image of the reflection nebula Messier 78 was captured using the Wide Field Imager camera on the MPG/ESO 2.2-metre telescope at the La Silla Observatory, Chile. This colour picture was created from many monochrome exposures taken through blue, yellow/green and red filters, supplemented by exposures through a filter that isolates light from glowing hydrogen gas. The total exposure times were 9, 9, 17.5 and 15.5 minutes per filter, respectively.'
where id = (select id from images i where i.image.getSourceName() = 'eso1105a.jpg');

update images
set description = 'This object is the only extra-galactic nebula which can be seen with the unaided eye. It is a faint but distinct patch of light at the eastern end of the Large Magellanic Cloud, 170,000 light years distant in Dorado. A small telescope reveals narrow spindly tendrils of glowing gas which have been likened to the legs of a spider. The ''body'' of the spider is the bright nebula seen at the centre of the photograph, while at its core is an extremely dense clump of very hot stars, until recently thought to a single, unusually massive star known as 30 Doradus. The very hot stars of 30 Dor are responsible for making the nebula visible.'
where id = (select id from images i where i.image.getSourceName() = 'aat044.jpg');

update images
set description = 'The region around the 4.7 magnitude star S Mon is a fascinating mixture of red fluorescent hydrogen and dark, obscuring dust lanes. Some dust patches are close enough to bright stars to reflect light from them; these appear blue for the same reason that the day-time sky is blue - because some of the interstellar particles preferentially scatter blue light. Some of the wispy tendrils of nebulosity are Herbig-Haro objects, jets of matter ejected from newly-formed stars still hidden within the nebula. About 250 stars have been recognised as members of NGC 2264 which is in Monoceros at a distance of about 2700 light years. '
where id = (select id from images i where i.image.getSourceName() = 'aat014a.jpg');

update images
set description = 'In this picture we see the eastern end of the Large Magellanic Cloud in Dorado, where lies one of the most active star formation regions known. If this enormous complex of stars, gas and dust were at the distance of the Orion Nebula it would visible during the day and cover a quarter of the sky. While the Orion Nebula contains a mere handful of the hot blue stars which energise it, the Tarantula nebula has spawned many thousands in the region shown here, which surrounds a compact, brilliant cluster known as 30 Doradus. Like the Orion Nebula, the 30 Doradus region is a naked eye object for the keen sighted. It is however over one hundred times more distant! The Tarantula nebula is by far the biggest and most active star-forming region of the Large Magellanic Cloud and is much more massive than any of the many similar objects known in our own Galaxy.'
where id = (select id from images i where i.image.getSourceName() = 'uks015.jpg');

update images
set description = 'Star formation is one of the most important processes in shaping the Universe; it plays a pivotal role in the evolution of galaxies and it is also in the earliest stages of star formation that planetary systems first appear. Yet there is still much that astronomers don''t understand, such as how do the properties of stellar nurseries vary according to the composition and density of gas present, and what triggers star formation in the first place? The driving force behind star formation is particularly unclear for a type of galaxy called a flocculent spiral, such as NGC 2841 shown here, which features short spiral arms rather than prominent and well-defined galactic limbs.'
where id = (select id from images i where i.image.getSourceName() = 'heic1104a.jpg');

update images
set description = 'This wonderfully complex region at the heart of the NGC 3372 nebula was first described in detail by Sir John Herschel in 1838. He saw the bright circular shell visible in the upper part of the picture extending to the south to form a keyhole-shaped nebula. This luminous outline is no longer seen and the southern extension appears only as a dark dust cloud. It seems that the curious, explosively variable star Eta Carinae has enveloped itself in a cocoon of obscuring matter in the years since Herschel''s observations and light from the star is no longer able to illuminate the rim of the dust cloud. The nebula thrown off by eta Carinae in Herschel''s time has grown to the tiny orange nebula seen to the left of the dust cloud and is known as the Homunculus nebula. It has also ejected some rapidly moving spikes seen on a black and white photograph made some years ago at the f/8 focus of the AAT. Structure in the Homunculus itself is well seen on the famous HST picture. The whole nebula complex is in Carina at a distance of about 7000 light years. '
where id = (select id from images i where i.image.getSourceName() = 'aat032.jpg');

update images
set description = '2623'
where id = (select id from images i where i.image.getSourceName() = 'heic0912a.jpg');

update images
set description = 'This is one of many peculiar galaxies that populate the large southern constellation of Centaurus. This remarkable spiral galaxy seen almost edge-on, and the spiral structure is chaotic and difficult to discern. In part this is because the galaxy is itself extremely dusty, and it is seen through dust in the Milky Way. These effects together account for its yellowish hue, though patches of bluish stars can be seen. The dust in NGC 4945 absorbs most of the visible light, especially the blue light from the numerous bright stars known present within the galaxy. This energy is re-radiated at infrared wavelengths, which penetrate dust more readily, which is why the galaxy is found to be unusually bright in the infrared.'
where id = (select id from images i where i.image.getSourceName() = 'aat101.jpg');

update images
set description = 'This very detailed enhanced-colour image from ESO''s Very Large Telescope shows the dramatic effects of very young stars on the dust and gas from which they were born in the star-forming region NGC 6729. The baby stars are invisible in this picture, being hidden behind dust clouds at the upper left of the picture, but material they are ejecting is crashing into the surroundings at speeds of that can be as high as one million kilometres per hour. This picture was taken by the FORS1 instrument and records the scene in the light of glowing hydrogen and sulphur.'
where id = (select id from images i where i.image.getSourceName() = 'eso1109a.jpg');

update images
set description = 'Three-colour composite image of the Omega Nebula (Messier 17, or NGC 6618), based on images obtained with the EMMI instrument on the ESO 3.58-metre New Technology Telescope at the La Silla Observatory. North is down and East is to the right in the image. It spans an angle equal to about one third the diameter of the Full Moon, corresponding to about 15 light-years at the distance of the Omega Nebula. The three filters used are B (blue), V ("visual", or green) and R (red).'
where id = (select id from images i where i.image.getSourceName() = 'eso0925a.jpg');

update images
set description = 'Superficially similar to a planetary nebula, (e.g. the Helix nebula or the ''spiral'' planetary ) NGC 6164-5 is in reality a rather unusual object associated with a rather unusual star. The striking blue central star, known only as HD 148937, is the brightest member of a triple system of stars in orbit around each other. This extremely hot star is losing mass from its outer layers continuously, but occasionally more vigorous outbursts give rise to the symmetrical shells seen in this picture. The two catalogue numbers, NGC 6164 and 6165, refer to these shells as separate objects. The nebula is in the southern Milky Way, in Norma at a distance of about 4200 light years. '
where id = (select id from images i where i.image.getSourceName() = 'aat021.jpg');

update images
set description = 'These two star-formation regions appear side by side in Carina and seem to be linked as parts of an extensive nebula. However, the apparent intimacy is line-of-sight effect because these two objects are at quite different distances from the Sun. The curious looped nebula NGC 3576 is about 7000 light years from us while its neighbour NGC 3603 is more than twice as far away. That NGC 3603 is the more distant is confirmed by its colour, which is a ruddier red than the pinkish hue of NGC 3576. The change in colour is due to absorption of the blue-light component of the nebulosity by dust particles in the much longer line of sight. This effect is known as interstellar reddening, though it would be better described as ''de-blueing''. It is also seen in the Horsehead nebula. The wider field shows the calibration step wedges that are imprinted during the exposure of the plates that made the image to provide photometric and colour balance information. Some care has be taken with these images to show them in their true colours. '
where id = (select id from images i where i.image.getSourceName() = 'aat038a.jpg');

update images
set description = 'The central ''star'' of the three groups forming the asterism of Orion''s Sword is in reality a nebula, and is clearly nebulous to the unaided eye when seen under a dark sky. At the heart of the most luminous nebulosity shimmer a handful of stars known as the Trapezium cluster, visible in binoculars. These are the brightest members of a substantial cluster of stars, most of which are still hidden in the dusty recesses of the Orion nebula against which they are seen. The stars of the Trapezium provide much of the energy which makes the brilliant Orion Nebula visible and are at a distance of about 1350 light years. This image was made with three, 30-second exposures at the prime focus of the the Anglo-Australian Telescope, using a process that involved an unsharp mask. The three associated images (AAT 29a) and (AAT 29b) are made from the same AAT plates, and show how the basic data can be presented in different ways using unsharp masks with different characteristics. '
where id = (select id from images i where i.image.getSourceName() = 'aat029.jpg');

update images
set description = 'The nearest galaxy to the Milky Way is the Large Magellanic Cloud (LMC), which we see from a distance of 170,000 light years. It is inclined to our line of sight by about 40 degrees. Magellanic-type galaxies are quite rare, so we are lucky to have such a close view of such an unusual specimen. For purely statistical reasons edge-on galaxies are also rare, so we are especially fortunate to have in NGC 55 an example of a Magellanic-type galaxy seen edge-on which is also nearby. NGC 55 is at a distance of about 5 million light years, in the direction of the constellation of Sculptor. It is close enough for us to see it resolved into individual stars. With a big telescope like the AAT, the central regions look very much like the Milky Way seen with an ordinary camera. NGC 55 is a member of the Sculptor group, where the galaxies are few in number and well separated in space. It is probably for this reason that NGC 55 is not rich in star forming regions, because it is not interacting with any nearby companion galaxy, unlike the LMC, which is stirred up by interactions with both the Milky Way and the Small Magellanic Cloud.'
where id = (select id from images i where i.image.getSourceName() = 'aat102.jpg');

update images
set description = 'M31 is the finest and nearest large spiral galaxy in the sky, about 2 million light years away. Despite its distance it can be seen as an elongated streak with the unaided eye in northern skies and in a large telescope under good conditions it is clearly resolved into stars and star-forming regions. This picture shows less than half the galaxy but the spiral structure, star clouds and dust lanes are evident. Also here is one of M31''s close companions, the compact elliptical galaxy M32 (NGC 221), at upper left (NE). M31 and its companions belong to the Local Group of about 30 galaxies that includes the Milky Way and M31 as its most massive members as well as the Magellanic Clouds. This picture is about half a degree across and is of the same region as the frontispiece in Hubble''s famous book "The Realm of the Nebulae" (Harvard UP, 1936). In his illustration Hubble points out a Cepheid variable star, a globular cluster, a star cloud and open cluster as typical ingredients of a spiral galaxy. The star cloud is so conspicuous that it has its own New General Catalogue number, NGC 206 '
where id = (select id from images i where i.image.getSourceName() = 'int003.jpg');

update images
set description = 'The delicate nebula NGC 1788, located in a dark and often neglected corner of the Orion constellation, is revealed in this finely nuanced image. Although this ghostly cloud is rather isolated from Orion''s bright stars, their powerful winds and light have a strong impact on the nebula, forging its shape and making it a home to a multitude of infant suns. This image has been obtained using the Wide Field Imager on the MPG/ESO 2.2-metre telescope at ESO''s La Silla Observatory in Chile. It combines images taken through blue, green and red filters, as well as a special filter designed to let through the light of glowing hydrogen. The field is about 30 arcminutes across; North is up, and East to the left.'
where id = (select id from images i where i.image.getSourceName() = 'eso1009a.jpg');

update images
set description = 'Messier 87 (NGC 4486) is at the heart of the cluster of galaxies in Virgo and has a mass many times that of the Milky Way, itself no lightweight. Unlike our galaxy however, M87 is an elliptical galaxy. Though it appears more-or-less spherical on this photograph, a deep image shows it to be markedly elongated. Also unlike the Milky Way, M87 contains relatively little gas and dust. It is composed mainly of cool stars, which gives it a yellowish colour, in contrast to the blue of spiral galaxies. Despite the lack of star-forming materials, M87 is not a quiescent backwater. It is a powerful source of radio waves and the orbits of stars near its nucleus suggest they are held by a very massive, extremely compact core. Also, from the nucleus (but not seen here) extends a curious jet, all of which suggests that a massive black hole is hidden in the bright core of the galaxy.'
where id = (select id from images i where i.image.getSourceName() = 'aat060.jpg');

update images
set description = 'NGC 2997 is a fine southern spiral galaxy seen from a distance of about 45 million light years. It is in Antlia and is inclined at about 45 degrees to our line of sight, revealing its internal structure and giving the galaxy an oval appearance. Seen face-on, NGC 2997 would look rather like Messier 83. Like most spirals, the galaxy has two prominent spiral arms, which appear to originate in the yellow nucleus, are peppered with bright red blobs of ionised hydrogen which are similar to regions of star formation in our own Milky Way. Within these gas clouds are produced the hot blue stars which generate most of the light in the arms of the galaxy. A much older population of yellowish stars are concentrated around the nucleus. A much deeper image shows that the galaxy is much bigger than it appears above.'
where id = (select id from images i where i.image.getSourceName() = 'aat017.jpg');

update images
set description = 'The NASA/ESA Hubble Space Telescope has captured a new image of the galaxy NGC 1132 which is, most likely, a cosmic fossil - the aftermath of an enormous multi-galactic pile-up, where the carnage of collision after collision has built up a brilliant but fuzzy giant elliptical galaxy far outshining typical galaxies. NGC 1132, together with the small dwarf galaxies surrounding it, are dubbed a "fossil group" as they are most likely the remains of a group of galaxies that merged together in the recent past. In this Hubble image, NGC 1132 is seen surrounded by thousands of ancient globular clusters, swarming around the galaxy like bees around a hive. These globular clusters are likely to be the survivors of the disruption of their cannibalised parent galaxies that have been eaten by NGC 1132 and may reveal its merger history. In the background, there is a stunning tapestry of numerous galaxies that are much further away.'
where id = (select id from images i where i.image.getSourceName() = 'heic0804a.jpg');

update images
set description = 'The brightest cluster of stars in this picture was believed until recently to contain a single, uniquely massive object with the mass equivalent to 1000 suns, and was named as a star, 30 Doradus. Sophisticated image analysis techniques have been used to show that 30 Doradus is a very compact group of stars, many of which are massive, but not unimaginably so. The radiation from this star cluster is sufficient to excite a huge cloud of hydrogen gas in its vicinity so that it glows with its distinctive red colour. This picture is essentially a one minute exposure. A longer exposure would show that the curving tendrils of nebulosity are the brightest parts of the huge Tarantula nebula, one of the largest star-forming regions known anywhere. It is in the Large Magellanic Cloud, the nearest galaxy to the Milky Way, in the constellation of Dorado.'
where id = (select id from images i where i.image.getSourceName() = 'aat068.jpg');

update images
set description = 'The nearest moderately rich cluster of galaxies lies in the direction of Virgo. The richest part of the cluster is centred on the giant elliptical galaxies M84 and M86 which dominate this picture. However, the dynamical centre of the cluster is M87, to the lower left (south east) of this picture. On deep images, M87 is seen to be over half a degree long and somewhat distorted, suggesting recent merger activity, which is not surprising in such a relatively crowded environment. The whole cluster is receding with an average velocity of over 1000 km per second but there is sufficient variation around that value to suggest that it may be composed of more than one cloud of galaxies which is probably elongated along our line of sight. This image shows most of the ''chain'' of galaxies (curving to upper left) noted by the Armenian astronomer B. E. Markarian in the 1970s. Click here for bigger colour image, and here for a much deeper image of the cluster.'
where id = (select id from images i where i.image.getSourceName() = 'uks031.jpg');

update images
set description = 'If we could view the Milky Way from a distance of about 30 million light years it would look something like NGC 891. But galaxies that look like this are quite rare because the chance alignment of the thin disk of a spiral galaxy with our line of sight is unusual. A few degrees either side of its orientation and NGC 891 would be just another highly inclined spiral galaxy. From this unusual vantage point we can see in NGC 891 the surprising narrowness of the obscuring dust lane, a dark, slightly irregular band across the galaxy. We also see that it is yellowish, confirming that it is dust, which absorbs blue light, as in the Milky Way. Also similar to the Milky Way is the prominent central ''bulge'' corresponding to the rich star clouds in Sagittarius. However, unlike the Milky Way, NGC 891 is relatively isolated, undisturbed by neighbouring galaxies. If this was a distant view the Milky Way, the dust-lane would probably be distorted by interaction with the Magellanic Clouds, which would be prominent in the picture.'
where id = (select id from images i where i.image.getSourceName() = 'int004.jpg');

update images
set description = 'NGC 300 is among the least conspicuous members of a sparse cluster of galaxies that are scattered across the south galactic pole, ideally placed for study with the AAT. The three photographic plates from which this picture was made have been specially enhanced to emphasise the delicate structure of the galaxy, revealing that the light of the spiral arms is dominated by young, blue stars. Here and there along the arms, indeed largely responsible for defining them, are denser clumps of stars, some still associated with the gas from which they formed. Many stars are clearly visible as individuals, for the Sculptor Group is relatively nearby, about 8 million light years away.'
where id = (select id from images i where i.image.getSourceName() = 'aat056.jpg');

update images
set description = 'This image, the first to be released publicly from VISTA, the world''s largest survey telescope, shows the spectacular star-forming region known as the Flame Nebula, or NGC 2024, in the constellation of Orion (the Hunter) and its surroundings. In views of this evocative object in visible light the core of the nebula is completely hidden behind obscuring dust, but in this VISTA view, taken in infrared light, the cluster of very young stars at the object''s heart is revealed. The wide-field VISTA view also includes the glow of the reflection nebula NGC 2023, just below centre, and the ghostly outline of the Horsehead Nebula (Barnard 33) towards the lower right. The bright bluish star towards the right is one of the three bright stars forming the Belt of Orion. The image was created from VISTA images taken through J, H and Ks filters in the near-infrared part of the spectrum. The image shows about half the area of the full VISTA field and is about 40 x 50 arcminutes in extent. The total exposure time was 14 minutes.'
where id = (select id from images i where i.image.getSourceName() = 'eso0949a.jpg');

update images
set description = 'Area surrounding the stellar cluster NGC 2467, located in the southern constellation of Puppis ("The Stern"). With an age of a few million years at most, it is a very active stellar nursery, where new stars are born continuously from large clouds of dust and gas. The image, looking like a colourful cosmic ghost or a gigantic celestial Mandrill, contains the open clusters Haffner 18 (centre) and Haffner 19 (middle right: it is located inside the smaller pink region - the lower eye of the Mandrill), as well as vast areas of ionised gas. The bright star at the centre of the largest pink region on the bottom of the image is HD 64315, a massive young star that is helping shaping the structure of the whole nebular region.'
where id = (select id from images i where i.image.getSourceName() = 'eso0544a.jpg');

update images
set description = 'The nearby Large Magellanic Cloud (LMC) is a very active star-forming galaxy. The most massive region of star formation is around 30 Doradus (the Tarantula nebula) which can be seen with the unaided eye, but hundreds of lesser examples are visible with a telescope. This picture shows one of the more intriguing, NGC 2014 (Henize 55). It contains cluster of hot, young stars, almost hidden in the brightest part of the nebula. The energetic ultraviolet light from these stars is absorbed by hydrogen and produces the distinctive red glow from an enormous distance around the cluster. As well as radiating strongly in ultraviolet light (a result of their high temperature) massive young stars also produce vigorous stellar winds. Eventually they will disperse the hydrogen around them, evacuating a bubble-like nebula. To the left of the main cluster a single star has begun this process, creating a strange hollow shape. This picture was made photographically from three glass plates taken with the UK Schmidt telescope. These plates cover the whole LMC and many images of individual objects can be made from them. In contrast, modern CCD detectors image only a small part of the sky, but when used on a big telescope like the AAT they show much more detail.'
where id = (select id from images i where i.image.getSourceName() = 'uks028.jpg');

update images
set description = 'The region around the 4.7 magnitude star S Mon is a fascinating mixture of red fluorescent hydrogen and dark, obscuring dust lanes. Some dust patches are close enough to bright stars to reflect light from them; these appear blue for the same reason that the day-time sky is blue - because some of the interstellar particles preferentially scatter blue light. The dust is mixed with gas and this affects the appearance of the emission nebulae, giving some of the faintest a curious ''fox fur'' texture in this enhanced photograph. About 250 stars have been recognised as members of NGC 2264 which is at a distance of about 2700 light years.'
where id = (select id from images i where i.image.getSourceName() = 'aat014b.jpg');

update images
set description = 'NGC 2440 is another planetary nebula ejected by a dying star, but it has a much more chaotic structure than NGC 2346. The central star of NGC2440 is one of the hottest known, with a surface temperature near 200,000 degrees Celsius. The complex structure of the surrounding nebula suggests to some astronomers that there have been periodic oppositely directed outflows from the central star, somewhat similar to that in NGC2346, but in the case of NGC 2440 these outflows have been episodic, and in different directions during each episode. The nebula is also rich in clouds of dust, some of which form long, dark streaks pointing away fromthe central star. In addition to the bright nebula, which glows becauseof fluorescence due to ultraviolet radiation from the hot star, NGC 2440 is surrounded by a much larger cloud of cooler gas which is invisible in ordinary light but can be detected with infrared telescopes. NGC 2440 lies about 4,000 light-years from Earth in thedirection of the constellation Puppis. The Hubble Heritage team made this image from observations of NGC 2440acquired by Howard Bond (STScI) and Robin Ciardullo (Penn State).'
where id = (select id from images i where i.image.getSourceName() = 'opo9935e.jpg');

update images
set description = 'Hundreds of thousands of vibrant blue and red stars are visible in this new image of galaxy NGC 4449 taken by the NASA/ESA Hubble Space Telescope. Hot bluish white clusters of massive stars are scattered throughout the galaxy, interspersed with numerous dustier reddish regions of current star formation. Massive dark clouds of gas and dust are silhouetted against the flaming starlight.'
where id = (select id from images i where i.image.getSourceName() = 'heic0711a.jpg');

update images
set description = 'Messier 16 is a cluster of young stars which formed about 2 million years ago from the gas and dust which still surrounds them. Brilliant blue stars of this type are much hotter than the Sun and can be up to thirty times more massive. The dark intrusions visible across the face of the nebula are condensations of dusty material which might one day collapse into yet more stars, should they survive the radiation from the bright stars, which is gradually etching them away. Bright red regions of photo-ionised hydrogen such as M16 are usually found in the spiral arms of galaxies and are often associated recent star formation. This example is about 6000 light years distant in Serpens Cauda.'
where id = (select id from images i where i.image.getSourceName() = 'aat018a.jpg');

update images
set description = 'In this picture we see the eastern end of the Large Magellanic Cloud, which is in the southern constellation of Doradus. Here lies one of the most active star formation regions known. If this enormous complex of stars, gas and dust were at the distance of the better-known Orion Nebula the brightest parts of it would visible during the day and would cover a quarter of the sky at night. While the Orion Nebula contains a mere handful of the hot blue stars which energise it, the Tarantula nebula has spawned many thousands in the bright central region, which surrounds a compact, brilliant cluster known as 30 Doradus. Like the Orion Nebula, the 30 Doradus region is a naked eye object for the keen sighted in the southern hemisphere. It is however over one hundred times more distant! Surrounding this nebula is a huge and much fainter series of interlocking bubbles and shells of gas and dust blown away from the center of activity by intense stellar winds and supernova explosions. '
where id = (select id from images i where i.image.getSourceName() = 'uks015a.jpg');

update images
set description = 'The irregular distribution of light in this beautiful part of the sky is due mainly to clouds of dust that dim the light of vast clouds of stars that make Sagittarius one of the brightest parts of the Milky Way. The Lagoon nebula is an illuminated part of such a dark (''molecular'') cloud and it reveals the dust as dark lanes and globules silhouetted against the luminous gas. Within the nebula is the scattered young star cluster NGC 6530, recently formed from this material, though the centre of star-forming activity has now shifted westwards from the cluster to the brightest part of the nebula, around the tiny Hourglass Nebula. The Lagoon nebula is clearly visible to the unaided eye on southern winter nights, in a dark part of the Milky Way close to the great star clouds in Sagittarius.'
where id = (select id from images i where i.image.getSourceName() = 'uks005.jpg');

update images
set description = 'This colour image of the region known as NGC 2264 - an area of sky that includes the sparkling blue baubles of the Christmas Tree star cluster and the Cone Nebula - was created from data taken through four different filters (B, V, R and H-alpha) with the Wide Field Imager at ESO''s La Silla Observatory, 2400 m high in the Atacama Desert of Chile in the foothills of the Andes. The image shows a region of space about 30 light-years across.'
where id = (select id from images i where i.image.getSourceName() = 'eso0848a.jpg');

update images
set description = 'This picture is almost a degree across on the sky and shows three members of a small group of galaxies in the northern constellation of Leo. These galaxies are together in space at a distance of about 30 million light years. Two of the galaxies were bright enough for Messier to see and he catalogued them as M65 and M66. Probably the most interesting member of the Leo triplet was too faint for Messier to notice, so it does not appear in his catalogue. This is NGC 3628, which is seen as an edge-on spiral galaxy at the top of the picture. Galaxies seen edge-on are unusual, but NGC 3628 has other peculiarities that tell us something of the nature of the group as a whole. The dust lane is distinctly askew and the ends of the spiral arms are obviously puffed out, with some evidence of star formation. The bright bulge of the galaxy also has an unusual ''peanut'' shape. All of this confirms observations made at radio wavelengths that reveal the galaxies of the Leo group are physically associated, gradually pulling each other apart as they engage their partners in a gravitational waltz from which there is no escape. The galaxies will eventually merge, losing their identity in a massive burst of star formation. The rectangular pattern at the top of the picture is from the projection calibration sensitometer built into the photographic camera on the AAT. This pattern appears on every plate and is used to provide photometric and colour balance information, but is normally cropped off the final images. '
where id = (select id from images i where i.image.getSourceName() = 'aat103.jpg');

update images
set description = 'Messier 16 is a cluster of young stars which formed about 2 million years ago from the gas and dust which still surrounds them. Brilliant blue stars of this type are much hotter than the Sun and can be up to thirty times more massive. The dark intrusions visible across the face of the nebula are condensations of dusty material which might one day collapse into yet more stars, should they survive the radiation from the bright stars, which is gradually etching them away. Bright red regions of photo-ionised hydrogen such as M16 are usually found in the spiral arms of galaxies and are often associated recent star formation. This example is about 6000 light years distant, in the constellation of Serpens Cauda.'
where id = (select id from images i where i.image.getSourceName() = 'aat018.jpg');

update images
set description = 'M65 in Leo is an elegant spiral galaxy which is highly inclined to our line of sight, revealing a prominent and bright central bulge. Apart from the bulge, the other notable feature of M65 is its dust lane, which so obviously surrounds the galaxy but is only clearly seen where it hides a bright background. Elsewhere, dust is associated with bright, clumpy knots of star formation visible along the inner spiral arm. One arm of the galaxy seems slightly displaced, as though it had undergone some interaction with other massive galaxies. This is hardly surprising, since it is a member of a small group about 30 million light years away that includes M66 and NGC 3628.'
where id = (select id from images i where i.image.getSourceName() = 'aat061.jpg');

update images
set description = 'This photo shows a colour composite mosaic image of the central part of the Orion Nebula, based on 81 images obtained with the infrared multi-mode ISAAC instrument on the ESO Very Large Telescope (VLT) at the Paranal Observatory. The famous Trapezium stars are seen near the centre and the photo also shows the associated cluster of about 1,000 stars, approximately one million years old.'
where id = (select id from images i where i.image.getSourceName() = 'eso0104a.jpg');

update images
set description = 'The spectacular Trifid nebula (Messier 20) is one of the best known in the sky and it is in a rich star-field inSagittarius. It is a striking mixture of brilliant red light emitted from excited hydrogen gas and the soft blue glow of a reflection nebula. The blue arises from starlight, scattered by dust particles between the stars. The size of the particles is minute, similar to those of smoke, which also has a bluish hue. However, the scattered light is not a pure blue, and if we see it through a medium that is yellow (i.e. absorbs blue light) some green colouration remains. This effect can be seen in some of the darker parts of the faint reflection nebula that surrounds the Trifid, where partial absorption of light by foreground dust provides a yellow ''filter'', producing shades of green. This image has been photographically enhanced using an unsharp mask. '
where id = (select id from images i where i.image.getSourceName() = 'aat069.jpg');

update images
set description = 'NGC 5128 is a most unusual galaxy, set in Centaurus, a rich part of the southern sky. It was discovered at Paramatta Observatory near Sydney by James Dunlop in 1826. Not only are there plenty of stars here to catch the eye, but the region is rich in galaxies, many of them such as M83, are, like NGC 5128, members of the Centaurus galaxy cluster. One of the nearer galaxies, at 13 million light years away, NGC 5128 is the most powerful nearby radio source (Centaurus A) and was discovered by Australian radio astronomers in 1947. It is also a copious source of X- and gamma rays as well as visible and infrared radiation. Optically it is predominantly an elliptical galaxy, but crossed by a dark lane of dust. Its light is mainly that of old, cool stars, which is why it appears yellowish on this colour image.'
where id = (select id from images i where i.image.getSourceName() = 'uks032.jpg');

update images
set description = 'M33 is a large, almost face-on spiral galaxy about 2.5 million light years distant in the northern constellation of Triangulum. It is a member of the ''Local Group'' of galaxies, which is dominated by the Milky Way and M31. Like M31, M33 is approaching the Milky Way at a velocity of about 180km/s. Though the total light M33 galaxy is that of a star of magnitude 5.3, its large diameter makes it hard to see. However, despite its low surface brightness, this galaxy was among the first to be identified as a ''spiral nebula'' by Lord Rosse in the 1840s. On shorter exposures, the nucleus appears very bright and almost stellar, like that in its southern cousin, NGC 300.'
where id = (select id from images i where i.image.getSourceName() = 'int005.jpg');

update images
set description = 'At the centre of the spiral arms of NGC 300 is an unusually compact, star-like nucleus. It is surrounded by a faint but extensive yellow haze, consisting of millions of faint, cool stars. This is the older population, or ''bulge'' of NGC 300, a distant equivalent to the (much more numerous) stars that we see in our own galaxy as the brightest part of the Milky Way in Sagittarius. This picture was made from the same set of three plates that were used for AAT 56 and AAT 56a and shows that the inner parts of the galaxy contain many compact clusters of bright stars and their associated nebulae. The galaxy is in the constellation of Sculptor, which in turn is the direction of the Galactic pole, where we look out from the Milky Way at right angles to the Galactic centre. This is why the image contains very few bright Milky Way stars.'
where id = (select id from images i where i.image.getSourceName() = 'aat057.jpg');

update images
set description = 'NGC 346, the brightest star-forming region in the neighbouring Small Magellanic Cloud galaxy, some 210,000 light-years away from Earth. The light, wind and heat given off by massive stars have dispersed the glowing gas within and around this star cluster, forming a surrounding wispy nebular structure that looks like a cobweb. NGC 346 is located in the constellation Tucana (the Toucan) and spans approximately 200 light-years. This particular image was obtained using the Wide Field Imager instrument at the 2.2-metre MPG/ESO telescope at the La Silla Observatory in Chile. Images like this help astronomers chronicle star birth and evolution, while offering glimpses of how stellar development influences the appearance of the cosmic environment over time. This is an enhanced colour image based on three different broadband filters (B, V, R), as well as a narrowband filter (H-alpha, shown in blue). The field of view is about 30 arcminutes wide.'
where id = (select id from images i where i.image.getSourceName() = 'eso1008a.jpg');

update images
set description = 'The third image of ESO''s GigaGalaxy Zoom project is an amazing vista of the Lagoon Nebula taken with the 67-million-pixel Wide Field Imager attached to the MPG/ESO 2.2-metre telescope at the La Silla Observatory in Chile. The image covers more than one and a half square degree - an area eight times larger than that of the Full Moon - with a total of about 370 million pixels. It is based on images acquired using three different broadband filters (B, V, R) and one narrow-band filter (H-alpha).'
where id = (select id from images i where i.image.getSourceName() = 'eso0936a.jpg');

update images
set description = 'The galaxy in Centaurus, now known as NGC 5128 was first discovered by James Dunlop at the Parramatta Observatory near Sydney in 1826. NGC 5128 is also a powerful radio source known as Centaurus A. It is a most unusual object, an elliptical galaxy crossed by a dust lane. Elliptical galaxies are usually almost featureless and almost dust-free, while galaxies with pronounced dust lanes are usually spirals. The elliptical-like, uniformly bright portion is composed of several thousand million stars, most of them old and yellowish. The prominent dust lane obscures and reddens the light of stars behind it, though some younger, blue stars can be seen at the edges of the dust cloud, indicating recent star formation, which is not expected in an elliptical galaxy. One of the nearer galaxies, NGC 5128 is about 10 million light years away, and host to the most powerful nearby radio source. This remarkable galaxy is also a copious source of X- and gamma rays as well as visible and infrared radiation. These are characteristics of an ''active'' galaxy one where the massive black hole present in most large galaxies is actively accreting material from its surroundings. This intense activity is probably the result of the merger of a dusty spiral with an elliptical galaxy, an explanation that accounts for ths galaxy''s optical appearance. The curious green star in the dust lane appears because the blue- and green-light plates were taken when supernova 1986g had just appeared and was bright, while the red-light plate was taken over a year later, after the supernova had faded. Finally, NGC 5128 has a huge, faint halo of stars seen in this very deep image made using special photographic techniques. '
where id = (select id from images i where i.image.getSourceName() = 'aat007.jpg');

update images
set description = 'The Virgo cluster spills over into the adjoining constellation of Coma Berenices and is the nearest moderately rich cluster of galaxies. It contains examples of almost every known kind of galaxy and two quite different types are represented here. The dominant galaxy is the face-on spiral M100, one of the finest spirals in this diverse group. As might be expected in a galaxy-rich environment, the lack of perfect symmetry in its brightest spiral arms suggests that M100 has been disturbed by gravitational interaction with its neighbours. At the top of the image is the first colour picture of a much less spectacular galaxy, a so-called ''nucleated dwarf'' elliptical galaxy, probably interacting with M100. Dwarf galaxies are by far the commonest kind in rich clusters such as this, but nucleated examples are quite rare. Many more can be seen on a deep image of this field.'
where id = (select id from images i where i.image.getSourceName() = 'aat058.jpg');

update images
set description = 'Are you kidding?'
where id = (select id from images i where i.image.getSourceName() = 'ape.jpg');

update images
set description = 'The western end of the large constellation of Monoceros is crossed by the Galactic plane and so is rich in the ingredients of star formation. Only five degrees south (not shown) is the beautiful Rosette nebula, also close to the Galactic plane. The picture here is not particularly beautiful, but it is full of interest and variety. To the east (left) is the outline of the dark Cone nebula with its distinctive bright tip, apparently pointing to the brightest star in the photograph, S Monocerotis at the top (north) of the photograph. All around is faint nebulosity, hinting at star formation in the region. Around the dusty red nebula there are areas where the light from background stars is blocked out by dust which is unlit. At the lower center of the picture is Hubble''s variable nebula (NGC 2261), a young star in a dusty cocoon, while at right is a large, old, open cluster of stars, Trumpler 5. '
where id = (select id from images i where i.image.getSourceName() = 'uks029.jpg');

update images
set description = 'The spectacular Trifid nebula (Messier 20) is one of the best known in the sky, and is in a rich starfield in Sagittarius. It is a striking mixture of brilliant red light emitted from excited hydrogen gas and the soft blue glow of a reflection nebula. The blue arises from starlight, scattered by dust particles between the stars. The size of the particles is minute, similar to those of smoke, which also has a bluish hue. However, the scattered light is not a pure blue, and if we see it through a medium that is yellow (i.e. absorbs blue light) some green colouration remains. This effect can be seen in some of the darker parts of the faint reflection nebula that surrounds the Trifid, where partial absorption of light by foreground dust provides a yellow ''filter'', producing shades of green. This image has been photographically enhanced using an unsharp mask.'
where id = (select id from images i where i.image.getSourceName() = 'aat069a.jpg');

update images
set description = 'The Cat''s Paw Nebula (NGC 6334) is a vast region of star formation. This new portrait of NGC 6334 was created from images taken with the Wide Field Imager instrument at the 2.2-metre MPG/ESO telescope at the La Silla Observatory in Chile, combining images taken through blue, green and red filters, as well as a special filter designed to let through the light of glowing hydrogen. NGC 6334 lies about 5500 light-years from Earth in the constellation of Scorpius. The whole gas cloud is about 50 light-years across. NGC 6334 is one of the most active nurseries of massive stars in our galaxy and has been extensively studied by astronomers. The nebula conceals freshly minted brilliant blue stars - each nearly ten times the mass of our Sun and born in the last few million years. The region is also home to many baby stars that are buried deep in the dust, making them difficult to study. In total, the Cat''s Paw Nebula could contain several tens of thousands of stars. The nebula appears red because its blue and green light are scattered and absorbed more efficiently by material between the nebula and Earth. The red light comes predominantly from hydrogen gas glowing under the intense glare of hot young stars.'
where id = (select id from images i where i.image.getSourceName() = 'eso1003a.jpg');

update images
set description = 'This fine galaxy is seen almost face-on and is one of a small group in Leo whose members are at distance of about 25 million light years. Despite the distance, several of these galaxies appear in Messier''s catalogue, about one third of which consists of galaxies. Though the exact form of our own galaxy, the Milky Way, is not known, there is increasing evidence that it is a barred spiral, perhaps like M95. While the ''bar'' is the dominant feature in a picture taken from afar, it is easy to imagine that this structure could be very difficult to detect from inside the galaxy, especially if seen from a position at right angles to it.'
where id = (select id from images i where i.image.getSourceName() = 'aat097.jpg');

update images
set description = 'This image of NGC 2440 shows the colourful "last hurrah" of a star like our Sun. The star is ending its life by casting off its outer layers of gas, which formed a cocoon around the star''s remaining core. Ultraviolet light from the dying star makes the material glow. The burned-out star, called a white dwarf, is the white dot in the centre.'
where id = (select id from images i where i.image.getSourceName() = 'heic0703a.jpg');

update images
set description = 'This spectacular panoramic view combines a new image of the field around the Wolf-Rayet star WR 22 in the Carina Nebula (right) with an earlier picture of the region around the unique star Eta Carinae in the heart of the nebula (left). The picture was created from images taken with the Wide Field Imager on the MPG/ESO 2.2-metre telescope at ESO''s La Silla Observatory in Chile.'
where id = (select id from images i where i.image.getSourceName() = 'eso1031b.jpg');

update images
set description = 'One of the largest Hubble Space Telescope images ever made of a complete galaxy is being unveiled today at the American Astronomical Society meeting in San Diego, Calif. The Hubble telescope captured a display of starlight, glowing gas, and silhouetted dark clouds of interstellar dust in this 4-foot-by-8-foot image of the barred spiral galaxy NGC 1300. NGC 1300 is considered to be prototypical of barred spiral galaxies. Barred spirals differ from normal spiral galaxies in that the arms of the galaxy do not spiral all the way into the center, but are connected to the two ends of a straight bar of stars containing the nucleus at its center.'
where id = (select id from images i where i.image.getSourceName() = 'opo0501a.jpg');

update images
set description = 'Located inside the Large Magellanic Cloud (LMC) - one of our closest galaxies - in what some describe as a frightening sight, the Tarantula nebula is worth looking at in detail. Also known as 30 Doradus or NGC 2070, the nebula owes its name to the arrangement of its bright patches that somewhat resemble the legs of a tarantula. Taking the name of one of the biggest spiders on Earth is very fitting in view of the gigantic proportions of this celestial nebula - it measures nearly 1,000 light years across ! Its proximity, the favourable inclination of the LMC, and the absence of intervening dust make this nebula one of the best laboratories to better understand the formation of massive stars. This spectacular nebula is energised by an exceptionally high concentration of massive stars, often referred to as super star clusters. This image is based on data acquired with the 1.5 m Danish telescope at the ESO La Silla Observatory in Chile, through three filters (B: 80 s, V: 60 s, R: 50 s).'
where id = (select id from images i where i.image.getSourceName() = 'tarantula.jpg');

update images
set description = 'Most photographs of regions of the nebulae around star-forming regions show that the red nebulosity is associated with one or more very hot, bright stars: these same stars are responsible for the ultra-violet radiation which ionises the hydrogen atoms. This absorbed energy is eventually liberated as a few distinct wavelenghts of (mostly) visible light, the strongest of which is in the red part of the spectrum. In addition to the deep red hue, other wavelengths contribute to the overall colour. Most prominent are lines in the blue part of the spectrum, so the normal colour of a star-forming region is therefore usually magenta, a bluish-red colour, the exact shade depending on the amount of blue light present. However, the star-forming nebulae NGC 6334 and 6357 pictured here are buried in the plane of our Galaxy in the direction of Scorpius, and are seen through thick dusty clouds. The dust both scatters and absorbs blue light along our line of sight, giving these nebulae a deep red hue. The effect of Galactic dust on the colour of emission nebulae is also seen in NGC 3576 and NGC 3603 in Carina. '
where id = (select id from images i where i.image.getSourceName() = 'uks010.jpg');

update images
set description = 'This broad panorama of the Carina Nebula, a region of massive star formation in the southern skies, was taken in infrared light using the HAWK-I camera on ESO''s Very Large Telescope. Many previously hidden features, scattered across a spectacular celestial landscape of gas, dust and young stars, have emerged.'
where id = (select id from images i where i.image.getSourceName() = 'eso1208a.jpg');

update images
set description = 'In the hollowed-out centre of the Rosette nebula lies NGC 2244, the cluster of young stars recently formed there. The cluster has itself created the cavity, radiation pressure and stellar winds from the stars blowing the gas and dust away from the young cluster. The hottest (and brightest) members of the group are seen as distinctly blue on this photograph, a colour corresponding to a surface temperature around 20,000K which may be compared with the Sun''s 5500K. The nebula and its cluster is at a distance of about 4500 light years in Monoceros, and shows many streaks and globules of dust, remnants of the cloud from which the stars formed.'
where id = (select id from images i where i.image.getSourceName() = 'aat035.jpg');

update images
set description = 'Although no bright naked-eye stars are associated with the Carina nebula now, 150 years ago there blazed forth here one of the most unusual and peculiar stars ever seen. The star is known as Eta Carinae and for a few months in 1843 it was the second or third brightest star in the sky. Since then it has faded and is today about 1000 times fainter than it was at its brightest, as the nebula it created during its outburst has cooled and become opaque. However, a gradual brightening over the last decade or so has again raised the star to naked-eye visibility, raising the interesting possibility of another spectacular outburst. The whole region around Eta Carinae is rich in hot stars of which Eta is an extreme example and it is their combined radiation that produces the spectacular Carina nebula that dominates this picture. The nebula and its peculiar star are about 7000 light years distant. '
where id = (select id from images i where i.image.getSourceName() = 'uks006.jpg');

update images
set description = 'This splendid cluster of galaxies in Hydra is framed by two nearby, cool stars in our own Milky Way. The brightest is about 5th magnitude, visible to the unaided eye only under a dark sky; the second brightest is below naked-eye visibility. In contrast the galaxies appear featureless in all but the largest telescopes. The bluish, elongated galaxy is an edge-on spiral, NGC 3312. It has been distorted by interactions with its neighbours. They in turn have been affected, and the brightest of the two adjacent yellow elliptical galaxies (NGC 3311) has an assymetrical envelope, perhaps as a result of this encounter. It''s hard to tell who is jostling who in a crowded group of galaxies such as this. Among the most interesting galaxies in the group are two faint spirals (NGC 3314) that are by chance aligned along the line of sight. They are seen a little to the left of the fainter star and directly below the brighter. On a higher resolution AAT picture it is clear we are seeing one galaxy in front of another. These galaxies are even better seen in a beautiful HST image. Such chance alignments are rare and allow astronomers to study the contents of the foreground galaxy in great detail, thus addressing a controversial topic in astronomy: are galaxies transparent?'
where id = (select id from images i where i.image.getSourceName() = 'aat116.jpg');

update images
set description = 'A mere 10 million light years away, NGC 253 is one of the nearest spiral galaxies, a member of a small group straggling across the southern constellation of Sculptor. It appears elongated because we see it almost edge-on. This galaxy is also one of the dustiest galaxies known and much of its internal detail is hidden by obscuring matter which can be seen as dark patches against the background stars. Despite the obscuration, two spiral arms and many bluish clusters of stars can be seen around the edge of the galaxy. NGC 253 is so close to us that some of the brightest stars are apparent as individuals within the spiral arms. The galaxy is also much bigger than it appears here. On a very deep image the spiral structure is buried in an almost featureless halo, unremarkable except for the bulge at its southern end, which has no obvious counterpart in the brighter regions of the galaxy.'
where id = (select id from images i where i.image.getSourceName() = 'aat023.jpg');

update images
set description = 'Ara is a small constellation in the southern Milky Way, and devoid of bright stars. The fainter stars here are cool, like those that orbit the inner ''bulge'' of the Milky Way and appear slightly yellow on colour pictures. The foreground patch of dust that crosses this photograph must be illuminated by energetic radiation from stars that are much hotter than those in the background because hydrogen, which is associated with the dust, has been excited into a vivid red fluorescence by absorbing the invisible ultraviolet light. Here and there a few bright but cooler stars are caught up in the outskirts of dust clouds and some of their light is scattered to produce the blue reflection nebulae.'
where id = (select id from images i where i.image.getSourceName() = 'aat074.jpg');

update images
set description = 'NGC 2997 is a fine southern spiral galaxy seen from a distance of about 45 million light years. It is in Antlia and is inclined at about 45 degrees to our line of sight, revealing its internal structure and giving the galaxy an oval appearance. Seen face-on, NGC 2997 would look rather like Messier 83. Like most spirals, the galaxy has two prominent spiral arms, which appear to originate in the yellow nucleus, are peppered with bright red blobs of ionised hydrogen which are similar to regions of star formation in our own Milky Way. Within these gas clouds are produced the hot blue stars which generate most of the light in the arms of the galaxy. A much older population of yellowish stars are concentrated around the nucleus. A much deeper image shows that the galaxy is much bigger than it appears above.'
where id = (select id from images i where i.image.getSourceName() = 'aat017a.jpg');

update images
set description = 'This Hubble image of the Antennae galaxies is the sharpest yet of this merging pair of galaxies. As the two galaxies smash together, billions of stars are born, mostly in groups and clusters of stars. The brightest and most compact of these are called super star clusters.'
where id = (select id from images i where i.image.getSourceName() = 'heic0615a.jpg');

update images
set description = 'Hubble''s Advanced Camera for Surveys (ACS) allows astronomers to study an interesting and important phenomenon called ram pressure stripping that is so powerful, it is capable of mangling galaxies and even halting their star formation. NGC 4522 is a spectacular example of a spiral galaxy that is currently being stripped of its gas content. The galaxy is part of the Virgo galaxy cluster and its rapid motion within the cluster results in strong winds across the galaxy as the gas within is left behind. Scientists estimate that the galaxy is moving at more than 10 million kilometres per hour. A number of newly formed star clusters that developed in the stripped gas can be seen in the Hubble image. The stripped spiral galaxy is located some 60 million light-years away from Earth. Even though it is a still image, Hubble''s view of NGC 4522 practically swirls off the page with apparent movement. It highlights the dramatic state of the galaxy with an especially vivid view of the ghostly gas being forced out of it. Bright blue pockets of new star formation can be seen to the right and left of centre.'
where id = (select id from images i where i.image.getSourceName() = 'heic0911b.jpg');

update images
set description = 'M66 in Leo is a dusty spiral galaxy, and is a member of the same compact group of galaxies as M65 and NGC 3628. The striking symmetry of M65 is lacking, and the central bulge, though large, is less well defined. The spiral arms are very easy to see, but seem distorted and displaced above the plane of the galaxy, probably a result of interactions with its neighbours. Much more dust is visible here as well as a few pink nebulae, signs of star formation, near the end of one of the arms.'
where id = (select id from images i where i.image.getSourceName() = 'aat062.jpg');

update images
set description = 'This new image of the Orion Nebula was captured using the Wide Field Imager camera on the MPG/ESO 2.2-metre telescope at the La Silla Observatory, Chile. This image is a composite of several exposures taken through a total of five different filters. Light that passed through a red filter, as well as light from a filter that shows the glowing hydrogen gas, is coloured red. Light in the yellow-green part of the spectrum is coloured green, blue light is coloured blue and light that passed through an ultraviolet filter has been coloured purple. The exposure times were about 52 minutes through each filter.'
where id = (select id from images i where i.image.getSourceName() = 'eso1103a.jpg');

update images
set description = 'The dust clouds of the Milky Way are mostly dark, as is evident from a normal camera view of this part of the sky. The dark clouds contain gas and dust and are tightly constrained to the plane of the Milky Way. The dust hosts simple compounds that have condensed on the tiny grains and these molecules can be detected by radio telescopes. However, here and there stars have formed, lighting up the darkness. The brightest nebulae here are M20 (top) and M8 (lower centre) can be seen with the unaided eye in Sagittarius, and were catalogued by Charles Messier over 200 years ago.'
where id = (select id from images i where i.image.getSourceName() = 'uks026a.jpg');

update images
set description = 'M33 is a large, almost face-on spiral galaxy about 2.5 million light years distant in the northern constellation of Triangulum. It is a member of the ''Local Group'' of galaxies, which is dominated by the Milky Way and M31. Like M31, M33 is approaching the Milky Way at a velocity of about 180km/s. Though the total light M33 galaxy is that of a star of magnitude 5.3, its large diameter makes it hard to see. However, despite its low surface brightness, this galaxy was among the first to be identified as a ''spiral nebula'' by Lord Rosse in the 1840s. In the upper left (north-east) part of this wide field view is the reddish nebula NGC 604, one of the biggest and most active nearby starforming regions. It is about 150 light years in diameter, eqivalent to the distance from the Sun to the Orion nebula. '
where id = (select id from images i where i.image.getSourceName() = 'int006.jpg');

update images
set description = 'Stars, the Sun included, were born within clouds of dusty gas such as the Trifid Nebula in Sagittarius. Measuring some forty light years across, this nebula contains enough material to make many thousands of suns. Within it a number of young hot stars have already formed. The hottest cause the gas in their immediate vicinity, which is mostly hydrogen, to emit its characteristic red light. Around the red emission nebula the gas contains many dust grains which preferentially reflect the blue component of starlight, and to the north (top) of the nebula can be seen a bright star which illuminates part of the dust to create a region of blue reflection. it In some parts of the nebula there are so many dust grains that they hide the glowing gas, producing the three dark lanes which give the object its name, trifid meaning split into three parts. '
where id = (select id from images i where i.image.getSourceName() = 'aat012.jpg');

update images
set description = 'Probably the most interesting member of the Leo triplet was too faint for Messier to see, so it does not appear in his catalogue. This picture has been specially enhanced to reveal NGC 3628, which is seen as an edge-on spiral galaxy, crossed by a dust lane. Galaxies seen edge-on are rare, but this example has other peculiarities. The dust lane is distinctly askew and the ends of the spiral arms are obviously puffed out, with evidence of star formation. The bright bulge of the galaxy also has an unusual ''peanut'' shape. This suggests that the galaxies of the Leo group are interacting, gradually pulling each other apart as they orbit each other. Paradoxically, this will lead to their eventual merger.'
where id = (select id from images i where i.image.getSourceName() = 'aat063.jpg');

update images
set description = 'M83 is in the huge constellation of Hydra, and is thought to be very like our own Galaxy, the Milky Way, but seen from above one of its poles and at a distance of about 15 million light years. Composed of billions of stars and huge clouds of dust and gas, this object is one of the finest examples of a spiral galaxy. It shows a concentration of older, yellow stars in its central nucleus with younger, blue stars and patchy red clouds of glowing gas and dark dust lanes in the trailing spiral arms. The massive blue stars occasionally explode as supernovae; at least eight have been seen in Messier 83 in the last 70 years.'
where id = (select id from images i where i.image.getSourceName() = 'aat008.jpg');

update images
set description = 'The French astronomer Charles Messier (1730-1817) listed over 100 objects he saw as nebulous to avoid confusing them with comets, which were his main interest. Three of Messier''s objects appear in this picture. A little below the bright red emission nebula M17 at the upper centre of the picture is M18, a group of faint stars which is only conspicuous because, like M17, it is set in a relatively dark region of the Milky Way. The rich cloud of stars more or less in the middle of the photograph was listed by Messier as number 24 in his catalogue and it contains the open cluster NGC 6603, while towards the bottom of this field is a small group of nebulosities that Messier either did not see or which he considered to be too faint to interfere with his comet seeking. These are the two blue reflection nebulae NGC 6589-90 and the emission nebulae IC 1283-4.'
where id = (select id from images i where i.image.getSourceName() = 'uks022.jpg');

update images
set description = 'From the same plates that were used to make AAT 58, a deeper picture has been created to show much fainter galaxies. In the process the brighter details of M100 and the nucleated dwarf galaxy have been lost, but many other faint galaxies are seen. One seems to be involved with the faint outskirts of the large spiral. The somewhat distorted shape of the dwarf galaxy suggests it could be both influencing and being influenced by M100, and may be the cause of the asymmetry in the spiral arms seen in AAT 58. Nearby is an even fainter, elongated dwarf galaxy and elsewhere in the picture are several others, all probably members of the Virgo cluster, which spills over into the adjoining constellation of Coma Berenices. Many more can be seen on a deep image of this field.'
where id = (select id from images i where i.image.getSourceName() = 'aat059.jpg');

update images
set description = 'The Dumbbell Nebula­- also known as Messier 27 or NGC 6853 - is a typical planetary nebula and is located in the constellation Vulpecula (The Fox). The distance is rather uncertain, but is believed to be around 1,200 light-years. It was first described by the French astronomer and comet hunter Charles Messier who found it in 1764 and included it as no. 27 in his famous list of extended sky objects [2] .Despite its class, the Dumbbell Nebula has nothing to do with planets. It consists of very rarified gas that has been ejected from the hot central star (well visible on this photo), now in one of the last evolutionary stages. The gas atoms in the nebula are excited (heated) by the intense ultraviolet radiation from this star and emit strongly at specific wavelengths. This image is the beautiful by-product of a technical test of some FORS1 narrow-band optical interference filtres. They only allow light in a small wavelength range to pass and are used to isolate emissions from particular atoms and ions. In this three-colour composite, a short exposure was first made through a wide-band filtre registering blue light from the nebula. It was then combined with exposures through two interference filtres in the light of double-ionized oxygen atoms and atomic hydrogen. They were colour-coded as "blue", "green" and "red", respectively, and then combined to produce this picture that shows the structure of the nebula in "approximately true" colours. They are three-colour composite based on two interference ([OIII] at 501 nm and 6 nm FWHM - 5 min exposure time; H-alpha at 656 nm and 6 nm FWHM - 5 min) and one broadband (Bessell B at 429 nm and 88 nm FWHM; 30 sec) filtre images, obtained on September 28, 1998, during mediocre seeing conditions (0.8 arcsec). The CCD camera has 2048 x 2048 pixels, each covering 24 x 24 µm and the sky fields shown measure 6.8 x 6.8 arcminutes and 3.5 x 3.9 arcminutes, respectively. North is up; East is left.'
where id = (select id from images i where i.image.getSourceName() = 'eso9846a.jpg');

update images
set description = 'There are few clearer examples anywhere of the intimate relationship between dust, gas and young stars than M16 in Serpens. We see a young cluster of stars (NGC 6611) which formed about 2 million years ago, illuminating a cloud of hydrogen gas. The gas is also dusty, and in places the dust is dense enough to prevent starlight from reaching the gas and making it glow with its distinctive red hue. The luminous hydrogen provides a vivid background against which are seen numerous dark lanes and discrete globules of dust. Many of the dusty clouds are edged with bright rims which indicate the direction of the exciting stars and point to the cluster as the energising source.'
where id = (select id from images i where i.image.getSourceName() = 'aat047.jpg');

update images
set description = 'The Sombrero, named after the broad-brimmed Mexican hat it superficially resembles, is probably the most famous galaxy in the sky. The light from this remarkable spiral system is dominated by the billions of old, faint stars that form the vast ''bulge'' around its tiny hidden nucleus. Most spirals, including the Milky Way, have clouds of old, faint stars around their nuclei, but in M104 the galaxy''s light is dominated by them. This effect is enhanced because disk of the galaxy is seen nearly edge-on and dust in its outer parts is in silhouette as it crosses the picture. Within the dusty disk are low contrast structures that show this galaxy to be a genuine spiral, immersed in an unusually large central bulge. The bulge is seen best on a deep image and is much bigger than it appears here. It also shows some extremely faint features that are suggestive of tidal tails -- merger remnants. The galaxy is about 65 million light years distant on Virgo''s southern border. '
where id = (select id from images i where i.image.getSourceName() = 'aat100a.jpg');

update images
set description = 'The brightest part of the Milky Way, as seen by the unaided eye, lies in the southern constellation Carina. Here there are an unusually large number of young, hot stars and their radiation is rich in energetic ultraviolet light. Many of these stars were born within the spectacular Carinae nebula, seen here. The nebula is a cloud of glowing gas composed mostly of hydrogen, excited by ultrviolet light from the embedded stars. The distinctive red emission radiation of fluorescent hydrogen is responsible for the red colour. About a quarter of the nebula is made of helium gas, the second most abundant element in the universe after hydrogen, and all the other chemical elements account for only a few percent of the total mass. The brightest star in the nebula is known as eta Carinae, seen here a little to the east (left) of the keyhole shape in the middle of the image. This remarkable object is one of the most luminous and most massive stars known and is better seen in image AAT 32 (below). '
where id = (select id from images i where i.image.getSourceName() = 'aat009.jpg');

update images
set description = 'This unusual barred spiral galaxy is in the far southern constellation of Volans and was discovered by Sir John Herschel who described one of its spiral arms as hook-like. Although not seen here, (but evident on very deep images) NGC 2442 appears to have a less massive, distant companion that is also distorted, and it seems likely that the two have had a close encounter in the recent past. If there are no further meetings, the forces that hold NGC 2442 together will restore galaxy to a more symmetrical spiral form. However, much more likely is that the companion has been captured by the distorted spiral and will eventually be devoured by it, triggering a dramatic bout of star formation. NGC 2442 is about 50 million light years distant.'
where id = (select id from images i where i.image.getSourceName() = 'aat098.jpg');

update images
set description = 'NGC 300 is among the least conspicuous members of a sparse cluster of galaxies that are scattered across the south galactic pole, which is why there are so few stars visible in this wide field view. The three photographic plates from which this picture was made have been specially enhanced to emphasise the delicate outer structure of the galaxy, revealing that the light of the spiral arms is dominated by young, blue stars. Here and there along the arms, indeed largely responsible for defining them, are denser clumps of stars, some still associated with the gas from which they formed. Many stars are clearly visible as individuals, for the Sculptor Group is relatively nearby, about 8 million light years away.'
where id = (select id from images i where i.image.getSourceName() = 'aat056a.jpg');

update images
set description = 'This wide-angle picture of the Orion region has been made to reveal the extensive network of very faint filaments which are traceable over most of the constellation. These faint features are optical evidence of a substantial dark cloud of molecular gas and dust which are detectable at radio wavelengths. Where hot stars are closely associated with the molecular cloud such as this, a bright nebula appears. By far the most conspicuous of these is the Orion Nebula, M42. This spectacular object is so bright that its light is reflected from filaments of the dark cloud some distance away. In contrast, the wisps of the Horsehead Nebula are much fainter but even here faint tendrils of nebulosity show that the nebula is much more extensive than is generally realised. All these objects are about 1350 light years distant. '
where id = (select id from images i where i.image.getSourceName() = 'uks023.jpg');

update images
set description = 'One square degree image of the Tarantula Nebula and its surroundings. The spidery nebula is seen in the upper-centre of the image. Slightly to the lower-right, a web of filaments harbours the famous supernova SN 1987A (see below). Many other reddish nebulae are visible in the image, as well as a cluster of young stars on the left, known as NGC 2100. Technical information: the image is based on observations carried out by Joao Alves (Calar Alto, Spain), Benoit Vandame and Yuri Beletski (ESO) with the Wide Field Imager (WFI) at the 2.2-m telescope on La Silla. These data consist of a 2x2 WFI mosaic in the B- and V-bands, and in the H_ and [OIII] narrow bands. The data were first processed with the ESO/MVM pipeline by the Advanced Data Products (ADP) group at ESO.'
where id = (select id from images i where i.image.getSourceName() = 'eso0650a.jpg');

update images
set description = 'The first released VST image shows the spectacular star-forming region Messier 17, also known as the Omega Nebula or the Swan Nebula, as it has never been seen before. This vast region of gas, dust and hot young stars lies in the heart of the Milky Way in the constellation of Sagittarius (The Archer). The VST field of view is so large that the entire nebula, including its fainter outer parts, is captured - and retains its superb sharpness across the entire image. The data were processed using the Astro-WISE software system developed by E.A. Valentijn and collaborators at Groningen and elsewhere.'
where id = (select id from images i where i.image.getSourceName() = 'eso1119a.jpg');

update images
set description = 'Although stars are well known to form in clusters, most of the stars in the young groups we know of in our own galaxy are well separated in space. In NGC 3603 the stars are remarkably close together. Moreover, many of the stars in this compact constellation are Wolf-Rayet stars, extremely hot, massive objects, rarely found in such profusion in clusters. Exactly why some clusters form massive stars and others do not is a hot topic in astronomy, so this cluster and its environment has been extensively studied. This curious collection of young objects in Carina is, as far as we know, unique in our galaxy, though the enigmatic object at the centre of the Tarantula Nebula in the Large Magellanic Cloud is now known to be a similar compact cluster. The stars and their associated nebula are seen through considerable dust along the line of sight, and are dimmed and reddened by it.'
where id = (select id from images i where i.image.getSourceName() = 'aat040.jpg');

update images
set description = 'The brightest star in this picture is the first supernova to be visible to the unaided eye for almost 400 years. It occured in a region rich in young, blue stars and it was one of these which destroyed itself. When this picture was taken, about 2 weeks after the supernova was discovered, at the end of February, 1987, the expanding shell of material had already changed from blue to orange-red as it cooled. The location of the supernova in the Large Magellanic Cloud (LMC) means that it can only be seen from the southern hemisphere. This was very convenient in the early stages of the development of the supernova, since the LMC is always above the horizon of the AAT.'
where id = (select id from images i where i.image.getSourceName() = 'aat048.jpg');

update images
set description = 'The star-forming nebulae NGC 6334 and NGC 6357 (UKS 12) show no evidence of a blue component in their colour - indeed, the blue-light plate used in these 3-colour pictures had no nebulous image at all - nor is there any obvious sign of the bright blue stars normally found in these objects. They are excellent examples of the phenomenon known as ''interstellar reddening'', the selective removal of blue light by minute particles of dust in the line of sight. This accounts for both the ruddy hue and apparent absence of blue stars. The hot stars are present but only some of the red part of their light is seen so they are not conspicuous. These nebulae are quite nearby (5500 light years) in the direction of Scorpius, but located close to the Galactic plane and buried in the dust of the Milky Way. Careful measurement of the colour of stars associated with the nebulae indicate that they are dimmed by a factor of about 10 in the green part of the spectrum, much more in the blue, but relatively little at red wavelengths. The scattering of bright stars seen here are in the foreground so are relatively unaffected by interstellar reddening. Some care has been taken to ensure that these images are as close to true-colour as possible. '
where id = (select id from images i where i.image.getSourceName() = 'uks011.jpg');

update images
set description = 'The massive star factory known as the Trifid Nebula was captured in all its glory with the Wide-Field Imager camera attached to the MPG/ESO 2.2-metre telescope at ESO''s La Silla Observatory in northern Chile. So named for the dark dust bands that trisect its glowing heart, the Trifid Nebula is a rare combination of three nebulae types that reveal the fury of freshly formed stars and point to more star birth in the future. The field of view of the image is approximately 13 x 17 arcminutes.'
where id = (select id from images i where i.image.getSourceName() = 'eso0930a.jpg');

update images
set description = 'This curious dark nebula is one of the best-known images in astronomy, probably because of its chance likeness to a recognisable form. The horse-head shape is an extension of a large cloud of dust which fills the lower part (east) of the picture and hides the light of stars beyond. The outer surface of the dusty gas (IC 434) runs roughly north-south and is illuminated by sigma Orionis (off the top of the picture) which causes the hydrogen there to fluoresce, outlining the horse-head shape. Though conspicuous here, the Horsehead is very difficult to see visualy, even with a large telescope. A bright star is partially enveloped in the dust cloud and its scattered light is seen as the large, irregular blue reflection nebula, NGC 2023. All these objects are about 1350 light years distant. '
where id = (select id from images i where i.image.getSourceName() = 'aat036.jpg');

update images
set description = 'Although no bright naked-eye stars are associated with the Carina nebula now, 150 years ago there blazed forth here one of the most unusual and peculiar stars ever seen. The star is known as Eta Carinae and for a few months in 1843 it was the second or third brightest star in the sky. Since then it has faded and is today about 1000 times fainter than it was at its brightest, as the nebula it created during its outburst has cooled and become opaque. However, a gradual brightening over the last decade or so has again raised the star to naked-eye visibility, raising the interesting possibility of another spectacular outburst. The whole region around Eta Carinae is rich in hot stars of which Eta is an extreme example and it is their combined radiation that produces the spectacular Carina nebula that dominates this picture. The nebula and its peculiar star are about 7000 light years distant. '
where id = (select id from images i where i.image.getSourceName() = 'uks006a.jpg');

update images
set description = 'Stars, the Sun included, were born within clouds of dusty gas such as the Trifid Nebula in Sagittarius. Measuring some forty light years across, this nebula contains enough material to make many thousands of suns. Within it a number of young hot stars have already formed. The hottest cause the gas in their immediate vicinity, which is mostly hydrogen, to emit its characteristic red light. Around the red emission nebula the gas contains many dust grains which preferentially reflect the blue component of starlight, and to the north (top) of the nebula can be seen a bright star which illuminates part of the dust to create a region of blue reflection. it In some parts of the nebula there are so many dust grains that they hide the glowing gas, producing the three dark lanes which give the object its name, trifid meaning split into three parts.'
where id = (select id from images i where i.image.getSourceName() = 'aat012a.jpg');

update images
set description = 'Here we see two bright stars whose radiant energy is beating down on to the surface of a dark cloud, very similar to the Horsehead in Orion. The cloud itself is opaque and because of that, very cold inside. These conditions are ideal for the formation of organic molecules on the surfaces of the chilled dust particles. The opacity of the cloud protects the fragile molecules within from the energetic radiation of nearby stars, but as its surface is gradually warmed and eroded, the delicate organic molecules are destroyed and the hydrogen released glows as a distinctive red emission nebula. '
where id = (select id from images i where i.image.getSourceName() = 'aat075.jpg');

update images
set description = 'The image of NGC 4402 highlights some telltale signs of ram pressure stripping such as the curved, or convex, appearance of the disc of gas and dust, a result of the forces exerted by the heated gas. Light being emitted by the disc backlights the swirling dust that is being swept out by the gas. Studying ram pressure stripping helps astronomers better understand the mechanisms that drive the evolution of galaxies, and how the rate of star formation is suppressed in very dense regions of the Universe like clusters.'
where id = (select id from images i where i.image.getSourceName() = 'heic0911c.jpg');

update images
set description = 'These images of the NGC 3603 region were obtained in three near-IR filter bands (Js, H and Ks) with the ISAAC instrument at the ANTU telescope at the VLT at Paranal. NGC 3603 is located in the Carina spiral arm of the Milky Way galaxy at a distance of about 20,000 light-years (6-7 kpc). It is the only massive, galactic "HII-region" (so denoted by astronomers because part of its hydrogen is ionized) in which a central cluster of strongly UV-radiating stars of types O and B that ionize the nebula can be studied at visual and near-infrared wavelengths. This is because the line-of-sight is reasonably free of dust in this direction; the dimming in near-infrared radiation due to intervening matter between the nebula and us is only about a factor of 2 (compared to 80 in visible light). The total mass of the hot O and B stars in NGC 3603 is over 2,000 solar masses. Together, the more than fifty heavy and bright O stars in NGC 3603 have about 100 times the ionizing power of the well-known Trapezium cluster in the Orion Nebula. In fact, the star cluster in NGC 3603 is in many respects very similar to the core of the large, ionizing cluster in the approximately eight times more distant Tarantula Nebula in the Large Magellanic Cloud. An important conclusion of studying this region is that there are lots of sub-solar mass stars in NGC 3603. Contrary to several theoretical predictions, these low-mass stars do form in violent starbursts. The overall age of stars in the contraction phase that are located in the innermost region of NGC 3603 was found to be 300 000 to 1 000 000 years. The counts clearly show that this cluster is well populated in sub-solar mass stars.'
where id = (select id from images i where i.image.getSourceName() = 'eso9946a.jpg');

update images
set description = 'The Wide Field Imager on the MPG/ESO 2.2-metre telescope at the La Silla Observatory has imaged a region of star formation called NGC 3324. The intense radiation from several of NGC 3324''s massive, blue-white stars has carved out a cavity in the surrounding gas and dust. The ultraviolet radiation from these young hot stars also cause the gas cloud to glow in rich colours.'
where id = (select id from images i where i.image.getSourceName() = 'eso1207a.jpg');

update images
set description = 'Many other, much larger nebulae than M42 in Orion are known, but none offers us so intimate a view of a nearby stellar nursery. To the eye, the nebula appears as a misty patch around the central star of the line of three which form Orion''s sword. Binoculars or a modest telescope will show that these three ''stars'' are loose groups of several individuals, but in this long exposure photograph they are lost in the central brightness. The central group of stars, the Trapezium cluster, is responsible for producing the nebula. It is the high concentration of dust and gas in this part of the sky which has resulted in the formation of the stars, so the Orion nebula is no random association of bright stars and dusty gas. At a distance of about 1500 light years, the Orion nebula is one the nearest and by far the brightest star-forming region. Like all the images on these pages, this picture was made from three black and white glass negatives. Some care has been taken to ensure that the colours seen here are realistic. '
where id = (select id from images i where i.image.getSourceName() = 'uks008.jpg');

update images
set description = 'The molecular cloud in Ara in the far southern sky is full of interest. Here dusty gas and starlight mix to produce vivid reds and gentle blues. The whole scene is set against a curtain of faint stars that are more distant than the dust. There is enough interest in this little-known region to justify a more detailed look and the two adjoining images AAT 74 and AAT 75 show two quite different parts that appear together here in a field of view that is about three-quarters of the AAT''s full prime focus field when used photographically.'
where id = (select id from images i where i.image.getSourceName() = 'aat075a.jpg');

update images
set description = 'This is a unique NASA/ESA Hubble Space Telescope view of the disk galaxy NGC 5866 tilted nearly edge-on to our line-of-sight. Hubble''s sharp vision reveals a crisp dust lane dividing the galaxy into two halves. The image highlights the galaxy''s structure: a subtle, reddish bulge surrounding a bright nucleus, a blue disk of stars running parallel to the dust lane, and a transparent outer halo. Some faint, wispy trails of dust can be seen meandering away from the disk of the galaxy out into the bulge and inner halo of the galaxy. The outer halo is dotted with numerous gravitationally bound clusters of nearly a million stars each, known as globular clusters. Background galaxies that are millions to billions of light-years farther away than NGC 5866 are also seen through the halo.'
where id = (select id from images i where i.image.getSourceName() = 'opo0624a.jpg');

update images
set description = 'The Cone nebula is part of an enormous cloud of hydrogen and tiny solid particles assocaited with the loose open cluster, NGC 2264 in the equatorial constellation of Monoceros. More of this region is seen in image AAT 14. Within and around this cloud are many recently formed stars, some completely hidden within the dense interstellar matter. They can be detected by special infra-red techniques which are able to penetrate the obscuration. The largest of the dust clouds is the curious straight-sided feature which gives this object its name. '
where id = (select id from images i where i.image.getSourceName() = 'aat013.jpg');

update images
set description = 'Galaxies can be separated by their appearance into two broad groups, spirals and ellipticals. An example of a spiral galaxy, NGC 1365, is seen near the centre of this picture. In contrast, most of the galaxies in this cluster are ellipticals, which contain little or no gas or evidence of star formation; indeed they are composed millions of rather old, yellowish stars. Unlike many of the stars in spiral systems, those in ellipticals have orbits which are not confined to a narrow plane, so the galaxy can have a shape anywhere between a perfect sphere and an American football. This kind of galaxy is the most common type in the photograph as it is in all of the nearby Universe. The picture also illustrates another distinctive property of ellipticals, their gregarious nature - they congregate in clusters, like this group of galaxies in Fornax, 60 million light years distant. This wide field version of the image used for UKS 13 also shows us another, less common kind of galaxy. In the lower right corner is NGC 1316-17. This is interacting pair of galaxies is one of the strongest nearby radio galaxies, known as Fornax A. Finally, in the opposite corner is a bright yellow (K5) 4.5 magnitude star in the adjoining constellation of Eridanus. We also have a much deeper images of several of these galaxies that shows that they are much bigger than appear on the colour pictures.'
where id = (select id from images i where i.image.getSourceName() = 'uks013a.jpg');

update images
set description = 'In visible light, NGC 1313 in the southern constellation of Reticulum seems to be dominated by scattered patches of star formation which give our picture a rather ragged appearance. The clouds of bluish stars seem to have burst into existence at random, without the normal trigger gravitational interaction or even a distinct spiral to prompt them. Star formation seems to have occurred in a series of irregular, self-sustaining bursts. However, a very deep image shows that the outer parts of galaxy are also very disturbed. Seen with a radio telescope, the galaxy is rich in hydrogen, the raw material of stars, and the gas circulates around the centre of the galaxy in a well ordered way, apparently hardly affected by the starburst activity or other irregularities that so colour our visual impression of this unusual galaxy. NGC 1313 is at a distance of about 15 million light years, close enough for some of its brightest stars to be seen as individuals.'
where id = (select id from images i where i.image.getSourceName() = 'aat064.jpg');

update images
set description = 'This curious dark nebula is one of the best-known images in astronomy, probably because of its chance likeness to a recognisable form. The horse-head shape is an extension of a large cloud of dust which fills the lower part (east) of the picture and hides the light of stars beyond. The outer surface of the dusty gas (IC 434) runs roughly north-south and is illuminated by sigma Orionis (off the top of the picture) which causes the hydrogen there to fluoresce, outlining the horse-head shape. The diffuse haze to the left of the image (north) is scattered light from the bright star zeta Orionis. Though conspicuous here, the Horsehead is very difficult to see visually, even with a large telescope. A bright star is partially enveloped in the dust cloud and its scattered light is seen as the large, irregular blue reflection nebula, NGC 2023. All these objects are about 1350 light years distant in the constellation of Orion.'
where id = (select id from images i where i.image.getSourceName() = 'aat036a.jpg');

update images
set description = 'The nearby radio source Centaurus A (NGC 5128) looks like an elliptical galaxy, crossed by a broad, irregular dust lane. The dark band is probably the remains of a dusty spiral galaxy which is being absorbed by the giant elliptical. The three plates which were combined to make this colour picture have been copied to enhance the fine detail of the dust lane and to suppress the bright background of the elliptical galaxy. This process reveals many tiny red star-forming regions, especially prominent towards the end of the dust lane, and the clumps of young blue stars recently formed from them. The curious green star in the dust lane is because the blue and green-light plates were taken when supernova 1986g had just appeared, while the red-light plate was taken a year later when the supernova had faded. This galaxy has a huge, faint halo of stars seen in this very deep image made using special photographic techniques.'
where id = (select id from images i where i.image.getSourceName() = 'aat052.jpg');

update images
set description = 'At the heart of the Lagoon Nebula in Sagittarius lies the diminutive Hourglass Nebula. This extremely bright object is associated with the blue star alongside it, named Herschel 36 after its discoverer. Herschel described M8 as ''A noble nebula'' and ''a fine and complicated nebula'', but he was clearly intrigued by the Hourglass which he compared to the nucleus of the Andromeda nebula, M31 as ''decidedly not stellar''. Surrounding the Hourglass is an extensive emission nebula, popularly known as the ''Lagoon'' nebula in allusion to the sinuous dark lane winding through it. The dusty division seems to separate the Hourglass nebula from a scattered open cluster, NGC 6530, at left of the picture here. It seems likely that the cluster is evidence of an earlier bout of star formation here, which has now spread westwards, into the Hourglass region. The cluster formed about 10 million years ago and is 5000 light years distant '
where id = (select id from images i where i.image.getSourceName() = 'aat031a.jpg');

update images
set description = 'This colour-composite image of the Helix Nebula (NGC 7293) was created from images obtained using the the Wide Field Imager (WFI), an astronomical camera attached to the 2.2-metre Max-Planck Society/ESO telescope at the La Silla observatory in Chile. The blue-green glow in the centre of the Helix comes from oxygen atoms shining under effects of the intense ultraviolet radiation of the 120 000 degree Celsius central star and the hot gas. Further out from the star and beyond the ring of knots, the red colour from hydrogen and nitrogen is more prominent. A careful look at the central part of this object reveals not only the knots, but also many remote galaxies seen right through the thinly spread glowing gas.This image was created from images through blue, green and red filters and the total exposure times were 12 minutes, 9 minutes and 7 minutes respectively.'
where id = (select id from images i where i.image.getSourceName() = 'eso0907a.jpg');

update images
set description = 'NGC 5078 is a lenticular (lens-shaped) galaxy crossed by a distinct dusty band which is seen against the bright background of the galaxy itself. The dust lane is warped and broadened, probably by interaction with the faint companion galaxy IC 879, which is itself distorted into an ''S'' shape by the interaction. The slightly bluish colour of parts of the fainter galaxy is suggestive of star formation, probably triggered by the interaction. Encounters between galaxies such as this are common, and often lead to them merging into a single entity. It is likely that the dust lane of NGC 5078 is the remnant of a dusty spiral which fell into it long ago. These galaxies are about 80 million light years distant in the meandering constellation of Hydra.'
where id = (select id from images i where i.image.getSourceName() = 'aat099.jpg');

update images
set description = 'The nearest moderately rich cluster of galaxies lies in the direction of Virgo. The richest part of the cluster is centred on the giant elliptical galaxies M84 and M86 which dominate this picture. Not surprisingly in such a relatively crowded environment, close encounters between cluster members are fairly common and in the upper left (NE) of the photograph NGC 4438 has been distorted by its companion NGC 4435. The whole cluster is receding with an average velocity of over 1000 km per second but there is sufficient variation around that value to suggest that it may be composed of more than one cloud of galaxies which is probably elongated along our line of sight, adding to the apparent richness seen here.. These galaxies have faint, extended outer envelopes, seen on this deep image.'
where id = (select id from images i where i.image.getSourceName() = 'uks024.jpg');

