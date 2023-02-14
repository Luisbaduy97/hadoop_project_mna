DROP TABLE IF EXISTS jal_socio_econ;

CREATE TABLE jal_socio_econ(
	municipality_id STRING, 
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

with jal_analfabetismo as (
	select municipality_id - 14000 as municipality_id,
  		analfabet_population,
  		population_total,
  		percentage
  	from jalisco.analfabetismo
),
jal_balance_neto as (
	select municipality_id - 14000 as municipality_id,
  		exports,
  		imports,
  		balance
  	from jalisco.balance_neto
),
jal_desigualdad as (
	select municipality_id - 14000 as municipality_id,
  		gini,
  		population
  	from jalisco.desigualdad
),
jal_uni_salud as (
	select municipality_id - 14000 as municipality_id,
  		clinics,
  		beds,
        establishments,
        population,
        bed_average,
        health_Center_Average
  	from jalisco.uni_salud
),
jal_pob_15_24 as (
	select municipality_id - 14000 as municipality_id,
  		population,
  		population_total,
        percentage
  	from jalisco.poblacion_15_24
),
merge_tables as (
    select 
		jal_analfabetismo.municipality_id as municipality_id,
		jal_analfabetismo.analfabet_population as analfabet_population,
  		jal_analfabetismo.population_total as population_total,
  		jal_analfabetismo.percentage as percentage,
		jal_balance_neto.exports,
		jal_balance_neto.imports,
		jal_balance_neto.balance,
		jal_desigualdad.gini as des_gini,
		jal_desigualdad.population as des_population,
		jal_uni_salud.clinics,
  		jal_uni_salud.beds,
        jal_uni_salud.establishments,
        jal_uni_salud.population as sal_population,
        jal_uni_salud.bed_average,
        jal_uni_salud.health_Center_Average,
		jal_pob_15_24.population as pob_15_24_population,
  		jal_pob_15_24.population_total as pob_15_24_population_total,
        jal_pob_15_24.percentage as pob_15_24_population_total_percentage
	from jal_analfabetismo
    left join jal_balance_neto on jal_analfabetismo.municipality_id = jal_balance_neto.municipality_id
    left join jal_desigualdad on jal_analfabetismo.municipality_id = jal_desigualdad.municipality_id
    left join jal_uni_salud on jal_analfabetismo.municipality_id = jal_uni_salud.municipality_id
    left join jal_pob_15_24 on jal_analfabetismo.municipality_id = jal_pob_15_24.municipality_id
)

INSERT OVERWRITE TABLE jal_socio_econ select * from merge_tables;