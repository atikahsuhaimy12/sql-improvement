# SQL Performance Improvement – Tyrell Assessment

This folder contains my analysis and suggested improvements for the slow SQL query given in the assessment.  
The original query took around 8 seconds to return results, so the main goal was to identify the bottlenecks and improve the execution time without changing the expected output.

## 1. Summary of Issues Found

After reviewing the query, these are the main reasons why it performs poorly:

1. **Too many LIKE '%keyword%' searches**  
   Since the search keyword is wrapped with `%...%`, MySQL cannot use indexes.  
   This forces a full table scan across many joined tables.

2. **A large number of LEFT JOINs**  
   The query joins 10+ tables (some of them many to many tables).  
   All the joins are done first, and filtering happens only at the end.  
   This creates a very large temporary dataset.

3. **GROUP BY on Jobs.id**  
   Because of the many-to-many relations, the result contains duplicates.  
   MySQL later removes duplicates using GROUP BY + filesort, which is expensive.

4. **Missing indexes on key columns**  
   The columns used for filtering (like deleted, name, type, etc.) don’t seem to have proper indexes,
   which slows down lookups.

5. **Selecting too many columns**  
   The query is selecting a lot of fields from all tables.  
   Reducing the selected columns will help MySQL read fewer pages from disk.

## 2. Improvements Applied

### A. Added relevant indexes
I added indexes on frequently filtered/joined columns such as:
- `jobs (publish_status, deleted)`
- `jobs (job_category_id, job_type_id)`
- name columns in related lookup tables
- join tables (job_id, affiliate_id, etc.)

These indexes significantly reduce lookup time.

### B. Replaced multiple LIKE searches with FULLTEXT
Since the keyword search only checks text-based columns, converting them into a FULLTEXT index makes the search much faster.

Example:
```sql
ALTER TABLE jobs 
ADD FULLTEXT ft_jobs (
    name, description, detail, business_skill, knowledge, remarks,
    location, activity, salary_statistic_group, salary_range_remarks,
    restriction
);
```

Then instead of 15–20 `LIKE '%keyword%'`, I used:
```sql
MATCH (...) AGAINST ('キャビンアテンダント')
```

This alone cuts down execution time drastically.

### C. Replaced JOINs with EXISTS for searching related tables
Originally the query brought all related rows using LEFT JOIN, even when there's no match.  
Using EXISTS makes the search lighter because MySQL stops as soon as it finds one match.

### D. Removed unnecessary GROUP BY
Since we only need one row per job, using EXISTS avoids the duplication problem,
so no more GROUP BY.

## 3. Optimized Query

Below is the revised version of the query.  
This is written to improve speed while still matching the search logic.

```sql
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
        )
        AGAINST ('キャビンアテンダント')

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
```

## 4. Docker Setup

To make the testing environment consistent, I prepared a simple Docker setup:

```
docker-compose.yml
```

```yaml
version: '3.8'
services:
  mysql:
    image: mysql:5.7
    container_name: tyrell_mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: tyrell
    ports:
      - "3306:3306"
    volumes:
      - ./mysql-data:/var/lib/mysql
      - ./sql:/docker-entrypoint-initdb.d
```

Any `.sql` file inside the `sql/` folder will automatically run during container startup.

## 5. Time Spent
Approximately **1.5 hours**, including:
- reading/understanding the original query  
- identifying bottlenecks  
- drafting the improved logic  
- preparing SQL files and Docker setup  
- writing this documentation

