/*Assume there are three Spotify tables containing information about the artists, songs, and music charts. Write a query to determine the top 5 
artists whose songs appear in the Top 10 of the global_song_rank table the highest number of times. From now on, we'll refer to this ranking 
number as "song appearances".
Output the top 5 artist names in ascending order along with their song appearances ranking (not the number of song appearances, but the rank of 
who has the most appearances). The order of the rank should take precedence.
For example, Ed Sheeran's songs appeared 5 times in Top 10 list of the global song rank table; this is the highest number of appearances, so he 
is ranked 1st. Bad Bunny's songs appeared in the list 4, so he comes in at a close 2nd.
Assumptions:
•If two artists' songs have the same number of appearances, the artists should have the same rank.
•The rank number should be continuous (1, 2, 2, 3, 4, 5) and not skipped (1, 2, 2, 4, 5).*/


with top_artists as(
SELECT artist_id,DENSE_RANK() OVER (ORDER BY song_count DESC) AS artist_rank
from(
SELECT a.artist_id , count(s.song_id) as song_count
FROM artists a
left join songs s
on a.artist_id = s.artist_id
left join global_song_rank as glo
on glo.song_id = s.song_id
where glo.rank<=10
group by a.artist_id) as top_songs)

select a.artist_name , t.artist_rank
from top_artists t
inner join artists as a
on a.artist_id= t.artist_id
where t.artist_rank<=5
order by t.artist_rank , a.artist_name;