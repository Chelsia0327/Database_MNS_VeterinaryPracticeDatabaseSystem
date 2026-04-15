--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T4-mns-alter.sql

--Student ID: 34202978
--Student Name: Ye Chen
--Unit Code: FIT9132
--Applied Class No:  A06

/* Comments for your marker:




*/

--4(a)
ALTER TABLE patient ADD (
    total_appt NUMBER(2) DEFAULT 0
);

COMMENT ON COLUMN patient.total_appt IS
    'Total number of appointments for each patient';

UPDATE patient p
SET
    total_appt = (
        SELECT
            COUNT(patient_no) AS total_appt
        FROM
            appointment a
        WHERE
            p.patient_no = a.patient_no
    );

COMMIT;

DESC patient;
--4(b)
DROP TABLE patient_ec CASCADE CONSTRAINTS;

CREATE TABLE patient_ec
    AS
        SELECT
            ec_id,
            patient_no
        FROM
            patient;

COMMENT ON COLUMN patient_ec.ec_id IS
    'Emergency contact identifier';

COMMENT ON COLUMN patient_ec.patient_no IS
    'Patient number (unique for each patient)';

ALTER TABLE patient_ec ADD CONSTRAINT patient_ec_pk PRIMARY KEY ( ec_id,
                                                                  patient_no );

ALTER TABLE patient_ec
    ADD CONSTRAINT ec_patient_ec_fk FOREIGN KEY ( ec_id )
        REFERENCES emergency_contact ( ec_id );

ALTER TABLE patient_ec
    ADD CONSTRAINT patient_patient_ec_fk FOREIGN KEY ( patient_no )
        REFERENCES patient ( patient_no );

ALTER TABLE patient DROP COLUMN ec_id;

COMMIT;

SELECT
    *
FROM
    patient_ec;

SELECT
    *
FROM
    patient;

DESC patient_ec;
DESC patient;

--4(c)
DROP TABLE nurse_training CASCADE CONSTRAINTS;

CREATE TABLE nurse_training (
    nt_trainee_no NUMBER(3) NOT NULL,
    nt_startdt    DATE NOT NULL,
    nt_trainer_no NUMBER(3) NOT NULL,
    nt_enddt      DATE NOT NULL,
    nt_desc       VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN nurse_training.nt_trainee_no IS
    'Nurse identifier (unique) for trainee';

COMMENT ON COLUMN nurse_training.nt_startdt IS
    'Training start date and time';

COMMENT ON COLUMN nurse_training.nt_trainer_no IS
    'Nurse identifier (unique) for trainer';

COMMENT ON COLUMN nurse_training.nt_enddt IS
    'Training end date and time';

COMMENT ON COLUMN nurse_training.nt_desc IS
    'Training description';

ALTER TABLE nurse_training ADD CONSTRAINT nurse_training_pk PRIMARY KEY ( nt_trainee_no
,
                                                                          nt_startdt )
                                                                          ;

ALTER TABLE nurse_training
    ADD CONSTRAINT nurse_trainee_fk FOREIGN KEY ( nt_trainee_no )
        REFERENCES nurse ( nurse_no );

ALTER TABLE nurse_training
    ADD CONSTRAINT nurse_trainer_fk FOREIGN KEY ( nt_trainer_no )
        REFERENCES nurse ( nurse_no );

COMMIT;

desc nurse_training;