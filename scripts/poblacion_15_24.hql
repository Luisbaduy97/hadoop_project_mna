USE jalisco;
DROP TABLE IF EXISTS poblacion_15_24;
create table poblacion_15_24(Municipality_ID int, Municipality string, population int, population_total int, percentage float) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE;
ALTER TABLE poblacion_15_24 SET TBLPROPERTIES("skip.header.line.count"="1");
LOAD DATA INPATH '/user/maria_dev/jalisco/poblacion_15_24.csv' OVERWRITE INTO TABLE poblacion_15_24;