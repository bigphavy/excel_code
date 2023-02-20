create table "sales_table"(
"SALES_ID" numeric,
"SALES_REP" text,
"EMAILS" varchar,
"BRANDS" text,
"PLANT_COST" numeric,
"UNIT_PRICE" numeric,
"QUANTITY" numeric,
"COST" numeric,
"PROFIT" numeric,
"COUNTRIES" text,
"REGION" text,
"MONTHS" text,
"YEARS" numeric	
);
 

select *
from "sales_table"


select *
from "sales_table"

select distinct ("SALES_REP"), "EMAILS"
from "sales_table";

select distinct ("EMAILS"), "SALES_REP"
from "sales_table"
limit 20;

-- select
-- from
-- where
-- group by
-- order by
-- limit

--QUESTION THREE (PROFIT ANALYSIS)
 select "COUNTRIES", sum("PROFIT") as "total_profit"
 from "sales_table"
 where "YEARS"= 2019
 group by "COUNTRIES"
 order by "total_profit" desc; 



select distinct ("SALES_REP"),"EMAILS"
from "sales_table"
where "BRANDS"='trophy';



select "COUNTRIES","YEARS", "BRANDS", sum("PROFIT")  as "total_profit"
from "sales_table"
group by "COUNTRIES", "YEARS", "BRANDS"
order by "total_profit" desc;


--QUESTION ONE (PROFIT ANALYSIS)
select sum("PROFIT") as  "anglo_franco"
from
(select *,
 case when "COUNTRIES" in ('Nigeria', 'ghana') then 'Amglophone'
 else 'francophone' end as "TERRITORY"
 from "sales_table") as "table_one";

-- QUESTION TWO
select "TERRITORY", sum("PROFIT") as "profit_sum"
from
(select *,
case when "COUNTRIES" in ('Nigeria', 'Ghana') then 'Anglophone' 
else 'Francophone'end as "TERRITORY"
from "sales_table") as "table_one"
group by "TERRITORY"
order by "profit_sum" desc;

-- QUESTION 3
select "COUNTRIES", sum("PROFIT") as "country_profit"
from "sales_table"
where "YEARS" in (2019)
group by "COUNTRIES"
order by "country_profit" desc;


--QUESTION 4
select "YEARS", sum("PROFIT") as  "year_profit"
from "sales_table"
group by "YEARS"
order by "year_profit" desc;

--QUESTION 5
select "MONTHS", "YEARS", sum("PROFIT") as "profit_sum"
from "sales_table"
group by "MONTHS", "YEARS"
order by "profit_sum" asc;

--QUESTION 6
select min("PROFIT")
FROM "sales_table"
where "MONTHS" = 'December' and "YEARS" = 2018;

--QUESTION 7
select "MONTHS", round((sum("PROFIT")/sum("COST"))*100,3) as "percentage_profit%"
from "sales_table"
where "YEARS" in (2019)
group by "MONTHS"
order by "percentage_profit%" desc;




--BRAND ANALYSIS QUESTION 4
select "BRANDS", sum("QUANTITY")as "qty"
from "sales_table"
where "BRANDS" like '%malt'
group by "BRANDS"
order by "qty" desc;











