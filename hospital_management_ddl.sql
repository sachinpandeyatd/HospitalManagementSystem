drop database if exists hospital_management;

create database hospital_management;

use hospital_management;

Create Table DoctorDetails (
	doctor_id int primary key auto_increment,
    doctor_name varchar(255),
    doctor_specialization varchar(255),
    experience double,
    doctor_status enum ('AVAILABLE', 'UNAVAILABLE')
);

Create Table PatientDetails(
	patient_id int primary key auto_increment,
    patient_name varchar(255),
    patient_phone varchar(255),
    patient_address text(2000), 
    patient_email varchar(255)
);

Create Table TreatmentDetails(
	treatment_id int primary key auto_increment,
    patient_id int not null,
    doctor_id int not null,
    visitingOrAdmitting tinyint,
    treatment_date date,
    discharge_date date,
    issue text(2000),
    
    foreign key(patient_id) references PatientDetails(patient_id),
    foreign key(doctor_id) references DoctorDetails(doctor_id)
);

Create Table PaymentDetails(
	payment_id int primary key auto_increment,
    amount double,
    due_amount double,
    payment_date date,
    paymode varchar(255),
    patient_id int not null,
    
    foreign key(patient_id) references PatientDetails(patient_id)
);

Create Table Admission (
	admission_id int auto_increment primary key,
    patient_id int not null,
    room_id int,
    room_type varchar(255),
    room_status enum ('AVAILABLE', 'UNAVAILABLE'),
    room_cost double,
    
    foreign key(patient_id) references PatientDetails(patient_id)
);

Create Table Medical_history(
	med_his_id int auto_increment primary key,
    patient_id int not null,
    treatment_day int,
    treatment_description text(2000),
    treatment_id int not null,
    
    foreign key(patient_id) references PatientDetails(patient_id)
)
