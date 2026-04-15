--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-mns-json.sql

--Student ID: 34202978
--Student Name: Ye Chen
--Unit Code: FIT9132
--Applied Class No:  A06

/* Comments for your marker:




*/

/*3(a)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT TO GENERATE 
-- THE COLLECTION OF JSON DOCUMENTS HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SET PAGESIZE 200

SELECT
        JSON_OBJECT(
            '_id' VALUE appt_no,
                    'datetime' VALUE to_char(appt_datetime, 'dd/mon/yyyy hh24:mi'),
                    'provider_code' VALUE provider_code,
                    'provider_name' VALUE
                CASE
                    WHEN provider_title IS NOT NULL THEN
                        provider_title || '. '
                    ELSE
                        ''
                END
                || ltrim(provider_fname
                         || ' '
                         || provider_lname),
                    'item_totalcost' VALUE trunc(to_char(apptserv_itemcost, '990'),
                                                 0),
                    'no_of_items' VALUE COUNT(item_id),
                    'items' VALUE JSON_ARRAYAGG(
                JSON_OBJECT(
                    'id' VALUE item_id,
                    'desc' VALUE item_desc,
                    'standardcost' VALUE item_stdcost,
                    'quantity' VALUE as_item_quantity
                )
            )
        FORMAT JSON)
        || ','
FROM
         mns.appointment
    NATURAL JOIN mns.provider
    NATURAL JOIN (
        SELECT
            appt_no,
            SUM(apptserv_itemcost) AS apptserv_itemcost
        FROM
            mns.appt_serv
        GROUP BY
            appt_no
    )
    NATURAL JOIN mns.apptservice_item
    NATURAL JOIN mns.item
GROUP BY
    appt_no,
    appt_datetime,
    provider_code,
    provider_title,
    provider_fname,
    provider_lname,
    apptserv_itemcost
ORDER BY
    appt_no;