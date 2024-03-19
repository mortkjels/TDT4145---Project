"""
Implementere et Pythonprogram (med bruk av SQL) som tar inn
en dato og skriver ut hvilke forestillinger som finnes på denne datoen og lister
opp hvor mange billetter (dvs. stoler) som er solgt. Ta også med forestillinger
hvor det ikke er solgt noen billetter.
"""
import sqlite3

# Forutsetter at vi kjører 1. CreatingDB.sql, 2. InsertingInDB.sql og til slutt  'add_booked_seats.py' for å legge til stoler i databasen som er booka, samt all annen data i forhold til vår løsning.

# Spørring som kobler opp all dataen sammen: SELECT Forestillinger.navn AS Forestilling, Forestillinger.Dato as Dato, Forestillinger.Klokkeslett as Klokken, Sal.SalID as SalNummer, COUNT(Stol.StolNr) AS AntallBilletterSolgt FROM Forestillinger INNER JOIN ForestillingI ON Forestillinger.FID = ForestillingI.FID INNER JOIN Sal ON ForestillingI.SalID = Sal.SalID INNER JOIN Stol ON Sal.SalID = Stol.SalID WHERE Dato = '< dato >' GROUP BY Dato, Klokken, SalNummer; => finner antall billetter solgt for en spesifikk dato ('2024-02-03') finner begge.

# Definere funksjonen som tar inn en dato som input => antar at datoen er på formatet og eksisterer i databasen.
def forestilling_finder(dato: str):
    # Koble til databasen - foreløpig test.db => for testing...
    conn = sqlite3.connect('database/test.db')
    c = conn.cursor()
    # SQL-spørring: henter ut forestillinger som finnes på en spesifikk dato og lister opp hvor mange billetter (dvs. stoler) som er solgt.
    c.execute('''
              SELECT 
                Forestillinger.navn AS Forestilling, 
                Forestillinger.Dato as Dato,
                Forestillinger.Klokkeslett as Klokken,
                Sal.SalID as SalNummer,
                COUNT(Stol.StolNr) AS AntallBilletterSolgt 
              FROM Forestillinger 
              INNER JOIN ForestillingI ON Forestillinger.FID = ForestillingI.FID 
              INNER JOIN Sal ON ForestillingI.SalID = Sal.SalID 
              INNER JOIN Stol ON Sal.SalID = Stol.SalID 
              WHERE Dato = ? 
              GROUP BY Dato, Klokken, SalNummer;'''
              , (dato,))
    
    resultat = c.fetchall() # Fetcher og skriver ut resultatet av spørringen.
    if not resultat:
        return f'Ingen forestillinger funnet for {dato}'
    #Skriver ut resultatet på en 'finere' måte:
    for forestilling in resultat:
        print(f'Forestilling: {forestilling[0]}, Dato: {forestilling[1]}, Klokkeslett: {forestilling[2]}, SalNummer: {forestilling[3]}, AntallBilletterSolgt: {forestilling[4]}')
    conn.close()
    

# Tester for en dato:
forestilling_finder('2024-02-03') # Skal returnere en liste med forestillinger som finnes på denne datoen og lister opp hvor mange billetter (dvs. stoler) som er solgt.