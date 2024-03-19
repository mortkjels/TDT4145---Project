# Deloppgave 2: Skript for å lese inn stoler fra tekstfiler og legge dem til i databasen

# TODO: Implementere å hoppe over stoler merket med 'x' i tekstfilene
# TODO: Fixe bug, hvor radene må reverseres slik at rad 1 er i bunn av tekstfilen og rad n er øverst

# Henter filene:
gamle_scene = "../filesNeeded/gamle-scene.txt"
hovedscenen = "../filesNeeded/hovedscenen.txt"

def scan_alle_stoler(filnavn):
    omraade_til_salID = {'Galleri': 1, 'Balkong': 2, 'Parkett': 3}
    stoler = []
    omraade_navn = ''
    rad_nr = 1  # Anta at radnummer starter på 1 for hvert område

    with open(filnavn, 'r') as fil:
        for linje in fil:
            linje = linje.strip()[::-1] #Reverserer listen for å få riktig radnummer ved å starte fra bunn av filen
            if linje in omraade_til_salID:
                omraade_navn = linje
                rad_nr = 1  # Nullstiller radnummer for hvert nytt område
            elif linje and omraade_navn:  # Sjekker også at omraade_navn er gyldig før vi legger til stoler
                stol_nr = 1
                for tegn in linje:
                    # Inkluderer kun gyldige stolposisjoner fra oppgitt tekstfil. (ignorer 'x')
                    if tegn in '1': # Legger så kun til stolene som er kjøpt, som er stol gitt ved 1.
                        stoler.append((stol_nr, rad_nr, omraade_til_salID[omraade_navn], omraade_navn))
                        stol_nr += 1
                rad_nr += 1

    return stoler


# Sette inn billetter i som er kjøpt i databasen
# import sqlite3 #Importerer sqlite3 for å kunne koble til databasen og legge til stoler

# stoler_kjopt_hs = scan_alle_stoler(hovedscenen)
# stoler_kjopt_gs = scan_alle_stoler(gamle_scene)

# # Koble til SQLite-databasen 'test.db'
# conn = sqlite3.connect('./database/test.db')
# cursor = conn.cursor()

# # Utfører INSERT-spørringer for hver stol for hver scene (bytt ut 'stoler_kjopt_xx' med faktisk variabelnavn for valgt scene => hs: hovedscenen, gs: gamle_scene)
# for stol in stoler_kjopt_hs:
#     # Siden 'stoler_kjopt_xx' allerede er en tuple på formatet (StolNR, RadNR, SalID, OmraadeNavn), kan vi bruke den direkte på følgende måte:
#     cursor.execute('''INSERT INTO Stol VALUES (?, ?, ?, ?)''', stol)
    
# # Lagrer (commits) endringene
# conn.commit()

# # Lukker forbindelsen med databasen.
# conn.close()

# print('Alle stoler som er kjøpt fra txt-filene er lagt til i databasen.')

# Debugging 
stoler_kjopt_hs = scan_alle_stoler(hovedscenen)
stoler_kjopt_gs = scan_alle_stoler(gamle_scene)
print("Printer kjøpte stoler for Hovedscenen:\n")
for stol in stoler_kjopt_hs:
    print(stol)
print("\n ------------------------- \n")
print("Printer kjøpte stoler for Gamle Scenen:\n")
for stol in stoler_kjopt_gs:
    print(stol)
