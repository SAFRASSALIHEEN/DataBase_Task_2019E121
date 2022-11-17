create database demo1
use demo1;

create table diagnosis
(
diag_num double not null ,
Diag_Date date not null,
remarks varchar(15),
other_det varchar(15),
Pat_ID double not null,
primary key (diag_num)
-- foreign key (Pat_ID) references patient(Pat_ID)
);

create table patient
(
Pat_ID double not null ,
Doc_ID double not null,
Gender char(10) not null,
F_name varchar(15)not null,
L_name varchar(15) not null,
tel_num double not null,
age double  not null,
address varchar(25) not null,
primary key (Pat_ID)
-- foreign key (Doc_ID) references Doc_ID
);

create table doctor
(
Doc_ID double not null,
Gender char(10) not null,
F_name varchar(15) not null,
L_name varchar(15) not null,
tel_num double not null,
designation varchar(15) not null,
 Pat_ID double not null ,
 staff_ID double not null,
primary key (Doc_ID)
-- foreign key (Pat_ID) references patients(Pat_ID)
-- foreign key (staff_ID) references staff(staff_ID)
);

create table staff
(
staff_ID double not null,
Gender char(10) not null,
Dept varchar(15) not null,
F_name varchar(15) not null,
L_name varchar(15) not null,
tel_num double not null,
Doc_ID double not null,
bill_num double not null,
primary key (staff_ID)
 -- foreign key (Doc_ID) references Doc_ID,
 -- foreign key (bill_num) references bill(bill_num)
);

create table bill
(
bill_num double not null,
bill_date date not null,
bill_amount double not null,
pay_way varchar(15) not null,
 Pat_ID double not null,
 staff_ID double not null,
primary key (bill_num)
 -- foreign key (Pat_ID ) references Pat_ID,
 -- foreign key (staff_ID) references staff_ID
);

create table drug
(
trade_name varchar(15) not null,
formula varchar(15) not null,
price double not null,
Pat_ID double not null,
Doc_ID double not null 
-- foreign key (Pat_ID ) references Pat_ID,
 -- foreign key (Doc_ID) references Doc_ID
);

create table prescription
(
 Doc_ID double,
 Pat_ID double,
quantity double,
pres_date date
-- foreign key (Pat_ID ) references Pat_ID,
 -- foreign key (Doc_ID) references Doc_ID
);

create table has
(
Pat_ID double,
Diag_num double
-- foreign key (Pat_ID ) references Pat_ID,
 -- foreign key (diag_num) references diag_num
);

create table treatment
(
Pat_ID double,
Doc_ID double
 -- foreign key (Pat_ID ) references Pat_ID,
 -- foreign key (Doc_ID) references Doc_ID
);

create table treats
(
Diag_num double,
Doc_ID double
 -- foreign key (Doc_ID) references Doc_ID,
 -- foreign key (diag_num) references diag_num
);

create table contact
(
staff_ID double,
Doc_ID double
 -- foreign key (staff_ID ) references staff_ID,
 -- foreign key (Doc_ID) references Doc_ID
);

alter table diagnosis
add foreign key (Pat_ID) references patient(Pat_ID);

alter table patient
add foreign key (Doc_ID) references doctor(Doc_ID);

alter table doctor
add foreign key (Pat_ID) references patient(Pat_ID),
add foreign key (staff_ID) references staff(staff_ID);

alter table staff
add foreign key (Doc_ID) references doctor(Doc_ID),
add foreign key (bill_num) references bill(bill_num);

alter table bill
add foreign key (Pat_ID) references patient(Pat_ID),
add foreign key (staff_ID) references staff(staff_ID);

alter table drug
add foreign key (Pat_ID) references patient(Pat_ID),
add foreign key (Doc_ID) references doctor(Doc_ID);

alter table prescription
add foreign key (Pat_ID) references patient(Pat_ID),
add foreign key (Doc_ID) references doctor(Doc_ID);

alter table has
add foreign key (Pat_ID) references patient(Pat_ID),
add foreign key (diag_num ) references diagnosis(diag_num );

alter table treatment
add foreign key (Pat_ID) references patient(Pat_ID),
add foreign key (Doc_ID) references doctor(Doc_ID);

alter table treats
add foreign key (diag_num ) references diagnosis(diag_num ),
add foreign key (Doc_ID) references doctor(Doc_ID);

alter table contact
add foreign key (staff_ID) references staff(staff_ID),
add foreign key (Doc_ID) references doctor(Doc_ID);