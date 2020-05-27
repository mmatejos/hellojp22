#  c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\hello\videoteka.sql

drop database if exists videoteka;
create database videoteka;
use videoteka;


create table posudba(
		id_posudba int not null primary key auto_increment,
		datum_posudbe datetime,
		datum_povratka datetime,
		film int not null,
		klijent int not null,
		radnik int not null
);

create table film(
		id_film int not null primary key auto_increment,
		naziv varchar(50) not null,
		redatelj varchar(50) not null,
		zanr varchar(50) not null,
		god_izlaska datetime
);




create table nesto(
		posudba int not null,
		radnik int not null
);


create table klijent(
		id_klijent int not null primary key auto_increment,
		ime varchar(50) not null,
		prezime varchar(50) not null,
		br_telefona varchar(30) not null,
		email varchar(100),
		spol varchar (60),
		starost varchar(30)
		
);



create table osoba(
		id_osoba int not null primary key auto_increment,
		ime varchar(50) not null,
		prezime varchar(50) not null,
		br_telefona varchar(30) not null,
		email varchar(100) 
);


create table radnik(
		id_radnik int not null primary key auto_increment,
		ime varchar(50) not null,
		prezime varchar(50) not null,
		br_telefona varchar(30) not null,
		email varchar(50),
		oib char(11)not null,
		iban varchar(30) not null,
		smjena varchar(30)
);

alter table posudba add foreign key (film) references film(id_film);
alter table posudba add foreign key (klijent) references klijent(id_klijent);
alter table posudba add foreign key (radnik) references radnik(id_radnik);

