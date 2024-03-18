import sqlite3

#Nødt til å inserte values for FID, BTID, og Pris i databasen først for å kunne kjøre denne funksjonen. Henter det fra DB1.sql
#FID = ForestillingsID, BTID = BillettType ID, Pris = Pris for billetten


def kjop_billetter(forestilling_id, antall_billetter):
    # Kobler til databasen
    conn = sqlite3.connect('databasenavn.db')
    cur = conn.cursor()

    # Hent informasjon om forestillingen
    cur.execute("SELECT * FROM Forestillinger WHERE FID = ?", (forestilling_id,))
    forestilling = cur.fetchone()

    # Hent informasjon om tilgjengelige seter for forestillingen
    cur.execute("SELECT COUNT(*) FROM Billetter WHERE FID = ?", (forestilling_id,))
    antall_ledige_seter = forestilling[1] * forestilling[2] - cur.fetchone()[0]

    # Sjekk om det er nok ledige seter
    if antall_billetter > antall_ledige_seter:
        print("Ikke nok ledige seter for å kjøpe", antall_billetter, "billetter.")
        return None

    # Beregn totalprisen
    cur.execute("SELECT Pris FROM BillettType WHERE BTID = ?", (1,))
    billett_pris = cur.fetchone()[0]
    total_pris = antall_billetter * billett_pris

    # Oppdater databasen med de kjøpte billettene
    for _ in range(antall_billetter):
        cur.execute("INSERT INTO Billetter (FID, BTID) VALUES (?, ?)", (forestilling_id, 1))

    # Utfører endringer og lagrer dem i databasen
    conn.commit()

    # Lukker databasetilkoblingen
    cur.close()
    conn.close()

    return total_pris

# Eksempel på bruk av funksjonen
forestilling_id = 1  # Endre dette til riktig forestillings-ID
antall_billetter = 9
total_pris = kjop_billetter(forestilling_id, antall_billetter)
print("Totalpris for", antall_billetter, "billetter:", total_pris)
