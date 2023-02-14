USE jalisco;
DROP TABLE IF EXISTS uni_salud;
create table uni_salud(Municipality_ID int, Municipality string, clinics int, beds int, establishments int, population int, bed_average float, Health_Center_Average float) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE;
ALTER TABLE uni_salud SET TBLPROPERTIES("skip.header.line.count"="1");
LOAD DATA INPATH '/user/maria_dev/jalisco/uni_salud.csv' OVERWRITE INTO TABLE uni_salud;