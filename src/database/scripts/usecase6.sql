-- Vi ønsker å lage et query i SQL som finner hvilke forestillinger som har solgt
-- best. Skriv ut navn på forestilling og dato og antall solgte plasser sortert på
-- antall plasser i synkende rekkefølge.

SELECT navn, dato, COUNT(BID) AS SolgtePlasser
FROM Forestillinger INNER JOIN Billett ON Forestillinger.FID = Billett.FID
WHERE FID = 3 AND 6
ORDER BY SolgtePlassser DESC;