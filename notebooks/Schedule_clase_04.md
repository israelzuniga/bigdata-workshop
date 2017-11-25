# Preparativos:
## En la terminal de comandos de su computadora

```bash


docker run --rm -d -e GRANT_SUDO=yes \
--user root \
-p 4040:4040 \
-p 4041:4041 \
-p 4042:4042 \
-p 4043:4043 \
-p 8888:8888 \
-p 18080:18080 \
jupyter/pyspark-notebook start-notebook.sh

```


# - Ejercicio CC
# - PySpark Pictures: 
    - git clone https://github.com/jkthompson/pyspark-pictures.git
# - Spark Internals: 
    - git clone https://github.com/JerryLead/SparkInternals.git
# - Spark Avanzado
    Spark RDDs (Avanzado): 
    Lineage
    Storage Levels
    Caching
    Persistence
    Checkpointing
    Broadcast variables
    Accumulators
    Partitioning /  Repartitioning
# - Spark UI