create database movie;
use movie;

select*from movie;
-- Movie Dataset
-- i. Write a SQL query to find when the movie 'American Beauty' released. Return 
-- movie release year.
select *,mov_year from movie where mov_title='american beauty';
-- ii. Write a SQL query to find those movies, which were released before 1998. Return 
-- movie title.
 select mov_title,mov_year from movie where mov_year <=1998;
-- iii. Write a query where it should contain all the data of the movies which were 
-- released after 1995 and their movie duration was greater than 120.  
select mov_title,mov_year,mov_time from movie where mov_year<1995 and mov_time>120;
select*from movie;                                    
-- iv. Write a query to determine the Top 7 movies which were released in United 
-- Kingdom. Sort the data in ascending order of the movie year.
select * from(select*from movie  order by mov_year asc limit 7)  as  m where m.mov_rel_country='uk';
-- v. Set the language of movie language as 'Chinese' for the movie which has its 
-- existing language as Japanese and the movie year was 2001.
update movie set mov_lang='chinese' where mov_lang='japanese'and mov_year=2001;
select*from reviewer;
-- vi. Write a SQL query to find name of all the reviewers who rated the movie 
-- 'Slumdog Millionaire'.
select r.rev_name from reviewer r inner join ratings rt on r.rev_id=rt.rev_id inner join movie m on m.mov_id=rt.mov_id where 
m.mov_title='Slumdog Millionaire';
SELECT r.rev_name
FROM reviewer r WHERE r.rev_id IN (SELECT ra.rev_id FROM ratings ra JOIN movie m ON m.mov_id = ra.mov_id WHERE m.mov_title = 'Slumdog Millionaire');
-- vii. Write a query which fetch the first name, last name & role played by the 
-- actor where output should all exclude Male actors.
select * from (select act_fname,act_lname from  actor  join  cast as c using(act_id) )as a where a.act_gender!='m';
-- viii. Write a SQL query to find the actors who played a role in the movie 'Annie Hall'.
select*from cast;
select a.*,m.mov_title from actor as a join cast as c using (act_id)inner join movie m using (mov_id)where m.mov_title='annie hall';
-- Fetch all the fields of actor table. (Hint: Use the IN operator).
-- ix. Write a SQL query to find those movies that have been released in countries other 
-- than the United Kingdom. Return movie title, movie year, movie time, and date of 
-- release, releasing country.
select*from actor;
select * from movie where  mov_rel_country not in('UK');
-- x. Print genre title, maximum movie duration and the count the number of 
-- movies in each genre. (HINT: By using inner join)
select g.gen_title,max(t.mov_time) as max_mov_duration,count(*) as number_of_movie from genres as g join 
 (select * from movie_genres as a join movie as m using (mov_id)) as t 
 using (gen_id)group by gen_title;
-- xi. Create a view which should contain the first name, last name, title of the                    
-- movie & role played by particular actor
create view movie_by_actor as(select act_id,act_fname,act_lname,mov_title,role from actor as a join
(select mov_title,c.* from movie as m join cast as c using (mov_id)) as t 
using (act_id));
-- xii. Write a SQL query to find the movies with the lowest ratings
select m.*,rev_stars from movie as m join ratings as r using (mov_id) where rev_stars =(select min(rev_stars) from ratings);
-- xiii. Finally Mail the script to jeevan.raj@imarticus.com