SELECT db, time, CONCAT(user,'@',host) AS connection, command 
  FROM information_schema.processlist;
