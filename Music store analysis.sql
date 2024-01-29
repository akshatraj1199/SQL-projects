select * from employee


-- Q1: Who is the senior most employee based on job title ?

select * from employee
order by levels desc
limit 1

-- Q2: Which countries have the most invoices ?

select count(*) as v, billing_country from invoice
group by billing_country
order by v desc

-- Q3: what are top 3 values of total invoice ?

select * from invoice
	
select total from invoice
order by total desc
limit 3


-- Q4 Which city has the best customers (Highest Billing City) ?

select * from invoice

select sum(total) as total_invoice , billing_city from invoice
group by billing_city
order by total_invoice desc
	
-- Q5 who is the best customer ( the person who spend most money) ?

select * from customer

select customer.customer_id , customer.first_name , customer.last_name , sum(invoice.total) as total from customer
join invoice on
customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total desc 
limit 1


/* Q6: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
 Return your list ordered alphabetically by email starting with A.*/

select distinct email , first_name , last_name, genre.name as name from customer
join invoice on invoice.customer_id = customer.customer_id
join invoice_line on invoice_line.invoice_id = invoice.invoice_id
join track on track.track_id = invoice_line.track_id
join genre on genre.genre_id = track.genre_id
where genre.name like 'Rock'
order by email	

/* Q7: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands. */

select distinct count(*) from artist
select * from track

SELECT artist.artist_id, artist.name,COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;


/* Q8: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */

select name, milliseconds from track
where milliseconds > (select avg(milliseconds) from track)
order by milliseconds desc




