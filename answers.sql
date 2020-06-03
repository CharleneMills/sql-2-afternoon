-- Part 1, Practice Joins

select * from invoice
join invoice_line on invoice_line.invoice_id = invoice.invoice_id
where invoice_line.unit_price > 0.99;

select i.invoice_date, c.first_name, c.last_name, i.total from invoice i
join customer c on i.customer_id = c.customer_id;


select c.first_name, c.last_name, e.first_name, e.last_name from customer c 
join employee e on c.support_rep_id = e.employee_id;


select al.title, ar.name from album al
join artist ar on al.artist_id = ar.artist_id;


select pt.track_id from playlist_track pt 
join playlist p on p.playlist_id = pt.playlist_id
where p.name = 'Music';


select t.name from track t
join playlist_track pt on pt.track_id = t.track_id 
where pt.playlist_id = 5;


select t.name, p.name from track t
join playlist_track pt on t.track_id = pt.track_id
join playlist p on pt.playlist_id = p.playlist_id;


select t.name, a.title from track t
join album a on t.album_id = a.album_id 
join genre g on g.genre_id = t.genre_id
where g.name = "Alternative & Punk";



-- Part 2, Practice Nested Queries

select * from invoice
where invoice_id in ( select invoice_id from invoice_line where unit_price > 0.99 );

select * from playlist_track
where playlist_id in ( select playlist_id from playlist where name = 'Music' );

select name from track
where track_id in ( select track_id from playlist_track where playlist_id = 5 );

select * from track
where genre_id in ( select genre_id from genre where name = 'Comedy' );

select * from track
where album_id in ( select album_id from album where title = 'Fireball' );

select * from track
where album_id in ( 
  select album_id from album where artist_id in ( 
    select artist_id from artist where name = 'Queen'
  )
); 


-- Part 3, Practice Updating Rows

