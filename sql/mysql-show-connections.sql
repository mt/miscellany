SELECT db, time, CONCAT(user,'@',host) AS connection
     , CONCAT(command, ': ', info) as command 
  FROM information_schema.processlist;
