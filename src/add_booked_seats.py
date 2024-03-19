import scan_seats as ss
import sqlite3

# Henter inn tekstfilene:
gamle_scene = "../filesNeeded/gamle-scene.txt"
hovedscenen = "../filesNeeded/hovedscenen.txt"

# Koble til SQLite-databasen 'test.db'
conn = sqlite3.connect('./database/test.db')
cursor = conn.cursor()

# Funksjon håndterer stoler som er kjøpt og legger dem inn i databasen
def add_bought_tickets(filnavn, salID):
    stoler = ss.scan_alle_stoler(filnavn)
    stoler_solgt = []  # Holder på de behandlede stolene
    stol_nummer_id_for_sal = 1  # Unikt stolnummer som starter fra 1 og øker for hver stol i salen

    for omraade_navn in reversed(list(stoler.keys())):  # Reverserer listen for å behandle områdene i riktig rekkefølge - i forhold til scenen.
        rad_nr = 1  # Starter radnummereringen for hvert nytt område
        for rad in stoler[omraade_navn]:
        
            for stol in rad[0]:
                if stol == 'x' or stol == '0':  # Hopper over stoler merket med 'x' - ugyldige stoler + stoler som ikke er solgt - '0
                    stol_nummer_id_for_sal += 1
                    continue
                # Legger kun til gyldige stoler ('0' eller '1')
                stoler_solgt.append((stol_nummer_id_for_sal, rad_nr, salID, omraade_navn)) 
                stol_nummer_id_for_sal += 1
                
            rad_nr += 1  # Oppdaterer radnummer for neste rad i området

    for stol in stoler_solgt:
        cursor.execute("INSERT INTO Stol VALUES (?, ?, ?, ?)", stol)
        conn.commit()
    
    print(f"Stolene i {filnavn} er lagt til i databasen")
    
# Legger inn kjøpte stoler i databasen - for begge filene
add_bought_tickets(hovedscenen, 1)
add_bought_tickets(gamle_scene, 2)

conn.close()     



#Debugging:
# for stol in add_bought_tickets(hovedscenen, 1):
#     print(stol)