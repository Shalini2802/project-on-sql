use cereals;
select*from cereals_data;
-- Exercise 
-- Database: cereals 
-- Queries 
-- 1. Add index name fast on name 
create index fast on cereals_data(name);
-- 2. Describe the schema of table 
desc cereals_data;
-- 3. Create view name as see where users can not see type column [first run appropriate query 
-- then create view]
create view see as(select name,mfr,calories,protein,sodium,fiber,carbo,sugars,potass,vitamins,shelf,weight,cups,rating from cereals_data);
-- 4. Rename the view as saw 
rename table saw to see;
-- 5. Count how many are cold cereals 
select cereals,count(cold_cereals)as no_of_cereals from cereals_data;
-- 6. Count how many cereals are kept in shelf 3
 select shelf,count(shelf)  from cereals_data where shelf=3 group by shelf;
-- 7. Arrange the table from high to low according to ratings 
select *from cereals_data order by rating desc;
-- 8. Suggest some column/s which can be Primary key 
alter table cereals_data add column cereal_id int primary key auto_increment first;
select*from cereals_data;
-- 9. Find average of calories of hot cereal and cold cereal in one query 
select type,avg(calories) av from cereals_data group by type;
-- 10. Add new column as HL_Calories where more than average calories should be categorized as 
-- HIGH and less than average calories should be categorized as LOW 
alter table cereals_data add column hl_calories varchar(10);
select round(avg(calories)) from cereals_data;
update cereals_data set hl_calories=case when charges>=43 then 'high'else'low' end;
-- 11. List only those cereals whose name begins with B 
select *from cereals_data where name like 'b%';
-- 12. List only those cereals whose name begins with F
select *from cereals_data where name like 'f%';
-- 13. List only those cereals whose name ends with s 
select *from cereals_data where name like 's%';
-- 14. Select only those records which are HIGH in column HL_calories and mail to 
-- jeevan.raj@imarticus.com [save/name your file as <your first name_cereals_high>] 
select * from cereals_data where hl_calories='high';
-- 15. Find maximum of ratings
select max(rating) from cereals_data;
-- 16. Find average ratings of those were High and Low calories 
select  max(calories),min(calories)from cereals_data ;
-- 17. Craete two examples of Sub Queries of your choice and give explanation in the script 
-- itself with remarks by using # 
 # to extract info of cereals_data whose rating is less than or equal to max of rating
select*from cereals_data where rating<=(select round(max(rating),5)from cereals_data);
# extract the data  from cereals data to find 60% from avgerge of calories
select * from cereals_data where calories<(select round(avg(calories)*.6)from  cereals_data);
-- 18. Remove column fat 
alter table cereals_data drop column fat;
select*from cereals_data;
-- 19. Count records for each manufacturer [mfr] 
select  mfr ,count(mfr)  from  cereals_data group by mfr;
-- 20. Select name, calories and ratings only 
select  name,calories,rating from cereals_data;