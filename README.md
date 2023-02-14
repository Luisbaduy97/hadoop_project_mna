# hadoop_project_mna


```bash
# Si el namenode entra en modo seguro y tarda en iniciar ejecutar el siguiente comando:
sudo -u hdfs hdfs dfsadmin -safemode leave

# Si no se cuentan con permisos para mover archivos ejecutar el siguiente comando
# Les da permisos de lectura, escritura y ejecución a todos los usuario de la instancia
hdfs dfs -chmod -R 777 /user/maria_dev
```

# Ejecutar comandos de Hive para la base de datos de jalisco
```bash
hive # Entrar directo al cli de hive dentro de putty
create database jalisco; # Crea la base de datos
quit; # te permite salir del cli para poder correr otros comandos

###### CARGAR LOS DATOS DENTRO DE LA BASE DE DATOS #######
hive -f <la ruta de tu archivo hql>
hive -f scrips/analfabetismo.hql

```