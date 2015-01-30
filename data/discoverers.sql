create sequence discoverers_seq
 minvalue 1
 start with 1
 increment by 1
 cache 20;

create table discoverers (
 id number constraint pk_discoverers primary key,
 firstname varchar2(20) not null,
 middlenames varchar2(25),
 lastname varchar2(20),
 yearOfBirth number,
 yearOfDeath number
);

insert into discoverers values(discoverers_seq.nextval,  unistr('Karl'), unistr('Ludwig'), unistr('Harding'),1765,1834);
insert into discoverers values(discoverers_seq.nextval,  unistr('Hipparchus'), unistr(null), unistr(null),-190,-125);
insert into discoverers values(discoverers_seq.nextval,  unistr('Pierre'), unistr('Francois Andre'), unistr('Mechain'),1744,1804);
insert into discoverers values(discoverers_seq.nextval,  unistr('Nicolas-Claude'), unistr('Fabri'), unistr('de Peiresc'),1580,1637);
insert into discoverers values(discoverers_seq.nextval,  unistr('Per'), unistr('Magnus Herman'), unistr('Schultz'),1823,1890);
insert into discoverers values(discoverers_seq.nextval,  unistr('Lewis'), unistr(null), unistr('Swift'),1820,1913);
insert into discoverers values(discoverers_seq.nextval,  unistr('Friedrich'), unistr('Georg Wilhelm'), unistr('von Struve'),1793,1864);
insert into discoverers values(discoverers_seq.nextval,  unistr('Edmond'), unistr(null), unistr('Halley'),1656,1742);
insert into discoverers values(discoverers_seq.nextval,  unistr('Phillip'), unistr('Sydney'), unistr('Coolidge'),1830,1863);
insert into discoverers values(discoverers_seq.nextval,  unistr('George'), unistr('Friedrich Wilhelm'), unistr('R\00fcmker'),1832,1900);
insert into discoverers values(discoverers_seq.nextval,  unistr('Pietro'), unistr('Paolo Giovanni Ernesto'), unistr('Baracchi'),1851,1926);
insert into discoverers values(discoverers_seq.nextval,  unistr('Otto'), unistr('Wilhelm'), unistr('von Struve'),1819,1905);
insert into discoverers values(discoverers_seq.nextval,  unistr('Ormond'), unistr(null), unistr('Stone'),1847,1933);
insert into discoverers values(discoverers_seq.nextval,  unistr('Albert'), unistr(null), unistr('Marth'),1828,1897);
insert into discoverers values(discoverers_seq.nextval,  unistr('Charles'), unistr('Sanders'), unistr('Peirce'),1840,1914);
insert into discoverers values(discoverers_seq.nextval,  unistr('Johann'), unistr('Louis Emil'), unistr('Dreyer'),1852,1926);
insert into discoverers values(discoverers_seq.nextval,  unistr('Jean-Dominique'), unistr(null), unistr('Maraldi'),1709,1788);
insert into discoverers values(discoverers_seq.nextval,  unistr('Johann'), unistr('Friedrich Julius'), unistr('Schmidt'),1825,1884);
insert into discoverers values(discoverers_seq.nextval,  unistr('Edward'), unistr(null), unistr('Pigott'),1753,1825);
insert into discoverers values(discoverers_seq.nextval,  unistr('Samuel'), unistr('Pierpont'), unistr('Langley'),1834,1906);
insert into discoverers values(discoverers_seq.nextval,  unistr('Edward'), unistr('P.'), unistr('Austin'),null,null);
insert into discoverers values(discoverers_seq.nextval,  unistr('Niccol\00f2'), unistr(null), unistr('Cacciatore'),1780,1841);
insert into discoverers values(discoverers_seq.nextval,  unistr('Edward'), unistr('Emerson'), unistr('Barnard'),1857,1923);
insert into discoverers values(discoverers_seq.nextval,  unistr('Jerome'), unistr('Eugene'), unistr('Coggia'),1849,1919);
insert into discoverers values(discoverers_seq.nextval,  unistr('Edward'), unistr('Charles'), unistr('Pickering'),1846,1919);
insert into discoverers values(discoverers_seq.nextval,  unistr('Charles'), unistr('Augustus'), unistr('Young'),1834,1908);
insert into discoverers values(discoverers_seq.nextval,  unistr('Jean-Jacques'), unistr('Dortous'), unistr('de Mairan'),1678,1771);
insert into discoverers values(discoverers_seq.nextval,  unistr('Carl'), unistr('Christian'), unistr('Bruhns'),1830,1881);
insert into discoverers values(discoverers_seq.nextval,  unistr('Heinrich'), unistr('Louis'), unistr('d''Arrest'),1822,1875);
insert into discoverers values(discoverers_seq.nextval,  unistr('Nils'), unistr('Christoffer'), unistr('Duner'),1839,1914);
insert into discoverers values(discoverers_seq.nextval,  unistr('Auguste'), unistr(null), unistr('Voigt'),1828,1909);
insert into discoverers values(discoverers_seq.nextval,  unistr('Asaph'), unistr('R.'), unistr('Hall'),1829,1907);
insert into discoverers values(discoverers_seq.nextval,  unistr('Joseph'), unistr(null), unistr('Baxendell'),1815,1887);
insert into discoverers values(discoverers_seq.nextval,  unistr('Friedrich'), unistr('August Theodor'), unistr('Winnecke'),1835,1897);
insert into discoverers values(discoverers_seq.nextval,  unistr('Aratos'), unistr(null), unistr('of Soli'),-315,-245);
insert into discoverers values(discoverers_seq.nextval,  unistr('Paul-Pierre'), unistr(null), unistr('Henry'),1848,1905);
insert into discoverers values(discoverers_seq.nextval,  unistr('Joseph'), unistr(null), unistr('Winlock'),1826,1875);
insert into discoverers values(discoverers_seq.nextval,  unistr('George'), unistr('Mary'), unistr('Searle'),1839,1918);
insert into discoverers values(discoverers_seq.nextval,  unistr('Jean'), unistr('Marie Edouard'), unistr('Stephan'),1837,1923);
insert into discoverers values(discoverers_seq.nextval,  unistr('Georg'), unistr('Friedrich Julius Arthur'), unistr('von Auwers'),1838,1915);
insert into discoverers values(discoverers_seq.nextval,  unistr('David'), unistr('Peck'), unistr('Todd'),1855,1939);
insert into discoverers values(discoverers_seq.nextval,  unistr('Amerigo'), unistr(null), unistr('Vespucci'),1451,1512);
insert into discoverers values(discoverers_seq.nextval,  unistr('Gottfried'), unistr(null), unistr('Kirch'),1639,1710);
insert into discoverers values(discoverers_seq.nextval,  unistr('Truman'), unistr('Henry'), unistr('Safford'),1836,1901);
insert into discoverers values(discoverers_seq.nextval,  unistr('Barnaba'), unistr(null), unistr('Oriani'),1752,1832);
insert into discoverers values(discoverers_seq.nextval,  unistr('Sherbourne'), unistr('Wesley'), unistr('Burnham'),1838,1921);
insert into discoverers values(discoverers_seq.nextval,  unistr('Charles'), unistr(null), unistr('Messier'),1730,1817);
insert into discoverers values(discoverers_seq.nextval,  unistr('William'), unistr(null), unistr('Lassell'),1799,1880);
insert into discoverers values(discoverers_seq.nextval,  unistr('Carl'), unistr('Ernst Albrecht'), unistr('Hartwig'),1851,1923);
insert into discoverers values(discoverers_seq.nextval,  unistr('Samuel'), unistr(null), unistr('Oppenheim'),1857,1928);
insert into discoverers values(discoverers_seq.nextval,  unistr('George'), unistr('Phillips'), unistr('Bond'),1825,1865);
insert into discoverers values(discoverers_seq.nextval,  unistr('Kaspar'), unistr('Gottfried'), unistr('Schweizer'),1816,1873);
insert into discoverers values(discoverers_seq.nextval,  unistr('Giovanni'), unistr('Domenico'), unistr('Cassini'),1625,1712);
insert into discoverers values(discoverers_seq.nextval,  unistr('Giovanni'), unistr('Batista'), unistr('Hodierna'),1597,1660);
insert into discoverers values(discoverers_seq.nextval,  unistr('Carl'), unistr('Frederick'), unistr('Pech\00fcle'),1843,1914);
insert into discoverers values(discoverers_seq.nextval,  unistr('Guillaume'), unistr('Hyazinthe'), unistr('Legentil'),1725,1792);
insert into discoverers values(discoverers_seq.nextval,  unistr('Alphonse'), unistr('Louis Nicholas'), unistr('Borrelly'),1842,1926);
insert into discoverers values(discoverers_seq.nextval,  unistr('Johann'), unistr(null), unistr('Palisa'),1848,1925);
insert into discoverers values(discoverers_seq.nextval,  unistr('Ralph'), unistr(null), unistr('Copeland'),1837,1905);
insert into discoverers values(discoverers_seq.nextval,  unistr('Christian'), unistr('Heinrich Friedrich'), unistr('Peters'),1813,1890);
insert into discoverers values(discoverers_seq.nextval,  unistr('Nicolas-Louis'), unistr(null), unistr('de Lacaille'),1713,1762);
insert into discoverers values(discoverers_seq.nextval,  unistr('Johann'), unistr('Abraham'), unistr('Ihle'),1627,1699);
insert into discoverers values(discoverers_seq.nextval,  unistr('Karoline'), unistr('Lucretia'), unistr('Herschel'),1750,1848);
insert into discoverers values(discoverers_seq.nextval,  unistr('Claudius'), unistr(null), unistr('Ptolem\00e4us'),87,165);
insert into discoverers values(discoverers_seq.nextval,  unistr('John'), unistr(null), unistr('Bevis'),1695,1771);
insert into discoverers values(discoverers_seq.nextval,  unistr('Abd-al-Rahman'), unistr(null), unistr('Al Sufi'),903,986);
insert into discoverers values(discoverers_seq.nextval,  unistr('Eduard'), unistr(null), unistr('Sch\00f6nfeld'),1828,1891);
insert into discoverers values(discoverers_seq.nextval,  unistr('Aristoteles'), unistr(null), unistr(null),-384,-322);
insert into discoverers values(discoverers_seq.nextval,  unistr('John'), unistr(null), unistr('Flamsteed'),1646,1719);
insert into discoverers values(discoverers_seq.nextval,  unistr('Jean'), unistr(null), unistr('Chacornac'),1823,1873);
insert into discoverers values(discoverers_seq.nextval,  unistr('William'), unistr(null), unistr('Parsons'),1800,1867);
insert into discoverers values(discoverers_seq.nextval,  unistr('J.'), unistr('Gerhard'), unistr('Lohse'),1851,1941);
insert into discoverers values(discoverers_seq.nextval,  unistr('Antoine'), unistr('Darquier'), unistr('de Pellepoix'),1718,1802);
insert into discoverers values(discoverers_seq.nextval,  unistr('Edward'), unistr('Singleton'), unistr('Holden'),1846,1914);
insert into discoverers values(discoverers_seq.nextval,  unistr('Edward'), unistr(null), unistr('Swift'),1871,null);
insert into discoverers values(discoverers_seq.nextval,  unistr('James'), unistr(null), unistr('Dunlop'),1793,1848);
insert into discoverers values(discoverers_seq.nextval,  unistr('John'), unistr('Russell'), unistr('Hind'),1823,1895);
insert into discoverers values(discoverers_seq.nextval,  unistr('Frank'), unistr(null), unistr('Muller'),1862,1917);
insert into discoverers values(discoverers_seq.nextval,  unistr('Johann'), unistr('Gottfried'), unistr('Koehler'),1745,1801);
insert into discoverers values(discoverers_seq.nextval,  unistr('Edward'), unistr('Joshua'), unistr('Cooper'),1798,1863);
insert into discoverers values(discoverers_seq.nextval,  unistr('Francis'), unistr('Preserved'), unistr('Leavenworth'),1858,1928);
insert into discoverers values(discoverers_seq.nextval,  unistr('John'), unistr('Frederick William'), unistr('Herschel'),1792,1871);
insert into discoverers values(discoverers_seq.nextval,  unistr('Andrew'), unistr('Ainslie'), unistr('Common'),1841,1903);
insert into discoverers values(discoverers_seq.nextval,  unistr('Jean'), unistr('Phillippe Loys'), unistr('de Cheseaux'),1718,1751);
insert into discoverers values(discoverers_seq.nextval,  unistr('Friedrich'), unistr('Wilhelm'), unistr('Herschel'),1738,1822);
insert into discoverers values(discoverers_seq.nextval,  unistr('Ernst'), unistr('Wilhelm Leberecht'), unistr('Tempel'),1821,1889);
insert into discoverers values(discoverers_seq.nextval,  unistr('Gaspare'), unistr('Stanislao'), unistr('Ferrari'),1834,1903);
insert into discoverers values(discoverers_seq.nextval,  unistr('Lawrence'), unistr(null), unistr('Parsons'),1840,1908);
insert into discoverers values(discoverers_seq.nextval,  unistr('George'), unistr('"Jupiter" Washington'), unistr('Hough'),1836,1909);
insert into discoverers values(discoverers_seq.nextval,  unistr('Guillaume'), unistr(null), unistr('Bigourdan'),1851,1932);
insert into discoverers values(discoverers_seq.nextval,  unistr('Mark'), unistr('Walrod'), unistr('Harrington'),1848,1926);
insert into discoverers values(discoverers_seq.nextval,  unistr('Theodor'), unistr('Johann Christian Ambders'), unistr('Brorsen'),1819,1895);
insert into discoverers values(discoverers_seq.nextval,  unistr('Johann'), unistr('Elert'), unistr('Bode'),1747,1826);
insert into discoverers values(discoverers_seq.nextval,  unistr('Robert'), unistr('Stawell'), unistr('Ball'),1840,1913);
