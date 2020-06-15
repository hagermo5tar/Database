create database media ;
create table userss (
u_ID int primary key , 
u_username varchar(255) ,
u_email varchar(255) ,
u_password char(60) ,
);
create table playlists (
p_ID int primary key , 
p_playlistID int ,
p_songID int ,
p_username varchar(255) ,
u_ID int foreign key references userss (u_ID)
);
create table songs (
s_ID int primary key , 
s_songID int ,
s_artistID int ,
s_album varchar (255) ,
s_title varchar (255) ,
s_genreID int ,
p_ID int foreign key references playlists (p_ID)
);
create table artists(
a_ID int primary key , 
a_artistID int ,
a_name varchar(255) ,
s_ID int foreign key references songs (s_ID) 
);
create table genres(
g_ID int primary key ,
g_genreID int , 
g_name varchar(255) ,
g_desc varchar(255) ,
s_ID int foreign key references songs (s_ID) 
);
insert into userss 
values ( 1 ,'useraa' , 'useraa@hotmail.com' , '1111' );
insert into playlists (p_ID , p_playlistID , p_songId , p_username)
values ( 2 , 1234 , 123 , 'useraa');
insert into songs (s_ID , s_songID , s_artistID , s_title ,  s_album , s_genreID)
values ( 3, 123 , 4444 ,'all of me' , 'fv' , 5555);
insert into artists (a_ID , a_artistID , a_name )
values ( 4 , 4444 , 'john legend');
insert into genres (g_ID , g_genreID , g_name )
values (5 , 5555 , 'romantic' ); 
insert into userss (u_ID , u_username , u_email , u_password)
values ( 6 , 'userbb' , 'userbb@hotmail.com' , '2222' );
insert into playlists (p_ID , p_playlistID , p_songId , p_username)
values (7 , 4567 , 456 , 'userbb');
insert into songs (s_ID , s_songID , s_artistID , s_title , s_genreID)
values (8 , 456 , 6666 , 'natural' , 7777);
insert into artists (a_ID , a_artistID , a_name )
values (9 , 6666 , 'imagine dragons');
insert into genres (g_ID , g_genreID , g_name )
values ( 10 ,7777 , 'rock' ); 
delete from userss where u_password = 2222 ;
delete from playlists where p_songID = 456 ;
delete from songs where s_title = 'natural' ;
delete from artists where a_name = 'imagine dragons' ;
delete from genres where g_name = 'rock' ;
update userss
set u_email = 'usercc@hotmail.com'
where u_email = 'userbb@hotmail.com' ;
update playlists
set p_playlistID = 1212 
where p_username = 'userbb' ;
update songs
set s_title = 'demons'
where s_artistID = 6666 ;
update artists
set a_name = 'lP'
where a_name = 'imagine dragons' ;
update genres
set g_name = 'karaoke'
where g_genreID = 7777 ;
select u_email , p_username 
from userss 
inner join playlists on userss.u_ID = playlists.p_ID ; 
select p_playlistID , s_songID 
from playlists 
left join songs on p_playlistID = s_songID ;
select s_title , a_name 
from songs
right join artists on songs.s_title = artists.a_name ;
select a_artistID , g_genreID
from artists
full outer join genres on artists.a_artistID =  genres.g_genreID ;
select a_name , g_name 
from artists , genres 
where artists.a_ID = genres.g_ID ;
select count(s_title) , s_artistID
from songs
group by s_artistID ; 
select count(p_username) , p_ID
from playlists
group by p_ID ; 
select g_name
from genres
where g_ID = (select g_ID from playlists where g_ID = 2) ; 
select p_ID , p_songID
from playlists
where p_ID > (select count(s_ID) from songs ) ; 
select p_username
from playlists
where p_songID = (select u_ID from userss where u_ID = 1 ) ; 
select a_name
from artists ;
select *
from genres ;
select *
from playlists;
select * 
from userss ;
select distinct p_username
from playlists ;
SELECT TOP 3 * 
FROM userss ;
SELECT TOP 3 PERCENT s_title 
FROM songs ; 
SELECT a_ID 
FROM artists 
ORDER BY a_artistID ;
SELECT p_playlistID
FROM playlists
ORDER BY p_songID desc ;
SELECT  g_name
FROM genres
ORDER BY g_ID ASC;
SELECT MIN(s_songID)
FROM songs ;
select MAX(s_songID)
from songs ; 
SELECT AVG(s_songID)
FROM songs ;
SELECT SUM(s_artistID)
FROM songs ;
SELECT a_name
FROM artists
WHERE a_name LIKE 'a%';
SELECT a_name
FROM artists
WHERE a_name IN ('john legend', 'LP');
SELECT u_username AS MainUsername
FROM userss ;
SELECT s_ID
FROM songs
WHERE s_songID BETWEEN 1111 AND 6666 ;
SELECT g_genreID , g_name
FROM genres
WHERE g_name IN ('romantic', 'rock' );
SELECT  s_songID , s_artistID
FROM songs
WHERE s_title IN ('all of me');
SELECT u_username
FROM userss
WHERE NOT u_username = 'userbb' ;
