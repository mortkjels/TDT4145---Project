import sqlite3

# Definere funksjonen som tar inn en dato som input => antar at datoen er på formatet og eksisterer i databasen.
def forestilling_finder(dato: str):
    conn = sqlite3.connect('src/database/TrondelagTeater.db')
    c = conn.cursor()
    
    # SQL-spørring: henter ut forestillinger som finnes på en spesifikk dato og lister opp hvor mange billetter (dvs. stoler) som er solgt.
    
    c.execute('''
              SELECT 
                Forestillinger.navn AS Forestilling,
                Forestillinger.Dato AS Dato, 
                Forestillinger.Klokkeslett AS Klokken, 
                Sal.SalID AS SalNummer, 
                Sal.navn AS SalNavn, 
                COUNT(Billetter.BID) AS AntallBilletterSolgt 
              FROM 
                Forestillinger INNER JOIN ForestillingI ON Forestillinger.FID = ForestillingI.FID 
                INNER JOIN Sal ON ForestillingI.SalID = Sal.SalID 
                LEFT JOIN Billetter ON Forestillinger.FID = Billetter.FID 
              WHERE Dato = ? 
              GROUP BY Forestillinger.FID, Sal.SalID;
              '''
              , (dato,))
    
    resultat = c.fetchall() # Fetcher og skriver ut resultatet av spørringen.
    if not resultat:
         print(f"Ingen forestillinger funnet for {dato}")
    #Skriver ut resultatet på en 'finere' måte:
    for forestilling in resultat:
        print(f'''
              Forestilling: {forestilling[0]} 
              Dato: {forestilling[1]} 
              Klokken: {forestilling[2]} 
              SalNummer: {forestilling[3]} 
              SalNavn: {forestilling[4]} 
              #Solgte billetter: {forestilling[5]}
              ''')
    conn.close()

# Ønsker du å endre en parameter, kan du gjøre det her. 
forestilling_finder("2024-02-03") #Her kan du endre datoen for å se andre forestillinger for en annen dato.