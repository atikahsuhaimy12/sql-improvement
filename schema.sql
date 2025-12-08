
DROP TABLE IF EXISTS jobs;
DROP TABLE IF EXISTS job_categories;
DROP TABLE IF EXISTS job_types;
DROP TABLE IF EXISTS personalities;
DROP TABLE IF EXISTS practical_skills;
DROP TABLE IF EXISTS basic_abilities;
DROP TABLE IF EXISTS affiliates;
DROP TABLE IF EXISTS jobs_personalities;
DROP TABLE IF EXISTS jobs_practical_skills;
DROP TABLE IF EXISTS jobs_basic_abilities;
DROP TABLE IF EXISTS jobs_tools;

CREATE TABLE job_categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    sort_order INT,
    created DATETIME,
    modified DATETIME,
    deleted DATETIME
);

CREATE TABLE job_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    job_category_id INT,
    sort_order INT,
    created DATETIME,
    modified DATETIME,
    deleted DATETIME
);

CREATE TABLE jobs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    detail TEXT,
    business_skill TEXT,
    knowledge TEXT,
    location TEXT,
    activity TEXT,
    salary_statistic_group VARCHAR(255),
    salary_range_remarks VARCHAR(255),
    restriction VARCHAR(255),
    remarks VARCHAR(255),
    media_id INT,
    job_category_id INT,
    job_type_id INT,
    sort_order INT,
    publish_status TINYINT,
    deleted DATETIME
);

CREATE TABLE personalities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    deleted DATETIME
);

CREATE TABLE practical_skills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    deleted DATETIME
);

CREATE TABLE basic_abilities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    deleted DATETIME
);

CREATE TABLE affiliates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    type TINYINT,
    deleted DATETIME
);

CREATE TABLE jobs_personalities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    job_id INT,
    personality_id INT
);

CREATE TABLE jobs_practical_skills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    job_id INT,
    practical_skill_id INT
);

CREATE TABLE jobs_basic_abilities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    job_id INT,
    basic_ability_id INT
);

CREATE TABLE jobs_tools (
    id INT AUTO_INCREMENT PRIMARY KEY,
    job_id INT,
    affiliate_id INT
);

-- Insert a bit of sample data for testing
INSERT INTO job_categories (name) VALUES ('航空');
INSERT INTO job_types (name, job_category_id) VALUES ('キャビンアテンダント', 1);

INSERT INTO jobs (name, description, detail, business_skill, knowledge, location, activity,
 publish_status, job_category_id, job_type_id, sort_order)
VALUES (
 'サンプル仕事', 
 'キャビンアテンダントの説明あり', 
 '詳細テキスト', 
 'コミュニケーション', 
 '航空知識', 
 '東京', 
 '接客活動', 
 1, 1, 1, 10
);

INSERT INTO personalities (name) VALUES ('キャビンアテンダント性格');
INSERT INTO jobs_personalities (job_id, personality_id) VALUES (1, 1);
