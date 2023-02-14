USE jalisco;
DROP TABLE IF EXISTS denue_inegi_14_clean;

CREATE TABLE denue_inegi_14_clean (
  id INT,
  clee INT,
  nom_estab STRING,
  raz_social STRING,
  codigo_act INT,
  per_ocu INT,
  tipo_vial STRING,
  nom_vial STRING,
  tipo_v_e_1 STRING,
  nom_v_e_1 STRING,
  tipo_v_e_2 STRING,
  nom_v_e_2 STRING,
  tipo_v_e_3 STRING,
  nom_v_e_3 STRING,
  numero_ext INT,
  letra_ext STRING,
  edificio STRING,
  edificio_e STRING,
  numero_int INT,
  letra_int STRING,
  tipo_asent STRING,
  nomb_asent STRING,
  tipoCenCom STRING,
  nom_CenCom STRING,
  num_local INT,
  cod_postal INT,
  cve_ent INT,
  entidad STRING,
  cve_mun INT,
  municipio STRING,
  cve_loc INT,
  localidad STRING,
  ageb INT,
  manzana INT,
  telefono INT,
  correoelec STRING,
  www STRING,
  tipoUniEco STRING,
  latitud FLOAT,
  longitud FLOAT,
  fecha_alta STRING
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE;


ALTER TABLE denue_inegi_14_clean SET TBLPROPERTIES("skip.header.line.count"="1");

LOAD DATA INPATH '/user/maria_dev/jalisco/denue_inegi_14_clean.csv' OVERWRITE INTO TABLE denue_inegi_14_clean;