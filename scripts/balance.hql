USE jalisco;
DROP TABLE IF EXISTS balance_neto;
create table balance_neto(Nation_ID string, Nation string, State_ID int, State string, Municipality_ID int, Municipality int, Exports int, Imports int, Balance int) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE;
ALTER TABLE balance_neto SET TBLPROPERTIES("skip.header.line.count"="1");
LOAD DATA INPATH '/user/maria_dev/jalisco/balance_neto.csv' OVERWRITE INTO TABLE balance_neto;