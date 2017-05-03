# -*- coding: utf-8 -*-
from mrjob.compat import jobconf_from_env
from mrjob.job import MRJob
from pymongo import MongoClient

# PASO 1: Conexión al Server de MongoDB Pasandole el host y el puerto
mongoClient = MongoClient('10.131.137.188',27017)

# PASO 2: Conexión a la base de datos
db = mongoClient["grupo_07"]
db.authenticate("user1", "eafit.2017")

# PASO 3: Obtenemos una coleccion para trabajar con ella
collection = db.gutenberg

class MRWordFrequencyCount(MRJob):

    def mapper(self, _, line):
        value = line.decode('utf-8','ignore').split()
       
        for word in value:
        	yield (jobconf_from_env('mapreduce.map.input.file'),word), 1

    def reducer(self, key, values):    	
       	collection.insert({ 'nameFile': key[0],'word': key[1], 'numero':sum(values)})
    	yield key,sum(values)

if __name__ == '__main__':	
    MRWordFrequencyCount.run()

# PASO FINAL: Cerrar la conexion
mongoClient.close()