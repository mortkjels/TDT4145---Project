"""
Implementere et Pythonprogram (med bruk av SQL) som tar inn
en dato og skriver ut hvilke forestillinger som finnes på denne datoen og lister
opp hvor mange billetter (dvs. stoler) som er solgt. Ta også med forestillinger
hvor det ikke er solgt noen billetter.
"""

import sqlite3

# Definere funksjonen som tar inn en dato som input 
def forestilling_finder(dato):
    # Koble til databasen - foreløpig test.db => for testing...
    conn = sqlite3.connect('database/test.db')
    c = conn.cursor()
    # SQL-spørring: ut ifra tabellene våre...
    c.execute('''
              SELECT forestilling, COUNT(billett_id) 
              FROM forestilling 
              LEFT JOIN billett ON forestilling.forestilling_id = billett.forestilling_id 
              WHERE dato = ? 
              GROUP BY forestilling'''
              , (dato))
    
    result = c.fetchall() # Fetcher resultatene som skal returneres
    conn.close()
    return result