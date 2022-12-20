-- 1) Revenue (Months / Monthname / Year)
 SELECT MONTH(fecha) month, MONTHNAME(fecha) AS monthname, 
 YEAR(fecha) as year, ROUND(SUM(revenue),0) AS revenue
FROM imports_camp_pub
GROUP BY month
ORDER BY month;

-- 2) Top Advertiser (Revenue)
SELECT icp.fecha, a.company, ROUND(SUM(icp.revenue),2) revenue
FROM advertisers a
JOIN imports_camp_pub icp
ON icp.pub_id = a.id
GROUP BY company
ORDER BY revenue DESC;

-- 3) Impressions and Paid Clicks
SELECT fecha, SUM(impressions) as "Impressions", 
SUM(page_view_ads) as "Page View Ads", SUM(paid_clicks) as "Paid Clicks"
FROM imports_camp_pub
GROUP BY fecha;

-- 4) Impressions of Each Day
SELECT icp.fecha, ROUND(SUM(impressions),0) "Impressions"
FROM advertisers a
JOIN imports_camp_pub icp
ON icp.pub_id = a.id
GROUP BY icp.fecha;

-- 5) Paid Clicks Of Each Day
SELECT icp.fecha, ROUND(SUM(paid_clicks),0) "Paid Clicks"
FROM advertisers a
JOIN imports_camp_pub icp
ON icp.pub_id = a.id
GROUP BY icp.fecha;

-- 6) Revenue Of Each Day
SELECT icp.fecha, ROUND(SUM(icp.revenue),2) "Revenue"
FROM advertisers a
JOIN imports_camp_pub icp
ON icp.`pub_id` = a.id
GROUP BY icp.fecha;

-- 7) Page View Ads
SELECT fecha, SUM(page_view_ads) as "Page View Ads"
FROM imports_camp_pub
GROUP BY fecha;

-- 8) Margin
SELECT fecha, 
IF(comision>0, 
    ROUND(revenue / comision, 2), 
    ROUND(revenue, 2)) AS "Margin"
    FROM imports_camp_pub;

    -- 9) Advertiser Count
SELECT COUNT(company) as "Advertiser Count"
FROM advertisers;

-- 10) Publisher Count
SELECT COUNT(company) as "Publisher Count"
FROM publishers;

