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
insert into Director
values(1, 'Andrei', 'Cristea', 'Roman', '1980-05-03'),
(2, 'Silviu', 'Pantiru', 'Roman', '1982-09-23'),
(3, 'Ion', 'Crinescu', 'Roman', '1960-08-03'),
(4, 'Musa', 'Dembele', 'Belgian', '1994-10-12'),
(5, 'Gheorghe', 'Popescu', 'Roman', '1990-11-18');



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

insert into Movie 
values (1, 'Batman', '2019-05-09',10,'02:33'),
(4, 'Flori de mar', '2019-09-29',6,'01:43'),
(4, 'Papuci de casa', '2019-11-02',8,'01:53'),
(1, 'Family Guy', '2019-10-11',10,'01:59'),
(2, 'Batman', '2019-05-09',10,'02:33'),
(5, 'Biscuiti', '2019-05-09',10,'02:33'),
(1, 'Sunny day', '2019-05-09',10,'02:33');
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



insert into Actor
values(1, 'Robert','De Niro', 'American','1943-07-17', 7),
(2, 'Christian','Bale', 'Englez','1974-01-30', 10),
(3, 'Leonardo','Di Caprio', 'American','1974-11-11', 10),
(4, 'Jennifer','Lawrence', 'American','1990-08-15', 10),
(5, 'Serban','Pavlu', 'Roman','1974-06-29', 8);
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
INSERT INTO MovieHistory
   
  DirectorID,
Title,
Releasedate ,
Rating ,
Duration,
ID
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

insert into Movie 
values (
1,
'Gol dupa gol',
'2019/07/02',
8,'01:45');


--14--Create a cursor that will print on the screen all movies with a title shorter than 10 characters

  







