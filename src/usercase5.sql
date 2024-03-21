--Vår løsning for Usercase 5:
SELECT DISTINCT Skuespiller.navn as SkuespillerNavn, Rolle.navn as RolleNavn, Teaterstykke.navn as TeaterstykkeNavn
FROM Teaterstykke 
INNER JOIN HarAkt ON Teaterstykke.TID = HarAkt.TID
INNER JOIN Akt ON HarAkt.AKID = Akt.AKID
INNER JOIN DeltarIAkt ON Akt.AKID = DeltarIAkt.AKID
INNER JOIN Rolle ON DeltarIAkt.RID = Rolle.RID
INNER JOIN HarRolle ON Rolle.RID = HarRolle.RID
INNER JOIN Skuespiller ON HarRolle.SKID = Skuespiller.SKID;