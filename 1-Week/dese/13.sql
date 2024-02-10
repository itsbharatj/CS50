SELECT "districts"."name", "per_pupil_expenditure","graduated"
FROM "districts"

JOIN "schools" ON "schools"."district_id" = "districts"."id"
JOIN "graduation_rates" ON "graduation_rates"."school_id" = "schools"."id"
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
JOIN "staff_evaluations" ON "staff_evaluations"."district_id" = "districts"."id"

WHERE "per_pupil_expenditure" > 
(
    SELECT AVG("per_pupil_expenditure")
    FROM "expenditures"
)
    AND "exemplary" > 
    (
        SELECT AVG("exemplary")
        FROM "staff_evaluations"
    )
ORDER BY "exemplary" DESC, "per_pupil_expenditure" DESC