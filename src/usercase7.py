import sqlite3

conn = sqlite3.connect("src/database/TrondelagTeater.db")
cursor = conn.cursor()

#Setter opp tabeller

cursor.execute("DROP TABLE IF EXISTS Akt")
cursor.execute("""
    CREATE TABLE Akt (
        AKID INTEGER PRIMARY KEY,
        Nummer INTEGER
    )
""")

akt_verdier = [
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 1)
]
cursor.executemany("INSERT OR IGNORE INTO Akt VALUES (?, ?)", akt_verdier)



cursor.execute("DROP TABLE IF EXISTS HarRolle")
cursor.execute("""
    CREATE TABLE HarRolle (
        SKID INTEGER NOT NULL,
        RID INTEGER,
        CONSTRAINT PK_HarRolle PRIMARY KEY (SKID),
        CONSTRAINT FK_HarRolle_SKID FOREIGN KEY (SKID) REFERENCES Skuespiller(SKID),
        CONSTRAINT FK_HarRolle_RID FOREIGN KEY (RID) REFERENCES Rolle(RID)
    )
""")

har_rolle_verdier = [
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (20, 13),
    (21, 14),
    (13, 15),
    (14, 16),
    (15, 17),
    (16, 18),
    (17, 19),
    (18, 20),
    (19, 21)
]
cursor.executemany("INSERT OR IGNORE INTO HarRolle VALUES (?, ?)", har_rolle_verdier)



cursor.execute("""DROP TABLE IF EXISTS Skuespiller""")
cursor.execute("""
    CREATE TABLE Skuespiller (
        SKID INTEGER,
        navn VARCHAR(50),
        constraint SKID_pk primary key (SKID)
    )
""")

skuespillere = [
    (1, "Arturo Scotti"),
    (2, "Ingunn Beate Strige Øyen"),
    (3, "Hans Petter Nilsen"),
    (4, "Madeleine Brandtzæg Nilsen"),
    (5, "Synnøve Fossum Eriksen"),
    (6, "Emma Caroline Deichmann"),
    (7, "Thomas Jensen Takyi"),
    (8, "Per Bostad Gulliksen"),
    (9, "Isak Holmen Sørensen"),
    (10, "Fabian Heidelberg Lunde"),
    (11, "Emil Olafsson"),
    (12, "Snorre Ryen Tøndel"),
    (13, "Sunniva Du Mond Nordal"),
    (14, "Jo Saberniak"),
    (15, "Marte M. Steinholt"),
    (16, "Tor Ivar Hagen"),
    (17, "Trond-Ove Skrødal"),
    (18, "Natalie Grøndahl Tangen"),
    (19, "Åsmund Flaten"),
    (20, "Emil Olafsson"),
    (21, "Emma Caroline Deichmann")
]
cursor.executemany("INSERT INTO Skuespiller VALUES (?, ?)", skuespillere)



cursor.execute("""DROP TABLE IF EXISTS Teaterstykke""")
cursor.execute("""
    CREATE TABLE IF NOT EXISTS Teaterstykke (
        TID INTEGER PRIMARY KEY,
        navn VARCHAR(50)
    )
""")

teaterstykke_verdier = [
    (1, "Kongsemnene"),
    (2, "Størst av alt er kjærligheten")
]
cursor.executemany("INSERT INTO Teaterstykke VALUES (?, ?)", teaterstykke_verdier)



cursor.execute("DROP TABLE IF EXISTS HarAkt")
cursor.execute("""
    CREATE TABLE HarAkt (
        AKID INTEGER NOT NULL,
        TID INTEGER NOT NULL,
        CONSTRAINT PK_HarAkt PRIMARY KEY (AKID),
        CONSTRAINT FK_HarAkt_TID FOREIGN KEY (TID) REFERENCES Teaterstykke(TID),
        CONSTRAINT FK_HarAkt_AKID FOREIGN KEY (AKID) REFERENCES Akt(AKID)
    )
""")

harakt_verdier = [
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    (6,2)
]
cursor.executemany("INSERT INTO HarAkt VALUES (?, ?)", harakt_verdier)



cursor.execute("DROP TABLE IF EXISTS Rolle")
cursor.execute("""
    CREATE TABLE Rolle (
        RID INTEGER PRIMARY KEY,
        Navn VARCHAR(50)
    )
""")

rolle_verdier = [
    (1, "Haakon Haakonssønn"),
    (2, "Inga fra Vartjeg"),
    (3, "Skule Jarl"),
    (4, "Fru Ragnhild"),
    (5, "Margrete"),
    (6, "Sigrid"),
    (7, "Biskop Nicolas"),
    (8, "Gregorius Jonssønn"),
    (9, "Paal Flida"),
    (10, "Baard Bratte"),
    (11, "Dagfinn Bonde"),
    (12, "Peter"),
    (13, "Jatgeir Skald"),
    (14, "Ingebjørg"),
    (15, "Sunniva Du Mond Nordal"),
    (16, "Jo Saberniak"),
    (17, "Marte M. Steinholt"),
    (18, "Tor Ivar Hagen"),
    (19, "Trond-Ove Skrødal"),
    (20, "Natalie Grøndahl Tangen"),
    (21, "Åsmund Flaten")
]
cursor.executemany("INSERT INTO Rolle VALUES (?, ?)", rolle_verdier)



