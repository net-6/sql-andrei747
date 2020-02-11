--7-Which is the movie with the lowest rating?
select Title, Rating
from Movie 
where Rating = (select min(Rating) from Movie)
--8--Which director has the most movies directed?
Select A.LastName, count(B.DirectorID)
from Movie B
    Inner Join 
    Director A 
        on B.DirectorID = A.DirectorID
group by A.LastName
having count(B.DirectorID) > 2 
order by count(B.DirectorID)  desc;
--9--Display all movies ordered by director's LastName in ascending order, then by birth date descending.
Select A.LastName, B.Title
from Movie B
Inner Join 
Director A 
        on B.DirectorID = A.DirectorID
order by A.LastName asc;
--BY THE BIRTHDATE
Select A.Birthdate, B.Title
from Movie B
Inner Join 
Director A 
        on B.DirectorID = A.DirectorID
order by A.Birthdate DESC;
---10--Create a function that will calculate and return the average rating of movies for a given director id
select avg(Rating) as [avg rating of movies], DirectorID
from Movie 
 where DirectorID = 4
 group by DirectorID

 ---11--Create a view that will display all the movie titles with the directors' first names and last names. 
 create view [movies] as
 select A.Title, B.FirstName, B.LastName
 from Movie A
 INNER JOIN Director B
  on 
  A.DirectorID = B.DirectorID
  --12---Create a stored procedure that will increment the rating by 1 for a given movie id.

  CREATE PROCEDURE IncrementRating 
  as
  select Title, Rating + 1, DirectorID from Movie 
  WHERE DirectorID = 4
  --13--Create a table called MovieHistory with a column for Id and a column for Message. 
    --Create a trigger that will add a new entry in the MovieHistory table when a row from Movie's table is updated.
  create table MovieHistory ---in progresss


  







