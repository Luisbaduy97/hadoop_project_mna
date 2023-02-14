USE jalisco;
DROP TABLE IF EXISTS desigualdad;
create table desigualdad(Nation_ID string, Nation string, State_ID int, State string, Municipality_ID int, Municipality string, gini float, population int) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE;
ALTER TABLE desigualdad SET TBLPROPERTIES("skip.header.line.count"="1");
LOAD DATA INPATH '/user/maria_dev/jalisco/desigualdad.csv' OVERWRITE INTO TABLE desigualdad;