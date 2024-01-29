/* creating the table and importing the data from csv files*/

create table ratings (
	Series_Title varchar (500),
	Released_Year int ,
	Certificate varchar (500),
	Runtime int ,
	Genre varchar (900),
	IMDB_Rating decimal(4,2) ,
	Overview varchar(5000),
	Meta_score int ,
	Director varchar(500),
	Star1 varchar (500),
	Star2 varchar (500),
	Star3 varchar (500),
	Star4 varchar (500),
	No_of_Votes int ,
	Gross int 
)

select * from ratings

-- What were the top 10 movies according to Meta score?

select series_title, meta_score from ratings
order by meta_score desc
limit 10

-- What were the bottom 10 movies according to Meta score? 
select series_title, meta_score from ratings
order by meta_score asc
limit 10

-- What were the average Meta scores for Genre of movies? 

select distinct genre,
round(avg(meta_score),2)
from ratings
group by genre

-- Count of movies and shows in each decade

select distinct released_year,
count(series_title)
from ratings
group by released_year
order by released_year

-- What were the average IMDB and TMDB scores for each age certification for shows and movies?

select distinct certificate,
round(avg(meta_score),2)
from ratings
group by certificate
order by certificate


-- Who were the top 10 actors that appeared the most in movies? 

select distinct star1,
count(series_title)
from ratings
group by star1
order by star1
limit 10

-- Who were the top 10 directors that directed the most movies? 

select distinct director,
count(series_title)
from ratings
group by director
order by director
limit 10

-- Calculating the average runtime of movies and TV shows separately

select series_title,
round(avg(runtime),2) as avg_time
from ratings
group by series_title
order by series_title

	
-- Finding the titles and  directors of movies released on or after 2000

select director,
series_title,
released_year
from ratings
where released_year > 2000
order by released_year

-- What are top 10 genres combinations had the most movies? 

select distinct genre,
count(series_title) as Number_of_series
from ratings
group by genre
order by Number_of_series desc
limit 10

-- What are top 10 genres combinations had the most number of votes? 

select distinct genre,
count(no_of_votes) as total_votes
from ratings
group by genre
order by total_votes desc
limit 10

-- Top 10 movies that has most votes

select series_title,
no_of_votes
from ratings
order by no_of_votes desc
limit 10

-- Top 10 movies and director that has highest gross

select series_title,
director,
gross
from ratings
order by gross desc
limit 10

-- Average gross according to age certificate

select distinct certificate,
round(avg(gross),2) as avg_gross
from ratings
group by certificate
order by avg_gross desc

-- count of movies that director cast lead actor 

select director, star1,
count(series_title) as counting
from ratings
group by director, star1
order by counting desc






