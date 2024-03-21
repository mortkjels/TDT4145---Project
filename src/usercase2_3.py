import usercase2_1 as ss
import sqlite3
import random as r

# Henter inn tekstfilene:
gamle_scene = "filesNeeded/gamle-scene.txt"
hovedscenen = "filesNeeded/hovedscenen.txt"

# Koble til SQLite-databasen 'TrondelagTeater.db'
conn = sqlite3.connect('src/database/TrondelagTeater.db')
cursor = conn.cursor()

# Funksjon håndterer stoler som er kjøpt og legger dem inn i databasen
def add_bought_tickets(filnavn, salID):
    stoler = ss.scan_alle_stoler(filnavn)
    stoler_solgt = []  # Holder på de behandlede stolene
    stol_nummer_id_for_sal = 1  # Unikt stolnummer som starter fra 1 og øker for hver stol i salen
    billettID = 1

    for omraade_navn in reversed(list(stoler.keys())):  # Reverserer listen for å behandle områdene i riktig rekkefølge - i forhold til scenen.
        rad_nr = 1  # Starter radnummereringen for hvert nytt område
        for rad in stoler[omraade_navn]:
        
            for stol in rad[0]:
                if stol == 'x' or stol == '0':  # Hopper over stoler merket med 'x' - ugyldige stoler + stoler som ikke er solgt - '0
                    stol_nummer_id_for_sal += 1
                    continue
                # Legger kun til gyldige stoler ('0' eller '1')
                if salID == 1: #Hvis det er Kongescenen så gjelder visse billetter
                    stoler_solgt.append((billettID, stol_nummer_id_for_sal, rad_nr, 3, r.randint(1,5), salID, omraade_navn, r.randint(1,5)))
                    billettID += 1
                    stol_nummer_id_for_sal += 1
                else: #Hvis det er Gamle Scene så gjelder visse billetter
                    stoler_solgt.append((billettID, stol_nummer_id_for_sal, rad_nr, 6, r.randint(6,11), salID, omraade_navn, r.randint(1,5)))
                    billettID += 1
                    stol_nummer_id_for_sal += 1
                
            rad_nr += 1  # Oppdaterer radnummer for neste rad i området

    for stol_tatt in stoler_solgt:
        cursor.execute("INSERT INTO Billetter VALUES (?, ?, ?, ?, ?, ?, ?, ?)", stol_tatt)
        conn.commit()
    
    print(f"Billetene som er kjøpt for {filnavn} er lagt til i databasen.")
    
# Legger inn forhåndskjøpte stoler i databasen - for begge filene
add_bought_tickets(hovedscenen, 1)
add_bought_tickets(gamle_scene, 2)

conn.close()     
