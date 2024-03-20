# Setter inn alle stoler i databasen

import usercase2_1 as ss # Importer scan_seats for å kunne bruke funksjonene som leser inn stoler fra tekstfilene
import sqlite3 # Importerer sqlite3 for å kunne koble til databasen og legge til stoler

hovedscenen = "../filesNeeded/hovedscenen.txt"
gamle_scene = "../filesNeeded/gamle-scene.txt"

# Setter opp nødvendige variabler for å legge til stoler i databasen - fra tekstfilene
alle_stoler_hs = ss.stol_info_alle(ss.scan_alle_stoler(hovedscenen), 1)
alle_stoler_gs = ss.stol_info_alle(ss.scan_alle_stoler(gamle_scene), 2)

# Koble til SQLite-databasen 'test.db'
conn = sqlite3.connect('./database/Teater.db')
cursor = conn.cursor()

# Utfører INSERT-spørringer for hver stol for hver scene (bytt ut 'stoler_kjopt_xx' med faktisk variabelnavn for valgt scene => hs: hovedscenen, gs: gamle_scene)
for stol_hs in alle_stoler_hs:
    # Siden 'stoler_kjopt_xx' allerede er en tuple på formatet (StolNR, RadNR, SalID, OmraadeNavn), kan vi bruke den direkte på følgende måte:
    cursor.execute('''INSERT INTO Stol VALUES (?, ?, ?, ?)''', stol_hs)
    
for stol_gs in alle_stoler_gs:
    cursor.execute('''INSERT INTO Stol VALUES (?, ?, ?, ?)''', stol_gs)

conn.commit() # Lagrer endringene
conn.close() # Lukker forbindelsen med databasen.

print(f'Alle stoler fra oppgitte txt-filer er lagt til i databasen.')