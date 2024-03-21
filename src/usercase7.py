import sqlite3

conn = sqlite3.connect("src/database/TrondelagTeater.db")
cursor = conn.cursor()
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

#Ønsker du å endre en parameter, kan du gjøre det her. 
skuespiller_navn = "Emma Caroline Deichmann" #Her kan du endre skuespilleren du vil finne medspillere til
finn_medspillere(skuespiller_navn)




