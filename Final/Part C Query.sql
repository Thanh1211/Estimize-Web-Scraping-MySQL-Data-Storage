-- question a 
SELECT  c.Ticker, a.Analyst_Id, a.Estimate, ap.Confidence_score, ap.points
FROM project3.companies as c
inner join all_analysts2 as a
on c.Ticker = a.Ticker
inner join analysts_profile as ap
on a.Analyst_name = ap.Analyst_name
where c.Ticker = 'AMZN'
group by Analyst_Id
;

-- question b
SET @indus = 'Textiles, Apparel & Luxury Goods';
SET @indus ='Internet & Catalog Retail';
SET @indus ='Computers & Peripherals';
SET @indus ='Software';
SET @indus ='Internet Software & Services';
SET @indus ='Automobiles';
SET @indus ='Pharmaceuticals';
SET @indus ='Household & Personal Products';
SET @indus='Semiconductors';
SET @indus ='Communications Equipment';
SET @indus ='Specialty Retail';
SET @indus ='Food & Staples Retailing';
SET @indus ='Textiles, Apparel & Luxury Goods';
SET @indus ='Multiline Retail';
SET @indus ='Diversified Financial Services';
SET @indus ='Oil, Gas & Consumable Fuels';
SET @indus ='Biotechnology';

select c.industry as 'Industry', count(distinct (c.ticker)) as '# of Companies', round(avg(c.analyst),0) as 'Avg # of analysts',round (avg(eps.actual - eps.estimize),2) as 'Avg bias EPS'
from companies as c
join all_eps as eps 
on c.ticker = eps.ticker
where c.industry = @indus 
group by c.industry;

-- question c

SELECT  c.Ticker, count(distinct(a.Analyst_Id)), ap.Confidence_score
FROM project3.companies as c
inner join all_analysts2 as a
on c.Ticker = a.Ticker
inner join analysts_profile as ap
on a.Analyst_name = ap.Analyst_name
where ap.Confidence_score > 7;

-- question d
SELECT Ticker, Name, Sectors, Industry, Max(Follower) as `Largest Followers` 
from companies;


