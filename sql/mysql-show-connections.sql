SELECT id, db, time, CONCAT(user,'@',host) AS connection
     , CONCAT(command, ': ', info) as command 
  FROM information_schema.processlist;


-- Connections older than 10 minutes
SELECT id, db, time/60 as time, CONCAT(user,'@',host) AS connection
     , CONCAT(command, ': ', info) as command 
  FROM information_schema.processlist
WHERE time/60 > 10;
