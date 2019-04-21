create database BDSalud;
use BDSalud;

create table Enfermedad(
cod_enfer char(5) NOT NULL,
desc_enfer varchar(100),
nom_enfer varchar(50),
sist_enfer varchar(50),
PRIMARY KEY (cod_enfer));

create table Paciente(
cod_paci char(5) NOT NULL,
nom_paci varchar(20),
edad_paci int,
sexo_paci char(1),
cod_enfer char(5) NOT NULL,
PRIMARY KEY (cod_paci),
INDEX(cod_enfer),
FOREIGN KEY (cod_enfer) REFERENCES Enfermedad(cod_enfer));

create table Medicina(
cod_medi char(5) NOT NULL,
nom_medi varchar(50),
cura_medi varchar(50),
cod_enfer char(5) NOT NULL,
INDEX (cod_enfer),
PRIMARY KEY (cod_medi),
FOREIGN KEY(cod_enfer) REFERENCES Enfermedad(cod_enfer));

create table Dosis(
cod_dosis char(5) NOT NULL,
desc_dosis varchar(50),
canti_dosis varchar(50),
cod_enfer char(5) NOT NULL,
PRIMARY KEY (cod_dosis),
INDEX (cod_enfer),
FOREIGN KEY(cod_enfer) REFERENCES Enfermedad(cod_enfer));

create table Sintomas(
cod_sint char(5) NOT NULL,
desc_sint varchar(50),
cod_paci char(5) NOT NULL,
cod_enfer char(5) NOT NULL,
INDEX (cod_paci),
INDEX (cod_enfer),
PRIMARY KEY (cod_sint),
FOREIGN KEY(cod_paci) REFERENCES Paciente(cod_paci),
FOREIGN KEY(cod_enfer) REFERENCES Enfermedad(cod_enfer));


-- INSERTS
insert into Enfermedad values ('ENF01','Dolor de cabeza con malestar en el cuerpo','Gripe','Inmunologico');
insert into Enfermedad values ('ENF02',"Enfermedad causada por agua en la espalda","Bronquios","Respiratorio");

insert into Paciente values ('PAC01','Luis',20,'M','ENF02');
insert into Paciente values ('PAC02','Diego',23,'M','ENF01');
insert into Paciente values ('PAC03','Aaron',22,'M','ENF02');
insert into Paciente values ('PAC04','Anthony',24,'M','ENF01');
insert into Paciente values ('PAC05','Alvaro',23,'M','ENF02');
 
insert into Medicina values('MED01','Nastisol','Gripe','ENF01');
insert into Medicina values('MED02','Jarabe para la TOS','Bronquios','ENF02');

insert into Dosis values('DOS01','Tomar en las mañanas y noches','2 pastilas','ENF01');
insert into Dosis values('DOS02','Tomar despúes de cada comida','1 pastila','ENF02');
 
select * from Enfermedad;
select * from Paciente;
select * from Medicina;
select * from Dosis;

--
call sp_EnfermedadXSintomas("Dolor de cabeza con malestar en el cuerpo");
call sp_MedicamentoXEnfermedad("Bronquios");
call sp_ListadoPacientes('PAC01');


    
    






