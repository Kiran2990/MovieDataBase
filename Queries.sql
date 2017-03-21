select * from production_company;

select * from actor;

select * from cast_in;

select * from director;

select * from producer;

select * from genre;

select * from movies;

select * from award;

select * from Movie_nomination;

select * from Actor_nomination;

select * from Director_nomination;

select * from Movie_Classification;

SELECT title,d.f_name,p.f_name,pp.name,m.rating,m.budget from movies m,director d,producer p,production_company pp
 where m.director_id = d.director_id
 and p.producer_id = m.producer_id and 
 pp.production_company_id = m.production_company_id
 and rating > 8;
 
select title,type from movies m,movie_classification c,genre g
where m.movie_id = c.cl_movie_id 
and g.genre_id = c.cl_genre_id
and type = 'Comedy';

select Title from movies m,actor a,cast_in c
where m.movie_id = c.cast_movie_id
and a.actor_id = c.cast_actor_id
and f_name in (
select f_name from movies m,actor a,cast_in c
where m.movie_id = c.cast_movie_id
and a.actor_id = c.cast_actor_id
group by f_name having count(*)>1);

select title,Category,Award_type from movies m,movie_nomination c,award a 
where m.movie_id = c.M_movie_id and a.award_id = c.M_Award_id 
and title = 'Titanic'