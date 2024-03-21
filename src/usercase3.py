import usercase2_1 as ss
import sqlite3

gamle_scene = "filesNeeded/gamle-scene.txt"

# Funksjon håndterer stoler som er kjøpt og legger dem inn i databasen
def add_bought_tickets(filnavn, salID, valgte_seter, valgt_type):
    conn = sqlite3.connect('src/database/TrondelagTeater.db')
    cursor = conn.cursor()
    stoler = ss.scan_alle_stoler(filnavn)
    stoler_igjen = []  # Holder på de behandlede stolene
    stol_nummer_id_for_sal = 1  # Unikt stolnummer som starter fra 1 og øker for hver stol i salen
    ledig = False #Setter at det er ledig for antall seter først som False
    cursor.execute("SELECT BTID FROM BillettType WHERE ?", (salID,))

    cursor.execute("SELECT Pris FROM BillettType WHERE TID = ? AND Gruppe = ?", (salID, valgt_type,))
    p_type = cursor.fetchone()[0]
    print(p_type)

    for omraade_navn in reversed(list(stoler.keys())):  # Reverserer listen for å behandle områdene i riktig rekkefølge - i forhold til scenen.
        rad_nr = 1  # Starter radnummereringen for hvert nytt område
        for rad in stoler[omraade_navn]:
            ledige_stoler_i_rad = []
            ledige_seter = 0
            for stol in rad[0]:

                if stol == '1' or stol == 'x':
                     stol_nummer_id_for_sal += 1
                     continue
                else:   # Hopper over stoler merket med 'x' - ugyldige stoler + stoler som ikke er solgt - '0
                    ledige_stoler_i_rad.append(stol_nummer_id_for_sal)
                    stol_nummer_id_for_sal += 1
                    if ledig == False:
                        ledige_seter += 1

                    if ledige_seter >= valgte_seter: 
                        ledig = True
                        valgt_rad = rad_nr
                        valgt_omr = omraade_navn
                        for stol in rad[0]:
                            if stol == '0' and ledige_seter>0:
                                del ledige_stoler_i_rad[0]
                                ledige_seter -= 1
                            
                
            for stol_id in ledige_stoler_i_rad:
                stoler_igjen.append((stol_id, rad_nr, omraade_navn, salID)) 
            
            
            rad_nr += 1  # Oppdaterer radnummer for neste rad i området

    if ledig == False:
         print("Ikke nok ledige seter")
    else:
        print(f"Valgt ut {valgte_seter} seter på rad: {valgt_rad}, Område: {valgt_omr}. Prisen blir {valgte_seter*p_type}kr")
    conn.close()
# Legger inn kjøpte stoler i databasen - for hovedscenen (test)
add_bought_tickets(gamle_scene, 2, 9, 'Ordinær')
