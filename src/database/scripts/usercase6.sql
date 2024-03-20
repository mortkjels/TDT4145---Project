--Vår løsning for Usercase 6:
SELECT navn, dato, COUNT(BID) AS SolgtePlasser
FROM Forestillinger 
INNER JOIN Billetter ON Forestillinger.FID = Billetter.FID
GROUP BY navn
ORDER BY SolgtePlasser DESC;