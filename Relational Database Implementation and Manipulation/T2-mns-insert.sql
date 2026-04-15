--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T2-mns-insert.sql

--Student ID: 34202978
--Student Name: Ye Chen
--Unit Code: FIT9132
--Applied Class No:  A06

/* Comments for your marker:




*/

--------------------------------------
--INSERT INTO emergency_contact
--------------------------------------
INSERT INTO emergency_contact VALUES (
    1,
    'Bill',
    'Gates',
    '0493876123'
);

INSERT INTO emergency_contact VALUES (
    2,
    'Jeff',
    'Bezos',
    '0492000832'
);

INSERT INTO emergency_contact VALUES (
    3,
    'Steve',
    'Ballmer',
    '0492637999'
);

INSERT INTO emergency_contact VALUES (
    4,
    'Selena',
    'Gomez',
    '0493528646'
);

INSERT INTO emergency_contact VALUES (
    5,
    'Elon',
    'Musk',
    '0496859231'
);
--------------------------------------
--INSERT INTO patient
--------------------------------------
INSERT INTO patient VALUES (
    10,
    'Bernard',
    'Arnault',
    'Mitchell St',
    'Darwin',
    'NT',
    '0800',
    TO_DATE('05-Mar-1949', 'dd-mon-yyyy'),
    '0495332913',
    'bernard.arnault@lvmh.com',
    5
);

INSERT INTO patient VALUES (
    11,
    'Mark',
    'Zuckerberg',
    'Mercer St',
    'Melbourne',
    'VIC',
    '3166',
    TO_DATE('14-May-1984', 'dd-mon-yyyy'),
    '0496538700',
    'zuckerberg@facebook.com',
    5
);

INSERT INTO patient VALUES (
    12,
    'Larry',
    'Page',
    'Belvoir St',
    'Sydney',
    'NSW',
    '2010',
    TO_DATE('26-Mar-1973', 'dd-mon-yyyy'),
    '0492466777',
    'larry.page@google.com',
    5
);

INSERT INTO patient VALUES (
    13,
    'Eileen',
    'Gu',
    'Bunda St',
    'Canberra',
    'ACT',
    '2608',
    TO_DATE('03-Sep-2003', 'dd-mon-yyyy'),
    '0493570089',
    'eileengu0309@gmail.com',
    4
);

INSERT INTO patient VALUES (
    14,
    'Taylor',
    'Swift',
    'Judith St',
    'Melbourne',
    'VIC',
    '3125',
    TO_DATE('13-Dec-1989', 'dd-mon-yyyy'),
    '0497882934',
    'taylorswift@umgstores.com',
    4
);

INSERT INTO patient VALUES (
    15,
    'Ryan',
    'Kaji',
    'Hill St',
    'Tasmania',
    'TAS',
    '7000',
    TO_DATE('06-Oct-2011', 'dd-mon-yyyy'),
    '0492388540',
    'ryankaji@gmail.com',
    4
);

INSERT INTO patient VALUES (
    16,
    'Kitty',
    'Gates',
    'Cowra St',
    'Adelaide',
    'SA',
    '5031',
    TO_DATE('28-Apr-2015', 'dd-mon-yyyy'),
    '0491235432',
    'kittygates@gmail.com',
    1
);

INSERT INTO patient VALUES (
    17,
    'Summer',
    'Bezos',
    'Kenora St',
    'Brisbane',
    'QLD',
    '4122',
    TO_DATE('01-Apr-2014', 'dd-mon-yyyy'),
    '0492276610',
    'summerbezos@gmail.com',
    2
);

INSERT INTO patient VALUES (
    18,
    'Momo',
    'Ballmer',
    'Coora St',
    'Brisbane',
    'QLD',
    '4122',
    TO_DATE('15-Aug-2010', 'dd-mon-yyyy'),
    '0497776390',
    'momoballmer@gmail.com',
    3
);

