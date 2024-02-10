SELECT AVG("per_pupil_expenditure") AS "Average District Per-Pupil Expenditure"
FROM "expenditures" 
WHERE "district_id" IN (
    SELECT "id" 
    FROM "districts"
    WHERE "state" =  'MA'
);