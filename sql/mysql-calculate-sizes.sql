
-- Summarize database sizes
SELECT table_schema "Data Base Name"
     , SUM( data_length + index_length) / 1024 / 1024 "Data Base Size in MB"
  FROM information_schema.TABLES GROUP BY table_schema ;

-- Summarize table sizes
SELECT TABLE_NAME, table_rows, data_length, index_length
     , round(((data_length + index_length) / 1024 / 1024),2) "Size in MB"
  FROM information_schema.TABLES 
 WHERE table_schema = '<database_name>';
