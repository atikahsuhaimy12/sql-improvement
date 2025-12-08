

CREATE INDEX idx_jobs_publish_deleted ON jobs (publish_status, deleted);
CREATE INDEX idx_jobs_cat_type ON jobs (job_category_id, job_type_id);

CREATE INDEX idx_job_categories_deleted ON job_categories (deleted);
CREATE INDEX idx_job_types_deleted ON job_types (deleted);

CREATE INDEX idx_personalities_name_deleted ON personalities (name, deleted);
CREATE INDEX idx_practical_skills_name_deleted ON practical_skills (name, deleted);
CREATE INDEX idx_basic_abilities_name_deleted ON basic_abilities (name, deleted);

CREATE INDEX idx_affiliates_name_type_deleted ON affiliates (name, type, deleted);

CREATE INDEX idx_jobs_personalities_job ON jobs_personalities (job_id, personality_id);
CREATE INDEX idx_jobs_practical_job ON jobs_practical_skills (job_id, practical_skill_id);
CREATE INDEX idx_jobs_basic_job ON jobs_basic_abilities (job_id, basic_ability_id);
CREATE INDEX idx_jobs_tools_job ON jobs_tools (job_id, affiliate_id);

-- Fulltext index for faster keyword matching
ALTER TABLE jobs
ADD FULLTEXT ft_jobs (
    name, description, detail, business_skill, knowledge, remarks,
    location, activity, salary_statistic_group, salary_range_remarks,
    restriction
);
