DROP TABLE IF EXISTS streamers;
DROP TABLE IF EXISTS games_metadata;

create table streamers(username VARCHAR(50),timestamp TIMESTAMP,game VARCHAR(50),viewers INT(12),followers INT(12));
create table games_metadata(game VARCHAR(50),release_date TIMESTAMP,publisher VARCHAR(50), genre VARCHAR(50));



--DELETE FROM streamers;
--DELETE FROM games_metadata;

INSERT INTO streamers VALUES ('mra',  '2009-01-01 00:00:01' , 'Hollow Knight', 3600, 2);

INSERT INTO streamers VALUES ('mrb',  '2018-01-01 00:00:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrb',  '2018-02-01 00:00:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrb',  '2018-02-01 12:01:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrb',  '2018-02-01 12:02:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrb',  '2018-02-01 12:03:01' , 'Hollow Knight', 3600, 2);--5
INSERT INTO streamers VALUES ('mrb',  '2018-02-01 12:04:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrb',  '2018-02-01 12:05:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrb',  '2018-02-01 12:06:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrb',  '2018-02-01 12:07:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrb',  '2018-02-01 12:08:01' , 'Hollow Knight', 3600, 2);--10
INSERT INTO streamers VALUES ('mrb',  '2018-02-01 12:09:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrb',  '2018-02-01 12:10:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrb',  '2018-02-01 12:11:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrb',  '2018-02-01 12:12:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrb',  '2018-02-01 12:13:01' , 'Hollow Knight', 3600, 2);--15
INSERT INTO streamers VALUES ('mrb',  '2018-02-01 12:14:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrb',  '2018-02-01 12:15:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrb',  '2018-02-01 12:16:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrb',  '2018-02-01 12:17:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrb',  '2018-02-01 12:18:01' , 'Hollow Knight', 3600, 2);--16

INSERT INTO streamers VALUES ('mrb',  '2018-02-01 12:19:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrb',  '2018-02-01 12:20:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrb',  '2019-01-31 12:00:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrb',  '2019-01-06 12:00:01' , 'Hollow Knight', 3600, 9);
INSERT INTO streamers VALUES ('mrb',  '2019-01-02 12:00:01' , 'Hollow Knight', 3600, 9);
INSERT INTO streamers VALUES ('mrb',  '2019-01-31 12:00:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrb',  '2019-01-06 12:00:01' , 'Hollow Knight', 3600, 9);
INSERT INTO streamers VALUES ('mrb',  '2019-01-02 12:00:01' , 'Hollow Knight', 3600, 9);



INSERT INTO streamers VALUES ('mrc',  '2018-02-01 00:00:01' , 'Pokemon Yellow', 3600, 2);
INSERT INTO streamers VALUES ('mrc',  '2018-02-01 00:1:01' , 'Pokemon Yellow', 3600, 2);
INSERT INTO streamers VALUES ('mrc',  '2018-02-01 00:3:01' , 'Pokemon Yellow', 3600, 2);
INSERT INTO streamers VALUES ('mrc',  '2018-02-01 00:4:01' , 'Pokemon Yellow', 3600, 2);
INSERT INTO streamers VALUES ('mrc',  '2019-01-01 00:4:01' , 'Pokemon Yellow', 3600, 2);
INSERT INTO streamers VALUES ('mrc',  '2019-01-31 00:4:01' , 'Pokemon Yellow', 3600, 12);

INSERT INTO streamers VALUES ('mrd',  '2019-01-01 00:4:01' , 'Pokemon Yellow', 3600, 2);
INSERT INTO streamers VALUES ('mrd',  '2019-01-31 00:4:01' , 'Pokemon Yellow', 3600, 8);
INSERT INTO streamers VALUES ('mrd',  '2018-01-01 00:00:01' , 'Pokemon Yellow', 3600, 2);
INSERT INTO streamers VALUES ('mrd',  '2018-01-01 00:00:01' , 'Pokemon Yellow', 3600, 2);
INSERT INTO streamers VALUES ('mrd',  '2018-01-01 00:00:01' , 'Pokemon Yellow', 3600, 2);
INSERT INTO streamers VALUES ('mrd',  '2018-01-01 00:00:01' , 'Pokemon Yellow', 3600, 2);
INSERT INTO streamers VALUES ('mrd',  '2018-01-01 00:00:01' , 'Pokemon Yellow', 3600, 2);
INSERT INTO streamers VALUES ('mrd',  '2018-02-01 00:00:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrd',  '2018-02-01 00:00:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrd',  '2018-02-01 00:00:01' , 'Hollow Knight', 3600, 2);

INSERT INTO streamers VALUES ('mre',  '2019-01-01 00:4:01' , 'Pokemon Yellow', 3600, 2);
INSERT INTO streamers VALUES ('mre',  '2019-01-31 00:4:01' , 'Pokemon Yellow', 3600, 8);
INSERT INTO streamers VALUES ('mre',  '2018-02-01 00:00:01' , 'Hollow Knight', 3600, 2);

