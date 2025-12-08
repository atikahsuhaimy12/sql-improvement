
SELECT 
    Jobs.id,
    Jobs.name,
    Jobs.media_id,
    Jobs.job_category_id,
    Jobs.job_type_id,
    Jobs.sort_order
FROM jobs Jobs
INNER JOIN job_categories JobCategories 
    ON JobCategories.id = Jobs.job_category_id
    AND JobCategories.deleted IS NULL
INNER JOIN job_types JobTypes
    ON JobTypes.id = Jobs.job_type_id
    AND JobTypes.deleted IS NULL
WHERE Jobs.publish_status = 1
  AND Jobs.deleted IS NULL
  AND (
        MATCH (
          Jobs.name, Jobs.description, Jobs.detail, Jobs.business_skill,
          Jobs.knowledge, Jobs.location, Jobs.activity,
          Jobs.salary_statistic_group, Jobs.salary_range_remarks,
          Jobs.restriction, Jobs.remarks
        ) AGAINST ('キャビンアテンダント')

        OR EXISTS (
            SELECT 1 
            FROM personalities P
            JOIN jobs_personalities JP ON P.id = JP.personality_id
            WHERE JP.job_id = Jobs.id
              AND P.deleted IS NULL
              AND P.name LIKE '%キャビンアテンダント%'
        )

        OR EXISTS (
            SELECT 1 
            FROM practical_skills PS
            JOIN jobs_practical_skills JPS ON PS.id = JPS.practical_skill_id
            WHERE JPS.job_id = Jobs.id
              AND PS.deleted IS NULL
              AND PS.name LIKE '%キャビンアテンダント%'
        )

        OR EXISTS (
            SELECT 1 
            FROM basic_abilities BA
            JOIN jobs_basic_abilities JBA ON BA.id = JBA.basic_ability_id
            WHERE JBA.job_id = Jobs.id
              AND BA.deleted IS NULL
              AND BA.name LIKE '%キャビンアテンダント%'
        )

        OR EXISTS (
            SELECT 1 
            FROM affiliates A
            JOIN jobs_tools JT ON A.id = JT.affiliate_id
            WHERE JT.job_id = Jobs.id
              AND A.type = 1
              AND A.deleted IS NULL
              AND A.name LIKE '%キャビンアテンダント%'
        )
    )
ORDER BY Jobs.sort_order DESC, Jobs.id DESC
LIMIT 50 OFFSET 0;
