-- CAMPAIGNS (successful): company_name, description, outcome, goal, pledged, backers_count, launch_date, end_date
SELECT company_name, description, outcome, goal, pledged, backers_count, launch_date, end_date
FROM campaign
WHERE outcome = 'successful'
ORDER BY company_name;

-- CAMPAIGNS (number of successful campaigns by country): country, successful_campaigns
SELECT country, COUNT(*) AS successful_campaigns
FROM campaign
WHERE outcome = 'successful'
GROUP BY country
ORDER BY successful_campaigns DESC;

-- CAMPAIGNS (failed): company_name, description, outcome, goal, pledged, backers_count, launch_date, end_date
SELECT company_name, description, outcome, goal, pledged, backers_count, launch_date, end_date
FROM campaign
WHERE outcome = 'failed'
ORDER BY company_name;

-- CAMPAIGNS (number of failed campaigns by country): country, failed_campaigns
SELECT country, COUNT(*) AS failed_campaigns
FROM campaign
WHERE outcome = 'failed'
GROUP BY country
ORDER BY failed_campaigns DESC;

-- CAMPAIGNS (highest pledged): company_name, description, goal, pledged, outcome
SELECT company_name, description, goal, pledged, outcome
FROM campaign
ORDER BY pledged DESC;

-- CATEGORIES (highest pledged): category, goal, pledged, outcome
SELECT cat.category, camp.goal, camp.pledged, camp.outcome, camp.company_name
FROM campaign AS camp
JOIN category AS cat ON camp.category_id = cat.category_id
ORDER BY pledged DESC;

-- SUBCATEGORIES (highest pledged): subcategory, goal, pledged, outcome
SELECT sub.subcategory, camp.goal, camp.pledged, camp.outcome, camp.company_name
FROM campaign AS camp
JOIN subcategory AS sub ON camp.subcategory_id = sub.subcategory_id
ORDER BY pledged DESC;