INSERT INTO streamers VALUES ('mrf',  '2018-02-01 00:00:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrf',  '2019-01-01 00:4:01' , 'Pokemon Yellow', 3600, 2);
INSERT INTO streamers VALUES ('mrf',  '2019-01-31 00:4:01' , 'Pokemon Yellow', 3600, 8);

INSERT INTO streamers VALUES ('mrg',  '2019-01-01 00:4:01' , 'Pokemon Yellow', 3600, 2);
INSERT INTO streamers VALUES ('mrg',  '2019-01-31 00:4:01' , 'Pokemon Yellow', 3600, 8);
INSERT INTO streamers VALUES ('mrg',  '2018-02-01 00:00:01' , 'Hollow Knight', 3600, 2);

INSERT INTO streamers VALUES ('mrh',  '2019-01-01 00:4:01' , 'Pokemon Yellow', 3600, 2);
INSERT INTO streamers VALUES ('mrh',  '2019-01-31 00:4:01' , 'Pokemon Yellow', 3600, 8);
INSERT INTO streamers VALUES ('mrh',  '2018-02-01 00:00:01' , 'Hollow Knight', 3600, 2);


INSERT INTO streamers VALUES ('mri',  '2018-02-01 00:00:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mri',  '2019-01-01 00:4:01' , 'Pokemon Yellow', 3600, 2);
INSERT INTO streamers VALUES ('mri',  '2019-01-31 00:4:01' , 'Pokemon Yellow', 3600, 7);

INSERT INTO streamers VALUES ('mrj',  '2018-02-01 00:00:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrj',  '2019-01-01 00:4:01' , 'Pokemon Yellow', 3600, 2);
INSERT INTO streamers VALUES ('mrj',  '2019-01-31 00:4:01' , 'Pokemon Yellow', 3600, 8);

INSERT INTO streamers VALUES ('mrk',  '2018-02-01 00:00:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrk',  '2018-08-01 00:00:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrk',  '2019-01-01 00:4:01' , 'Pokemon Yellow', 3600, 2);
INSERT INTO streamers VALUES ('mrk',  '2019-01-31 00:4:01' , 'Pokemon Yellow', 3600, 6);

INSERT INTO streamers VALUES ('mrl',  '2018-02-01 00:00:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrl',  '2019-01-01 00:4:01' , 'Pokemon Yellow', 3600, 2);
INSERT INTO streamers VALUES ('mrl',  '2019-01-31 00:4:01' , 'Pokemon Yellow', 3600, 8);

INSERT INTO streamers VALUES ('mrl',  '2018-03-01 00:00:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrl',  '2018-04-01 00:00:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrl',  '2018-05-01 00:00:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrl',  '2018-06-01 00:00:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrl',  '2018-07-01 00:00:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrl',  '2018-08-01 00:00:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrl',  '2018-11-01 00:00:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrl',  '2018-09-01 00:00:01' , 'Hollow Knight', 3600, 2);
INSERT INTO streamers VALUES ('mrl',  '2018-12-01 00:00:01' , 'Hollow Knight', 3600, 2);


INSERT INTO games_metadata 
VALUES ('Hollow Knight',  '2008-02-01 12:00:01' , 'Teamwhatever', 'Metroidvania');

INSERT INTO games_metadata 
VALUES ('Pokemon Yellow',  '1999-02-01 12:00:01' , 'Game Freak', 'Strategy');






SELECT substr(timestamp,6,2) AS month, COUNT( DISTINCT username) AS unique_streamers, CAST(count(*) AS FLOAT)/60. AS hours_broadcast
FROM streamers 
WHERE timestamp BETWEEN '2018-01-01' AND '2019-01-01' 
GROUP BY substr(timestamp,6,2);	



SELECT '' FROM (SELECT COUNT(*) FROM games_metadata);
SELECT '--------------------' FROM (SELECT COUNT(*) FROM games_metadata);
SELECT '' FROM (SELECT COUNT(*) FROM games_metadata);



SELECT username,
	CAST(SUM(
		CASE 
			WHEN N  % 2  THEN -followers 
			ELSE followers END)
		AS FLOAT)/
	CAST(followers AS FLOAT) AS follower_growth
FROM(
	SELECT username,followers,timestamp, row_number() OVER(ORDER BY username,timestamp) AS N
	FROM streamers 
	WHERE  timestamp BETWEEN '2019-01-01' AND '2019-02-01'
	GROUP BY username,followers HAVING timestamp= MAX(timestamp) OR timestamp= MIN(timestamp) 
	ORDER BY username,timestamp
) 
GROUP BY username
ORDER BY follower_growth DESC LIMIT 10;	
  
SELECT '' FROM (SELECT COUNT(*) FROM games_metadata);
SELECT '--------------------' FROM (SELECT COUNT(*) FROM games_metadata);
SELECT '' FROM (SELECT COUNT(*) FROM games_metadata);


SELECT publisher,CAST(COUNT() AS FLOAT)/60. AS hours_watched
FROM streamers LEFT JOIN  (SELECT game,publisher FROM  games_metadata) g ON streamers.game=g.game
WHERE timestamp BETWEEN '2019-01-01' AND '2019-04-01'
GROUP BY publisher;


.quit

