import usercase2_1 as ss
import sqlite3

gamle_scene = "../filesNeeded/gamle-scene.txt"

# Koble til SQLite-databasen 'Teater.db'
conn = sqlite3.connect('./database/Teater.db')
cursor = conn.cursor()

# Forespørsel for å slette tabellen hvis den eksisterer
cursor.execute('''DROP TABLE IF EXISTS Stol''')

# Opprettelse av tabellen
cursor.execute('''
    CREATE TABLE Stol (
        StolNR INTEGER,
        RadNR INTEGER,
        SalID INTEGER,
        OmraadeNavn VARCHAR(50),
        constraint Stol_pk primary key (StolNR, RadNR, OmraadeNavn, SalID),
        constraint salID_fk foreign key (SalID) references Sal(SalID)
    )
''')

# Utfør endringene og lukk tilkoblingen
conn.commit()

cursor.execute('''DROP TABLE IF EXISTS BillettType''')

# Opprettelse av tabellen
cursor.execute('''
    CREATE TABLE BillettType (
        BTID INTEGER,
        Gruppe VARCHAR(30),
        Pris INTEGER,
        TID INTEGER,
        constraint BTID_pk primary key (BTID),
        constraint TID_fk foreign key (TID) references Teaterstykke(TID)
    )
''')

conn.commit()

verdier = [
    (1, 'Ordinær', 350, 1),
    (2, 'Honnør', 300, 1),
    (3, 'Student', 220, 1),
    (4, 'Barn', 220, 1),
    (5, 'Gruppe 10', 320, 1),
    (6, 'Gruppe honnør 10', 270, 1)]

# Sett inn dataene i tabellen
for n in verdier:
    cursor.execute("INSERT INTO BillettType (BTID, Gruppe, Pris, TID) VALUES (?, ?, ?, ?)", n)

# Funksjon håndterer stoler som er kjøpt og legger dem inn i databasen
def add_bought_tickets(filnavn, salID, valgte_seter, valgt_type):
    stoler = ss.scan_alle_stoler(filnavn)
    stoler_igjen = []  # Holder på de behandlede stolene
    stol_nummer_id_for_sal = 1  # Unikt stolnummer som starter fra 1 og øker for hver stol i salen
    ledig = False #Setter at det er ledig for antall seter først som False

    cursor.execute("SELECT Pris FROM BillettType WHERE Gruppe = ?", (valgt_type,))
    p_type = cursor.fetchone()[0]

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
add_bought_tickets(gamle_scene, 1, 9, 'Ordinær')