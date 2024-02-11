create database Clinictrial;
use Clinictrial;
select * from clinictrial;

# 1. Add index name fast on Name
create index name on clinictrial(name(20));

# 2. Describe the schema of table
describe clinictrial;

# 3. Find average of Age
select round(avg(age)) AS Avg_Age from clinictrial;

# 4. Find minimum of Age
select max(age) AS Max_Age from clinictrial;

# 6. Find average age of those were pregnant and not pregnant
select pregnant, round(avg(age)) AS Avg_age from clinictrial group by pregnant;

# 7. Find average blood pressure of those had drug reaction and did not had drug reaction
select round(Avg(BP)) AS Avg_BP, Drug_reaction from clinictrial group by drug_reaction;

# 8. Add new column name as ‘Age_group’ and those having age between 16 & 21 should be categorized as Low, more than 21 and less than 35 should be categorized as Middle and above 35 should be categorized as High.
alter table clinictrial add column Age_group varchar(20) as (Case when Age >= 16 and Age <=21 then 'Low' when Age >= 21 and Age <= 35 then 'Middle' else 'High' End);

# 9. Change ‘Age’ of Reetika to 32
update clinictrial set Age = '42' where Name = 'Reetika';

# 10. Change name of Reena as Shara’
update clinictrial set name = 'Shara' where name = 'Reena';

# 11. Remove Chlstrl column
alter table clinictrial drop column Chlstrl;

# 12. Select only Name, Age and BP
select Name, Age, BP from clinictrial;

# 13. Select ladies whose first name starts with ‘E’
select * from clinictrial where name like 'E%';

# 14. Select ladies whose Age_group were Low
select * from clinictrial where Age_group = 'Low';
select name, Age_group from clinictrial where Age_group = 'Low';

# 15. Select ladies whose Age_group were High
select * from clinictrial where Age_group = 'high';
select name, Age_group from clinictrial where Age_group = 'high';

# 16. Select ladies whose name starts with ‘A’ and those were pregnant
select * from clinictrial where name like 'A%' and pregnant = 'Yes';
select name, pregnant from clinictrial where name like 'A%' and pregnant = 'Yes';

# 17. Identify ladies whose BP was more than 120
select * from clinictrial where BP >= '120';
select Name, BP from clinictrial where BP >= '120';

# 18. Identify ladies whose BP was between 100 and 120
select * from clinictrial where BP between 100 and 120;
select name, BP from clinictrial where BP between 100 and 120;

# 19. Identify ladies who had low anxiety aged less than 30
select * from clinictrial where Age <= '30';
select name, Anxty_LH, age from clinictrial where Age <= '30';

# 20. Select ladies whose name ends with ‘i’
select * from clinictrial where Name like '%i';

# 21. Select ladies whose name ends with ‘a’
select * from clinictrial where Name like '%a';

# 22. Select ladies whose name starts with ‘K’
select * from clinictrial where Name like 'K%';

# 23. Select ladies whose name have ‘a’ anywhere
select * from clinictrial where Name like '%a%';

# 24. Order ladies in ascending way based on ‘BP’
select * from clinictrial order by BP asc;

# 25. Order ladies in descending way based on ‘Age’
select * from clinictrial order by Age desc;