INSERT INTO patient VALUES (
    19,
    'Jerry',
    'Ballmer',
    'Gay St',
    'Perth',
    'WA',
    '6110',
    TO_DATE('18-Sep-2012', 'dd-mon-yyyy'),
    '0497244536',
    'jerryballmer@gmail.com',
    3
);
--------------------------------------
--INSERT INTO appointment
--------------------------------------
INSERT INTO appointment VALUES (
    50,
    TO_DATE('10-May-2023 09:30 AM', 'dd-mon-yyyy hh:mi AM'),
    1,
    'T',
    16,
    'END001',
    5,
    NULL
);

INSERT INTO appointment VALUES (
    51,
    TO_DATE('10-May-2023 01:00 PM', 'dd-mon-yyyy hh:mi AM'),
    1,
    'S',
    16,
    'END001',
    5,
    50
);

INSERT INTO appointment VALUES (
    52,
    TO_DATE('10-May-2023 02:00 PM', 'dd-mon-yyyy hh:mi AM'),
    2,
    'S',
    12,
    'GEN001',
    6,
    NULL
);

INSERT INTO appointment VALUES (
    53,
    TO_DATE('10-May-2023 02:00 PM', 'dd-mon-yyyy hh:mi AM'),
    3,
    'S',
    10,
    'GEN002',
    2,
    NULL
);

INSERT INTO appointment VALUES (
    54,
    TO_DATE('10-May-2023 03:00 PM', 'dd-mon-yyyy hh:mi AM'),
    4,
    'L',
    13,
    'GEN003',
    1,
    NULL
);

INSERT INTO appointment VALUES (
    55,
    TO_DATE('11-May-2023 09:00 AM', 'dd-mon-yyyy hh:mi AM'),
    5,
    'L',
    14,
    'ORS001',
    1,
    NULL
);

INSERT INTO appointment VALUES (
    58,
    TO_DATE('11-May-2023 10:00 AM', 'dd-mon-yyyy hh:mi AM'),
    4,
    'T',
    13,
    'GEN003',
    3,
    54
);

INSERT INTO appointment VALUES (
    61,
    TO_DATE('11-May-2023 11:00 AM', 'dd-mon-yyyy hh:mi AM'),
    6,
    'T',
    11,
    'PED001',
    4,
    NULL
);

INSERT INTO appointment VALUES (
    65,
    TO_DATE('11-May-2023 01:00 PM', 'dd-mon-yyyy hh:mi AM'),
    6,
    'S',
    11,
    'PED001',
    2,
    61
);

INSERT INTO appointment VALUES (
    66,
    TO_DATE('11-May-2023 02:00 PM', 'dd-mon-yyyy hh:mi AM'),
    6,
    'T',
    18,
    'PED001',
    7,
    NULL
);

INSERT INTO appointment VALUES (
    67,
    TO_DATE('11-May-2023 03:00 PM', 'dd-mon-yyyy hh:mi AM'),
    1,
    'T',
    15,
    'END001',
    3,
    NULL
);

INSERT INTO appointment VALUES (
    69,
    TO_DATE('12-May-2023 11:00 AM', 'dd-mon-yyyy hh:mi AM'),
    3,
    'T',
    17,
    'GEN002',
    3,
    NULL
);

INSERT INTO appointment VALUES (
    70,
    TO_DATE('12-May-2023 11:00 AM', 'dd-mon-yyyy hh:mi AM'),
    5,
    'S',
    19,
    'ORS001',
    2,
    NULL
);

INSERT INTO appointment VALUES (
    75,
    TO_DATE('12-May-2023 02:00 PM', 'dd-mon-yyyy hh:mi AM'),
    5,
    'S',
    19,
    'ORS001',
    2,
    70
);

INSERT INTO appointment VALUES (
    80,
    TO_DATE('12-May-2023 03:00 PM', 'dd-mon-yyyy hh:mi AM'),
    2,
    'L',
    12,
    'GEN001',
    5,
    52
);

COMMIT;