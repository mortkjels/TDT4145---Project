-- Script til å legge til de nødvendige verdiene inn i databasen.

--Sal
INSERT INTO Sal VALUES 
(1, 524, 'Hovedscenen'),
(2, 332, 'Gamle Scene');

--Teaterstykke
INSERT INTO Teaterstykke VALUES 
(1, 'Kongsemnene'), 
(2, 'Størst av alt er kjærligheten');

--Rolle for de ulike stykkene.
INSERT INTO Rolle VALUES 
-- Rollene for Kongsemnene:
 (1, 'Haakon Haakonssønn'),
 (2, 'Inga fra Vartjeg'),
 (3, 'Skule Jarl'),
 (4, 'Fru Ragnhild'),
 (5, 'Margrete'),
 (6, 'Sigrid '),
 (7, 'Biskop Nicolas'),
 (8, 'Gregorius Jonssønn'),
 (9, 'Paal Flida'),
 (10, 'Baard Bratte'),
 (11, 'Jatgeir Skald'),
 (12, 'Peter');
 -- Ikke noen roller beskrevet i Størst av alt er kjærligheten.

 -- Ulike typer Ansatt:
 INSERT INTO Ansatt VALUES
 (1, "Fast"),
 (2, "Midlertidig"),
 (3, "Innleid"),
 (4, "Statist"),
 (5, "Frivillig");

 -- Ulike typer Oppgave:
 INSERT INTO Oppgaver VALUES
 (1, "AnsvarligDirektor"),
 (2, "Regissor"),
 (3, "ScenografiAnsvarlig"),
 (4, "MusikkOgLydAnsvarlig"),
 (5, "KostymedesignAnsvarlig"),
 (6, "Musiker"),
 (7, "Koreografi"),
 (8, "Dramaturg"),
 (9, "Sufflor");

 -- Innlegging av de ulike personene for teateret:
 INSERT INTO Person VALUES
 -- Kunsternisk Lag for Kongsemnene:
 (1, "Yury Butusov", "yurbut@tt.no"), -- Endre på AID og OpID attributter her burde være tekstrenger mtp. relasjostabell....
 (2, "Aleksandr Shishkin-hokusai", "aleshi@tt.no"),
 (3, "Eivind Myren", "eivmyr@tt.no"),
 (4, "Mina Rype Stokke", "miryst@tt.no"),
 -- Kunsternisk Lag for Størt av alt er kjærligheten
 (5, "Jonas Corell Petersen", "jocope@tt.no"),
 (6, "David Gehrt", "dage@tt.no"),
 (7, "Gaute Tønder", "gauton@tt.no"),
 (8, "Magnus Mikaelsen", "magmik@tt.no"),
 (9, "Kristoffer Spender", "krispe@tt.no");

 -- Oppkobling av verdier Person - Ansatt
 INSERT INTO AnsattSom VALUES
 -- KE
 (1, 1),
 (2, 1),
 (3, 1),
 (4, 2),
 -- SAAEK
 (5, 1),
 (6, 1),
 (7, 3),
 (8, 2),
 (9, 5);

  -- Oppkobling av verdier Person - Oppgaver
 INSERT INTO HarOppgave VALUES
 -- KE
 (1, 1),
 (2, 3),
 (3, 4),
 (4, 8),
 -- SAAEK
 (5, 1),
 (6, 3),
 (7, 6),
 (8, 4),
 (9, 8);