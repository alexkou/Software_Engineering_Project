DROP DATABASE ProjectT;
CREATE DATABASE ProjectT;
USE ProjectT;
CREATE TABLE userr (
id INT (3) NOT NULL
);
CREATE TABLE patient (
amka INT (5)  NOT NULL
);
CREATE TABLE diagnosis(
patient_name VARCHAR(255) DEFAULT 'unknown' NOT NULL
);
CREATE TABLE stuff(
stuff_type ENUM('Doctor','Receptionist') 
);
CREATE TABLE adminn (
onoma VARCHAR(255) NOT NULL
);
CREATE TABLE medicines(
title VARCHAR(255) DEFAULT 'unknown' NOT NULL
);
CREATE TABLE test_results(
title VARCHAR(255) DEFAULT 'unknown' NOT NULL
);
CREATE TABLE record (
p_date DATE NOT NULL
);
CREATE TABLE appointment(
ap_date DATE NOT NULL
);
CREATE TABLE doctor(
speciality ENUM ('paidiatros','xeirourgos')
);
CREATE TABLE reception(
r_name VARCHAR(255) 
);
CREATE TABLE lab(
l_name VARCHAR(255) 
);
CREATE TABLE v_manager(
v_name VARCHAR(255) 
);
CREATE TABLE supplies(
s_name VARCHAR(255) 
);
CREATE TABLE visit(
d_name VARCHAR(255) DEFAULT 'unknown'
);
CREATE TABLE tests(
title VARCHAR(255) 
);
CREATE TABLE c19_vaccine(
title VARCHAR(255) 
);