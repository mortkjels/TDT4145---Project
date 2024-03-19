# Deloppgave 2: Skript for å lese inn stoler fra tekstfiler og legge dem til i databasen

# TODO: Implementere å hoppe over stoler merket med 'x' i tekstfilene - good!
# TODO: Fixe bug, hvor radene må reverseres slik at rad 1 er i bunn av tekstfilen og rad n er øverst - good!

# TODO: Implementere boolean for å sjekke om stol allerede er kjøpt, og evt. ikke legge til i databasen - done!

# Henter filene:
gamle_scene = "../filesNeeded/gamle-scene.txt"
hovedscenen = "../filesNeeded/hovedscenen.txt"

# Funksjon som håndterer lesing av stoler fra tekstfilene og lagrer dem i en dictionary
def scan_alle_stoler(filnavn):
    omraade_navn_list = ["Parkett", "Balkong", "Galleri"]  # Definerer gyldige områdenavn
    omraade_dict = {}
    rad_liste = []
    omraade_i_sal = None

    with open(filnavn, 'r') as fil:
        linjer = [linje.strip() for linje in fil.readlines()] # Setter alle linjer i en liste og fjerner whitespace
        
    # Håndtering av områder og rader i riktig rekkefølge:
    for val in linjer:
        if val in omraade_navn_list:
            if omraade_i_sal:  # Sjekker om vi allerede har begynt å samle for et område
                omraade_dict[omraade_i_sal] = rad_liste[::-1]  # Legger til rader i omvendt rekkefølge - slik at rad 1 er nederst
            omraade_i_sal = val  # Oppdaterer nåværende område
            rad_liste = []  # Resetter listen for det nye området
        else:
            rad_liste.append([val])  # Legger til raden i listen for det nåværende området
    if omraade_i_sal:  # Legger til siste området etter løkken slutter
        omraade_dict[omraade_i_sal] = rad_liste[::-1]

    return omraade_dict

# Funksjon som tar ut informasjon om stolene fra dictionary og returnerer en liste over stolene som vi kan bruke til å legge til i databasen

def stol_info(omraade_dict, salID):
    omraade_til_salID = {'Galleri': 1, 'Balkong': 2, 'Parkett': 3}
    behandlede_stoler = []  # Holder på de behandlede stolene
    stol_nummer_id_for_sal = 1  # Unikt stolnummer som starter fra 1 og øker for hver stol i salen
    stol_solgt = False  # Boolean for å sjekke om stol allerede er kjøpt

    for omraade_navn in reversed(list(omraade_dict.keys())):  # Reverserer listen for å behandle områdene i riktig rekkefølge - i forhold til scenen.
        rad_nr = 1  # Starter radnummereringen for hvert nytt område
        for rad in omraade_dict[omraade_navn]:
        
            for stol in rad[0]:
                if stol == 'x':  # Hopper over stoler merket med 'x' - ugyldige stoler
                    stol_nummer_id_for_sal += 1
                    continue
                if stol == '1':
                    stol_solgt = True
                    # Legger kun til gyldige stoler ('0' eller '1')
                behandlede_stoler.append((stol_nummer_id_for_sal, rad_nr, omraade_til_salID[omraade_navn], omraade_navn, salID, stol_solgt))
                stol_nummer_id_for_sal += 1
                stol_solgt = False
                
            rad_nr += 1  # Oppdaterer radnummer for neste rad i området

    
    return behandlede_stoler
                
            
                
                
    # ----------------- Test kode -----------------        
    # omraade_til_salID = {'Galleri': 1, 'Balkong': 2, 'Parkett': 3}
    # stoler = []
    # omraade_navn = ''
    # rad_nr = 1  # Anta at radnummer starter på 1 for hvert område
    # stol_nr = 1  # Unikt stolnummer for hver stol

    # with open(filnavn, 'r') as fil:
    #     # print(fil.readlines())
    #     for linje in reversed(fil.readlines()):
    #         linje = linje.strip() # Fjerner whitespace fra linjen
    #         print(linje)
    #         if linje in omraade_til_salID:
    #             omraade_navn = linje
    #             rad_nr = 1  # Nullstiller radnummer for hvert nytt område
    #         elif linje and omraade_navn:  # Sjekker også at omraade_navn er gyldig før vi legger til stoler
    #             for tegn in linje:
    #                 # Inkluderer kun gyldige stolposisjoner fra oppgitt tekstfil. 
    #                 if tegn == 'x': # Hopper over stoler merket med 'x' - ugyldige stoler
    #                     stol_nr += 1
    #                     continue
    #                 if tegn in '01': # Legger så til alle stoler som er merket med '0' eller '1'
    #                     stoler.append((stol_nr, rad_nr, omraade_til_salID[omraade_navn], omraade_navn))
    #                     stol_nr += 1
    #             rad_nr += 1

    # return stoler


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
stoler_hentet_fra_hs = scan_alle_stoler(hovedscenen)
stoler_til_database_hs = stol_info(stoler_hentet_fra_hs, 1)
print("Printer kjøpte stoler for Hovedscenen:\n")
for stol in stoler_til_database_hs:
    print(stol)
print("\n")
stoler_hentet_fra_gs = scan_alle_stoler(gamle_scene)
stoler_til_database_gs = stol_info(stoler_hentet_fra_gs, 2)
print("Printer kjøpte stoler for Gamle Scenen:\n")
for stol in stoler_til_database_gs:
    print(stol)
print(stoler_til_database_gs)
