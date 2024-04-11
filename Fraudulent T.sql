create table fraudulent(
step int,
type varchar(20),
amount float,
nameorig varchar(50),	
oldbalanceorig float,	
newbalanceorig float,
namedest varchar(50),
oldbalancedest float,
newbalancedest float,
isFraud int,
isFlaggedFraud int
);

copy public.fraudulent
from 'C:\Users\PC\Downloads\Fraudulent Transactions.csv'
delimiter ',' csv header

select *
from fraudulent
where isfraud = '1'
;


--1. How many transactions occurred per transaction type?
select type, count(nameorig) as "Total Transaction"
from fraudulent
group by 1
order by 2 desc
;

2. /* Which Transaction Type has the highest number of 
Fraudulent Transactions? */
select type, count(isfraud) as "Total Transaction"
from fraudulent
where isfraud = '1'
group by 1
order by 2 desc
limit 1
;

-- 3. What is the average fraudulent transaction amount?
select avg(amount) as "Average Amount"
from fraudulent
;

-- 4. What is the Maximum fraudulent transaction amount?
select max(amount) as "Maximum Amount"
from fraudulent
;

-- 5. What is the Minimum fraudulent transaction amount?
select min(amount) as "Minimum Amount"
from fraudulent
;

-- 6. Who are the Top 10 customers with the highest amount defrauded?
select nameorig,sum (amount) as "Total Amount"
from fraudulent
where isfraud = '1'
group by 1
order by 2 desc
limit 10
;

-- 7. How effective is the bank in flagging fraud?
select *
from fraudulent
where isflaggedfraud = '1'
;

-- 8. Who are the Top 20 Fraudster
select namedest, sum(amount) as "Total Amount"
from fraudulent
where isfraud ='1'
group by 1
order by 2 desc
limit 20
;
