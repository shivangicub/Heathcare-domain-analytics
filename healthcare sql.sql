
use  patients;
-- KPI 1

select sum(`Number of patients included in the transfusion summary` ) ,sum(`Number of patients in hypercalcemia summary`),
sum(`Number of patients in Serum phosphorus summary`), sum(`Number of patients included in hospitalization summary`) from `final dialysis`;


-- KPI 2
 
 SELECT 
    COUNT(CASE WHEN `Patient Infection category text` = 'As Expected' THEN 1 END) AS infection,
    COUNT(CASE WHEN `Patient transfusion category text` = 'As Expected' THEN 1 END) AS transfusion,
    COUNT(CASE WHEN `Patient Hospitalization category text` = 'As Expected' THEN 1 END) AS Hospitalization,
    COUNT(CASE WHEN `Patient survival category text` = 'As Expected' THEN 1 END) AS Survival,
    COUNT(CASE WHEN `SWR category text` = 'As Expected' THEN 1 END) AS SWR,
    COUNT(CASE WHEN `PPPW category text` = 'As Expected' THEN 1 END) AS PPPW
FROM `final dialysis`;

 -- KPI 3
 
 select `profit or Non-profit`,
 sum(case when `profit or Non-profit`= 'profit' THEN 1
 ELSE 0
 END) AS profit,
  SUM(CASE 
    WHEN `Profit or Non-Profit` = 'non-profit' THEN 1
    ELSE 0
  END) as nonprofit
  FROM `Final dialysis`
  group by `Profit or Non-profit`;
  
  
  -- KPI 4
  SELECT ROUND(AVG(`PY2020 Payment Reduction Percentage`) * 100, 3) AS Average_Payment_Reduction_Rate
FROM `Final dialysis`;
  


SELECT COUNT(`# of Dialysis Stations`) , State 
FROM (`final dialysis`)
GROUP BY State LIMIT 5 ;

SELECT ROUND(AVG(`Dialysis - II (2).PY2020 Payment Reduction Percentage`*100),3) AS Average_Payment_Reduction_Rate
FROM `Final dialysis`;
  
-- KPI 5

SELECT `Chain Organization` , SUM(`Dialysis - II (2).Total Performance Score`)
FROM `Final dialysis`
GROUP BY `Chain Organization`
ORDER BY SUM(`Dialysis - II (2).Total Performance Score`) DESC
LIMIT 10;
