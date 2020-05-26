#  c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\vjezba1.sql

drop database if exists vjezba1;
create database vjezba1;
use vjezba1;

create table sestra_svekar(
		sifra int not null primary key auto_increment,
		sestra int not null,
		svekar int not null
);


create table svekar(
		sifra int not null primary key auto_increment,
		bojaociju varchar(40) not null,
		prstena int,
		dukserica varchar(41),
		lipa decimal(31,8),
		eura decimal(12,7),
		majica varchar(35)
);

create table sestra (
		sifra int not null primary key auto_increment,
		introvertno bit,
		haljina varchar(31) not null,
		maraka decimal(16,6),
		hlace varchar(46) not null,
		narukvica int not null
		);
		
create table zena(
		sifra int not null primary key auto_increment,
		treciput datetime,
		hlace varchar(46),
		kratkamajica varchar(31) not null,
		jmbag char(11) not null,
		bojaociju varchar(39) not null,
		haljina varchar(44),
		sestra int not null
		);
		
create table muskarac(
		sifra int not null primary key auto_increment,
		bojaociju varchar(50) not null,
		hlace varchar(30),
		modelnaocala varchar(43),
		maraka decimal(14,5) not null,
		zena int not null
);	

create table mladic(
		sifra int not null primary key auto_increment,
		suknja varchar(50) not null,
		kuna decimal(16,8) not null,
		drugiput	datetime,
		asocijalno bit,
		ekstroventno bit not null,
		dukserica varchar(48) not null,
		muskarac int
);

create table punac(
		sifra int not null primary key auto_increment,
		ogrlica int,
		gustoca decimal(14,9),
		hlace varchar(41) not null
);

create table cura(
		sifra int not null primary key auto_increment,
		novcica decimal(16,5) not null,
		gustoca decimal(18,6) not null,
		lipa decimal(13,10),
		ogrlica int not null,
		bojakose varchar(38),
		suknja varchar(36),
		punac int
);


alter table sestra_svekar add foreign key (svekar) references svekar(sifra);
alter table sestra_svekar add foreign key (sestra) references sestra(sifra);

alter table zena add foreign key (sestra) references sestra(sifra);

alter table muskarac add foreign key (zena) references zena(sifra);

alter table mladic add foreign key (muskarac) references muskarac(sifra);

alter table cura add foreign key (punac) references punac(sifra);


insert into sestra(introvertno,haljina,maraka,hlace,narukvica) values (1,'plava',36,'dugacke','1');
insert into sestra(introvertno,haljina,maraka,hlace,narukvica) values (1,'siva',28,'dugacke','2');
insert into sestra(introvertno,haljina,maraka,hlace,narukvica) values (0,'zelena',29,'kratke','3');


insert into zena(treciput,hlace,kratkamajica, jmbag , bojaociju ,haljina, sestra ) values ('1988-09-25','plava','duge',12345678910,'plava','cvijetna', 1);
insert into zena(treciput,hlace,kratkamajica, jmbag , bojaociju ,haljina, sestra ) values ('1987-10-11','siva','sportske',12345678910,'roza','crvena', 2);
insert into zena(treciput,hlace,kratkamajica, jmbag , bojaociju ,haljina, sestra ) values ('1986-11-12','zelena','kratke',12345678910,'zuta','mini', 3);

insert into muskarac(bojaociju, hlace, modelnaocala, maraka, zena) values ('plava', 'duge', 'okrugle', 78 , 1);
insert into muskarac(bojaociju, hlace, modelnaocala, maraka, zena) values ('zelena', 'kratke', 'kockaste', 59 , 2);
insert into muskarac(bojaociju, hlace, modelnaocala, maraka, zena) values ('zuta', 'poluduge', 'nekakve', 65 , 3);

insert into svekar(bojaociju,prstena, dukserica, lipa, eura, majica) values ('crne', 1, 'zuta', 45, 12,'kratka');
insert into svekar(bojaociju,prstena, dukserica, lipa, eura, majica) values ('bijelo', 5, 'smeđa', 36, 5,'duga');
insert into svekar(bojaociju,prstena, dukserica, lipa, eura, majica) values ('siva', 6, 'bijela', 12, 7,'nesto');

insert into sestra_svekar(sestra,svekar) values (1,2);
insert into sestra_svekar(sestra,svekar) values (2,3);
insert into sestra_svekar(sestra,svekar) values (3,1);

# select * from mladic;

insert into mladic(suknja,kuna,drugiput,ekstroventno,dukserica,muskarac ) values ('kratka',1, '1992-03-11',0,'siva', 1);

update cura set gustoca='15,77';

delete from mladic where kuna>'15,78';

select kratkamajica from zena where hlace like '%ana%';


select a.dukserica, f.asocijalno, e.hlace
from svekar a 
inner join sestra_svekar b on a.sifra=b.svekar
inner join sestra c on c.sifra=b.sestra
inner join zena d on d.sestra=c.sifra
inner join muskarac e on e.zena=d.sifra
inner join mladic f on f.muskarac=e.sifra
where d.hlace like 'a%' and 
c.haljina like '%ba%'
order by e.hlace desc;



select a.haljina , a.maraka
from sestra a
inner join sestra_svekar b on a.sifra=b.sifra;



