cursor.execute("DROP TABLE IF EXISTS DeltarIAkt")
cursor.execute("""
    CREATE TABLE DeltarIAkt (
        AKID INTEGER,
        RID INTEGER,
        CONSTRAINT PK_DeltarIAkt PRIMARY KEY (AKID, RID),
        CONSTRAINT FK_DeltarIAkt_RID FOREIGN KEY (RID) REFERENCES Rolle(RID),
        CONSTRAINT FK_DeltarIAkt_AKID FOREIGN KEY (AKID) REFERENCES Akt(AKID)
    )
""")

deltar_i_akt_verdier = [
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    (1, 2),
    (3, 2),
    (1, 3),
    (2, 3),
    (3, 3),
    (4, 3),
    (5, 3),
    (1, 4),
    (5, 4),
    (1, 5),
    (2, 5),
    (3, 5),
    (4, 5),
    (5, 5),
    (1, 6),
    (2, 6),
    (5, 6),
    (1, 7),
    (2, 7),
    (3, 7),
    (1, 8),
    (2, 8),
    (3, 8),
    (4, 8),
    (5, 8),
    (1, 9),
    (2, 9),
    (3, 9),
    (4, 9),
    (5, 9),
    (2, 10),
    (4, 10),
    (1, 11),
    (2, 11),
    (3, 11),
    (4, 11),
    (5, 11),
    (3, 12),
    (4, 12),
    (5, 12),
    (4, 13),
    (4, 14),
    (6, 15),
    (6, 16),
    (6, 17),
    (6, 18),
    (6, 19),
    (6, 20),
    (6, 21)
]
cursor.executemany("INSERT INTO DeltarIAkt VALUES (?, ?)", deltar_i_akt_verdier)

conn.commit() #Comitter alle verdier som er lagt til i tabellen

#Her er funksjonen som finner medspillere til skuespilleren

def finn_medspillere(skuespiller_navn):
    conn = sqlite3.connect("src/database/TrondelagTeater.db")
    cursor = conn.cursor()
    
    #Finner først alle SKID et skuespillernavn har, den kan være flertall siden en skuespiller kan ha flere roller
    cursor.execute("SELECT SKID FROM Skuespiller WHERE navn = ?", (skuespiller_navn,))
    SKIDer = cursor.fetchall()
    akt_check = [] #Legger til alle aktnr en skuespiller har vært med i slik at den ikke tar med akten på nytt omen skuespiller har to roller i samme akt
    for skid_liste in SKIDer:
        skid = skid_liste[0]
        
    
        
        #Finner aktene til rollene en skuespiller har
        cursor.execute("""
            SELECT DISTINCT a.Nummer, ts.navn, a.AKID
            FROM DeltarIAkt AS dia
            INNER JOIN HarRolle AS hr ON dia.RID = hr.RID
            INNER JOIN HarAkt AS ha ON dia.AKID = ha.AKID
            INNER JOIN Teaterstykke AS ts ON ha.TID = ts.TID
            INNER JOIN Akt as a ON dia.AKID = a.AKID
            WHERE hr.SKID = ?
        """, (skid,))
        
        aktene_teaterstykkene = cursor.fetchall()
        akt_nummer = [akt[0] for akt in aktene_teaterstykkene]
        teaterstykke_navn = [teaterstykke[1] for teaterstykke in aktene_teaterstykkene]
        akt_id = [aid[2] for aid in aktene_teaterstykkene]

        for akt_nr, teaterstykke, akt_id in zip(akt_nummer, teaterstykke_navn, akt_id):
            if akt_nr in akt_check: #Hopper over om skuespilleren allerede har spilt i akten i en annen rolle
                continue
            #Finner skuespillere som har spilt i samme akt som valgt skuespiller
            cursor.execute("""
                SELECT DISTINCT s.navn
                FROM Skuespiller AS s
                INNER JOIN HarRolle AS hr ON s.SKID = hr.SKID
                INNER JOIN Rolle AS r ON hr.RID = r.RID
                INNER JOIN DeltarIAkt AS dia ON r.RID = dia.RID
                WHERE dia.AKID = ? AND s.navn != ?
            """, (akt_id, skuespiller_navn))    

            medspillere = cursor.fetchall() #Legger til alle medskuespillere

            akt_check.append(akt_nr) #Legger til aktnr i listen slik at skuespiller ikke kan være med i samme akt flere ganger

            #Printer ut skuespillerne som spiller i samme akt som valgt skuespiller
            print(f"\nSkuespillere som har spilt med {skuespiller_navn} i Akt {akt_nr} i Teaterstykket {teaterstykke}:\n")
            for medspiller in medspillere:
                print(f"{medspiller[0]}")

    conn.close()

#Test av funksjon
skuespiller_navn = "Emma Caroline Deichmann" 
finn_medspillere(skuespiller_navn)




