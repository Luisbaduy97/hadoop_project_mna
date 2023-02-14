USE jalisco;
DROP TABLE IF EXISTS analfabetismo;
create table analfabetismo(Municipality_ID int, Municipality string, Analfabet_Population int, Population_Total int, Percentage float) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE;
ALTER TABLE analfabetismo SET TBLPROPERTIES("skip.header.line.count"="1");
LOAD DATA INPATH '/user/maria_dev/jalisco/analfabetismo.csv' OVERWRITE INTO TABLE analfabetismo;