--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T2-mns-select.sql

--Student ID: 34202978
--Student Name: Ye Chen
--Unit Code: FIT9132
--Applied Class No:  A06

/* Comments for your marker:




*/

/*2(a)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    item_id,
    item_desc,
    item_stdcost,
    item_stock
FROM
    mns.item
WHERE
    lower(item_desc) LIKE '%composite%'
    AND item_stock >= 50
ORDER BY
    item_stock DESC,
    item_id;

/*2(b)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    provider_code,
    CASE
        WHEN provider_title IS NOT NULL THEN
                provider_title || '. '
        ELSE
            ''
    END
    || ltrim(provider_fname
             || ' '
             || provider_lname) AS provider_name
FROM
         mns.provider
    NATURAL JOIN mns.specialisation
WHERE
    upper(specialisation.spec_name) = 'PAEDIATRIC DENTISTRY'
ORDER BY
    provider_lname,
    provider_fname,
    provider_code;

/*2(c)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    service_code,
    service_desc,
    lpad(to_char(service_stdfee, '$9990.99'),
         22,
         ' ') AS standardfee_higher_avg
FROM
    mns.service
WHERE
    service_stdfee > (
        SELECT
            AVG(service_stdfee)
        FROM
            mns.service
    )
ORDER BY
    service_stdfee DESC,
    service_code;

/*2(d)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    a.appt_no,
    appt_datetime,
    a.patient_no,
    substr(ltrim(patient_fname
                 || ' '
                 || patient_lname),
           0,
           25) AS patient_fullname,
    lpad(to_char(apptserv_fee + apptserv_itemcost, '$9990.99'),
         15,
         ' ')  AS total_cost
FROM
         mns.appointment a
    JOIN mns.patient p
    ON a.patient_no = p.patient_no
    LEFT OUTER JOIN (
        SELECT
            appt_no,
            SUM(nvl(apptserv_fee, 0))      AS apptserv_fee,
            SUM(nvl(apptserv_itemcost, 0)) AS apptserv_itemcost
        FROM
            mns.appt_serv
        GROUP BY
            appt_no
    )           ap
    ON a.appt_no = ap.appt_no
WHERE
    apptserv_fee + apptserv_itemcost = (
        SELECT
            MAX(apptserv_fee + apptserv_itemcost)
        FROM
            (
                SELECT
                    appt_no,
                    SUM(nvl(apptserv_fee, 0))      AS apptserv_fee,
                    SUM(nvl(apptserv_itemcost, 0)) AS apptserv_itemcost
                FROM
                    mns.appt_serv
                GROUP BY
                    appt_no
            )
    )
ORDER BY
    a.appt_no;

/*2(e)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    service_code,
    service_desc,
    service_stdfee,
    CASE
        WHEN AVG(apptserv_fee) >= service_stdfee THEN
            lpad(to_char(AVG(apptserv_fee) - service_stdfee,
                         '$9990.99'),
                 22,
                 ' ')
        ELSE
            lpad(to_char(AVG(apptserv_fee) - service_stdfee,
                         'S$9990.99'),
                 22,
                 ' ')
    END AS "Service Fee Differential"
FROM
         mns.service
    NATURAL JOIN mns.appt_serv
GROUP BY
    service_code,
    service_desc,
    service_stdfee
ORDER BY
    service_code;

/*2(f)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    p.patient_no,
    substr(ltrim(patient_fname
                 || ' '
                 || patient_lname),
           0,
           22)     AS patientname,
    trunc((months_between(sysdate, patient_dob) / 12),
          0)       AS currentage,
    COUNT(appt_no) AS numappts,
    lpad(to_char(COUNT(
        CASE
            WHEN appt_prior_apptno IS NOT NULL THEN
                1
        END
    ) / COUNT(appt_no) * 100,
                 '9990.0'),
         10,
         ' ')
    || '%'         AS followups
FROM
    mns.patient     p
    LEFT JOIN mns.appointment a
    ON p.patient_no = a.patient_no
GROUP BY
    p.patient_no,
    p.patient_fname,
    p.patient_lname,
    p.patient_dob
ORDER BY
    p.patient_no;

/*2(g)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    p.provider_code AS pcode,
    lpad(
        CASE
            WHEN COUNT(a.appt_no) = 0 THEN
                '-'
            ELSE
                to_char(COUNT(a.appt_no),
                        '990')
        END,
        12,
        ' ')       AS numberappts,
    lpad(nvl(to_char(SUM(apptserv_fee),
                     '$999G999D00'),
             '-'),
         15,
         ' ')       AS totalfees,
    lpad(nvl(to_char(SUM(as_item_quantity),
                     '990'),
             '-'),
         10,
         ' ')       AS noitems
FROM
    mns.provider    p
    LEFT OUTER JOIN (
        mns.appointment a
        LEFT OUTER JOIN (
            SELECT
                appt_no,
                SUM(nvl(apptserv_fee, 0)) AS apptserv_fee
            FROM
                mns.appt_serv
            GROUP BY
                appt_no
            ORDER BY
                appt_no
        )               s
        ON a.appt_no = s.appt_no
        LEFT OUTER JOIN (
            SELECT
                appt_no,
                SUM(nvl(as_item_quantity, 0)) AS as_item_quantity
            FROM
                mns.apptservice_item
            GROUP BY
                appt_no
            ORDER BY
                appt_no
        )               i
        ON a.appt_no = i.appt_no
    )
    ON p.provider_code = a.provider_code
       AND a.appt_datetime BETWEEN TO_DATE('10/Sep/2023 09:00 AM', 'dd/mon/yyyy hh:mi AM'
       ) AND TO_DATE('14/Sep/2023 05:00 PM', 'dd/mon/yyyy hh:mi AM')
GROUP BY
    p.provider_code
ORDER BY
    p.provider_code;