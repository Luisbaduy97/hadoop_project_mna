USE jalisco;

DROP TABLE IF EXISTS jalisco_tbl;

CREATE TABLE jalisco_tbl (
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
  fecha_alta STRING,
  municipality_id INT, 
  analfabet_population INT, 
  population_total INT, 
  percentage FLOAT, 
  exports INT, 
  imports INT, 
  balance INT,
  des_gini float, 
  des_population int,
  clinics int, 
  beds int, 
  establishments int, 
  sal_population int, 
  bed_average float, 
  Health_Center_Average float,
  pob_15_24_population int,
  pob_15_24_population_total int,
  pob_15_24_population_total_percentage float
);

with socio_econ as (
	select *
  	from jalisco.jal_socio_econ
),
denue as (
	select *
  	from jalisco.denue_inegi_14_clean
),
merge_tbls as (
    select denue.*, socio_econ.* from denue 
    left join socio_econ on denue.cve_mun = socio_econ.municipality_id
)

INSERT OVERWRITE TABLE jalisco_tbl select * from merge_tbls;