--1---Create a database with the name of your choice
create database PoliIasi;

--2--Create a table called Director with following columns: FirstName, LastName, Nationality and Birth date. Insert 5 rows into it.
create Table Director (
DirectorID int not null,
FirstName varchar(255) not null,
LastName varchar(255) not null,
Nationality varchar(255) not null,
Birthdate date null,
Primary key(DirectorID));
---3--Delete the director with id = 3
DELETE FROM Director WHERE DirectorID = 3
--4--Create a table called Movie with following columns: DirectorId, Title, ReleaseDate, Rating and Duration. Each movie has a director. Insert some rows into it
create Table Movie (
DirectorID int not null,
Title varchar(255) not null,
Releasedate date not null,
Rating int not null,
Duration datetime not null,
Foreign key(DirectorID) references Director(DirectorID));
--5--Update all movies that have a rating lower than 10.
update Movie
set Rating = 7
where Rating < 10
---6---Create a table called Actor with following columns: FirstName, LastName, Nationality, Birth date and PopularityRating. Insert some rows into it.
create Table Actor (
FirstName varchar(255) not null,
LastName varchar(255) not null,
Nationality varchar(255) not null,
Birthdate date not null,
PopularityRating int not null);

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
  create table MovieHistory(
  ID INT NOT NULL,
  Message varchar(255) not null,
  DirectorID int not null,
Title varchar(255) not null,
Releasedate date not null,
Rating int not null,
Duration datetime not null,
);
create trigger after_Movie_insert
on Movie
after insert
as
begin
set nocount on;
INSERT INTO MovieHistory(--nu recunoaste tabelul cu history---in progress
        ID ,
  Message ,
  DirectorID,
Title,
Releasedate ,
Rating ,
Duration 
)
    SELECT
        i.DirectorID ,
Title ,
Releasedate ,
Rating ,
Duration ,
'ins'
    FROM
        inserted i
end

--14--Create a cursor that will print on the screen all movies with a title shorter than 10 characters

  







