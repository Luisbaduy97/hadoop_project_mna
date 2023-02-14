# hadoop_project_mna


```bash
# Si el namenode entra en modo seguro y tarda en iniciar ejecutar el siguiente comando:
sudo -u hdfs hdfs dfsadmin -safemode leave

# Si no se cuentan con permisos para mover archivos ejecutar el siguiente comando
# Les da permisos de lectura, escritura y ejecución a todos los usuario de la instancia
hdfs dfs -chmod -R 777 /user/maria_dev
```