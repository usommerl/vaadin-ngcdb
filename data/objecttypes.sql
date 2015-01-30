create sequence objecttypes_seq
 minvalue 1
 start with 1
 increment by 1
 cache 20;

create table objecttypes (
 id number constraint pk_objecttypes primary key,
 name varchar2(30),
 parentID number,
 constraint fk_objecttypes foreign key (parentID) references objecttypes (id)
);

insert into objecttypes values(objecttypes_seq.nextVal, 'Nebula', null);
insert into objecttypes values(objecttypes_seq.nextVal, 'Galaxy', null);
insert into objecttypes values(objecttypes_seq.nextVal, 'Galaxy Cluster', null);
insert into objecttypes values(objecttypes_seq.nextVal, 'Star', null);
insert into objecttypes values(objecttypes_seq.nextVal, 'Star Cluster', null);
insert into objecttypes values(objecttypes_seq.nextVal, 'Star System', null);
insert into objecttypes values(objecttypes_seq.nextVal, 'Supernova Remnant', null);
insert into objecttypes values(objecttypes_seq.nextVal, 'Herbig-Haro Object', null);
insert into objecttypes values(objecttypes_seq.nextVal, 'Nonexistent Object', null);
insert into objecttypes values(objecttypes_seq.nextVal, 'Unknown', null);

insert into objecttypes values(objecttypes_seq.nextVal, 'Planetary Nebula', (select id from objecttypes where name = 'Nebula'));
insert into objecttypes values(objecttypes_seq.nextVal, 'Diffuse Nebula', (select id from objecttypes where name = 'Nebula'));
insert into objecttypes values(objecttypes_seq.nextVal, 'Emission Nebula', (select id from objecttypes where name = 'Nebula'));

insert into objecttypes values(objecttypes_seq.nextVal, 'Spiral Galaxy', (select id from objecttypes where name = 'Galaxy'));
insert into objecttypes values(objecttypes_seq.nextVal, 'Barred Spiral Galaxy', (select id from objecttypes where name = 'Spiral Galaxy'));
insert into objecttypes values(objecttypes_seq.nextVal, 'Spiral Arm', (select id from objecttypes where name = 'Spiral Galaxy'));
insert into objecttypes values(objecttypes_seq.nextVal, 'Lenticular Galaxy', (select id from objecttypes where name = 'Galaxy'));
insert into objecttypes values(objecttypes_seq.nextVal, 'Barred Lenticular Galaxy', (select id from objecttypes where name = 'Lencticular Galaxy'));
insert into objecttypes values(objecttypes_seq.nextVal, 'Elliptical Galaxy', (select id from objecttypes where name = 'Galaxy'));
insert into objecttypes values(objecttypes_seq.nextVal, 'Irregular Galaxy', (select id from objecttypes where name = 'Galaxy'));
insert into objecttypes values(objecttypes_seq.nextVal, 'Ring Galaxy', (select id from objecttypes where name = 'Galaxy'));
insert into objecttypes values(objecttypes_seq.nextVal, 'Interacting Galaxy', (select id from objecttypes where name = 'Galaxy'));

insert into objecttypes values(objecttypes_seq.nextVal, 'Open Cluster', (select id from objecttypes where name = 'Star Cluster'));
insert into objecttypes values(objecttypes_seq.nextVal, 'Globular Cluster', (select id from objecttypes where name = 'Star Cluster'));

insert into objecttypes values(objecttypes_seq.nextVal, 'Double Star', (select id from objecttypes where name = 'Star System'));
insert into objecttypes values(objecttypes_seq.nextVal, 'Triple Star', (select id from objecttypes where name = 'Star System'));
insert into objecttypes values(objecttypes_seq.nextVal, 'Asterism', (select id from objecttypes where name = 'Star System'));
insert into objecttypes values(objecttypes_seq.nextVal, 'Association Of Stars', (select id from objecttypes where name = 'Star System'));

