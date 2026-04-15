--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-mns-dm.sql

--Student ID: 34202978
--Student Name: Ye Chen
--Unit Code: FIT9132
--Applied Class No:  A06

/* Comments for your marker:




*/


--3(a)
DROP SEQUENCE emergency_contact_seq;

DROP SEQUENCE patient_seq;

DROP SEQUENCE appointment_seq;

CREATE SEQUENCE emergency_contact_seq START WITH 100 INCREMENT BY 5;

CREATE SEQUENCE patient_seq START WITH 100 INCREMENT BY 5;

CREATE SEQUENCE appointment_seq START WITH 100 INCREMENT BY 5;

--3(b)
INSERT INTO emergency_contact VALUES (
    emergency_contact_seq.NEXTVAL,
    'Jonathan',
    'Robey',
    '0412523122'
);

INSERT INTO patient VALUES (
    patient_seq.NEXTVAL,
    'Laura',
    'Robey',
    'Fern st',
    'Melbourne',
    'VIC',
    '3166',
    TO_DATE('10-May-2010', 'dd-mon-yyyy'),
    '0412523123',
    'laurarobey@gmail.com',
    emergency_contact_seq.CURRVAL
);

INSERT INTO appointment VALUES (
    appointment_seq.NEXTVAL,
    TO_DATE('04-Sep-2023 03:30 PM', 'dd-mon-yyyy hh:mi AM'),
    2,
    'S',
    patient_seq.CURRVAL,
    (
        SELECT
            provider_code
        FROM
            provider
        WHERE
                upper(provider_title) = upper('Dr')
            AND upper(provider_fname) = upper('Bruce')
            AND upper(provider_lname) = upper('STRIPLIN')
    ),
    6,
    NULL
);

INSERT INTO patient VALUES (
    patient_seq.NEXTVAL,
    'Lachlan',
    'Robey',
    'Fern st',
    'Melbourne',
    'VIC',
    '3166',
    TO_DATE('19-Mar-2013', 'dd-mon-yyyy'),
    '0412523124',
    'lachlanrobey@gmail.com',
    emergency_contact_seq.CURRVAL
);

INSERT INTO appointment VALUES (
    appointment_seq.NEXTVAL,
    TO_DATE('04-Sep-2023 04:00 PM', 'dd-mon-yyyy hh:mi AM'),
    2,
    'S',
    patient_seq.CURRVAL,
    (
        SELECT
            provider_code
        FROM
            provider
        WHERE
                upper(provider_title) = upper('Dr')
            AND upper(provider_fname) = upper('Bruce')
            AND upper(provider_lname) = upper('STRIPLIN')
    ),
    6,
    NULL
);

COMMIT;

--3(c)
INSERT INTO appointment VALUES (
    appointment_seq.NEXTVAL,
    TO_DATE('04-Sep-2023 04:00 PM', 'dd-mon-yyyy hh:mi AM') + 10,
    2,
    'S',
    (
        SELECT
            patient_no
        FROM
            patient
        WHERE
                upper(patient_fname) = upper('Lachlan')
            AND upper(patient_lname) = upper('Robey')
            AND ( ec_id = (
                SELECT
                    ec_id
                FROM
                    emergency_contact
                WHERE
                    ec_phone = '0412523122'
            ) )
    ),
    (
        SELECT
            provider_code
        FROM
            provider
        WHERE
                upper(provider_title) = upper('Dr')
            AND upper(provider_fname) = upper('Bruce')
            AND upper(provider_lname) = upper('STRIPLIN')
    ),
    14,
    (
        SELECT
            appt_no
        FROM
            appointment
        WHERE
            patient_no = (
                SELECT
                    patient_no
                FROM
                    patient
                WHERE
                        upper(patient_fname) = upper('Lachlan')
                    AND upper(patient_lname) = upper('Robey')
            )
    )
);

COMMIT;

--3(d)
UPDATE appointment
SET
    appt_datetime = TO_DATE('04-Sep-2023 04:00 PM', 'dd-mon-yyyy hh:mi AM') + 14
WHERE
        patient_no = (
            SELECT
                patient_no
            FROM
                patient
            WHERE
                    upper(patient_fname) = upper('Lachlan')
                AND upper(patient_lname) = upper('Robey')
        )
    AND nurse_no = 14;

COMMIT;

--3(e)
DELETE FROM appointment
WHERE
    appt_datetime BETWEEN TO_DATE('15-Sep-2023', 'dd-Mon-yyyy') AND TO_DATE('22-Sep-2023'
    , 'dd-Mon-yyyy')
    AND provider_code = (
        SELECT
            provider_code
        FROM
            provider
        WHERE
                upper(provider_title) = upper('Dr')
            AND upper(provider_fname) = upper('Bruce')
            AND upper(provider_lname) = upper('STRIPLIN')
    );

COMMIT;