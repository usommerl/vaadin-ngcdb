create table imageproviders (
 abbr varchar(4) constraint pk_imageproviders primary key,
 fullname varchar(40) not null
);

insert into imageproviders values('ESA','European Space Agency');
insert into imageproviders values('ESO','European Southern Observatory');
insert into imageproviders values('INT','Isaac Newton Telescope');
insert into imageproviders values('AAO','Australian Astronomical Observatory');
insert into imageproviders values('PSSC','Paper Street Soap Company');

