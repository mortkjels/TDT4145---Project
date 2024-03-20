
-- Script til å legge til de nødvendige verdiene inn i databasen.

--Innsetting av verdier for Sal
INSERT INTO Sal VALUES
(1, 524, 'Hovedscenen'),
(2, 332, 'Gamle Scene');
 
--Innsetting av verdier for Teaterstykke
INSERT INTO Teaterstykke VALUES
(1, 'Kongsemnene'),
(2, 'Størst av alt er kjærligheten');

--Innsetting av verdier for ulike typer Ansatt
INSERT INTO Ansatt VALUES
(1, "Fast"),
(2, "Midlertidig"),
(3, "Innleid"),
(4, "Statist"),
(5, "Frivillig");

--Innsetting av verdier for Forestillinger
--KE
INSERT INTO Forestillinger VALUES
(1, '2024-02-01', '19:00','Kongsemnene'),
(2, '2024-02-02', '19:00','Kongsemnene'),
(3, '2024-02-03', '19:00','Kongsemnene'),
(4, '2024-02-05', '19:00','Kongsemnene'),
(5, '2024-02-06', '19:00','Kongsemnene'),

--SAAEK
(6, '2024-02-03', '18:30','Størst av alt er kjærligheten'),
(7, '2024-02-06', '18:30','Størst av alt er kjærligheten'),
(8, '2024-02-07', '18:30','Størst av alt er kjærligheten'),
(9, '2024-02-12', '18:30','Størst av alt er kjærligheten'),
(10, '2024-02-13', '18:30','Størst av alt er kjærligheten'),
(11, '2024-02-14', '18:30','Størst av alt er kjærligheten');

--Innsetting av verdier for Rolle
--KE
INSERT INTO Rolle VALUES 
(1, 'Haakon Haakonssønn'),
(2, 'Inga fra Vartjeg'),
(3, 'Skule Jarl'),
(4, 'Fru Ragnhild'),
(5, 'Margrete'),
(6, 'Sigrid'),
(7, 'Biskop Nicolas'),
(8, 'Gregorius Jonssønn'),
(9, 'Paal Flida'),
(10, 'Baard Bratte'),
(11, 'Jatgeir Skald'),
(12, 'Peter'),
(13, 'Dagfinn Bonde'),
(14, 'Ingebjørg'),

--SAAEK
(15, 'Sunniva Du Mond Nordal'),
(16, 'Jo Saberniak'),
(17, 'Marte M. Steinholt'),
(18, 'Tor Ivar Hagen'),
(19, 'Trond-Ove Skrødal'),
(20, 'Natalie Grøndahl Tangen'),
(21, 'Åsmund Flaten');

--Innsetting av verdier for Skuespiller
INSERT INTO Skuespiller VALUES 
(1, 'Arturo Scotti'),
(2, 'Ingunn Beate Strige Øyen'),
(3, 'Hans Petter Nilsen'),
(4, 'Madeleine Brandtzæg Nilsen'),
(5, 'Synnøve Fossum Eriksen'),
(6, 'Emma Caroline Deichmann'),
(7, 'Thomas Jensen Takyi'),
(8, 'Per Bostad Gulliksen'),
(9, 'Isak Holmen Sørensen'),
(10, 'Fabian Heidelberg Lunde'),
(11, 'Emil Olafsson'),
(12, 'Snorre Ryen Tøndel'),
(13, 'Sunniva Du Mond Nordal'),
(14, 'Jo Saberniak'),
(15, 'Marte M. Steinholt'),
(16, 'Tor Ivar Hagen'),
(17, 'Trond-Ove Skrødal'),
(18, 'Natalie Grøndahl Tangen'),
(19, 'Åsmund Flaten'),
(20, 'Emil Olafsson'),
(21, 'Emma Caroline Deichmann');


--Innsetting av verdier for BillettType
INSERT INTO BillettType VALUES
(1, 'Ordinær',450,1),
(2, 'Student', 280,1),
(3, 'Honnør', 380,1),
(4, 'Gruppe 10', 420,1),
(5, 'Gruppe 10 Honnør', 360,1),
(6, 'Ordinær',350,2),
(7, 'Student', 220,2),
(8, 'Honnør', 300,2),
(9, 'Gruppe 10', 320,2),
(10, 'Gruppe 10 Honnør',270,2),
(11, 'Barn', 220, 2);

 --Innsetting av verdier for ulike typer Oppgaver:
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

 --Innsetting av verdier for Personer, som ikke er skuesspillere. Definert Person som en egen tabell for de som ikke er skuesspillere. 
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

 -- Innsetting av verdier av de ulike kulissene, valgt forestillinger fremfor teaterstykke på relasjon for eventuelle endringer for fremtidige forestillinger.
 -- Baserer kulisser ut ifra bildene gitt på Trøndelag Teater sin nettside.
    INSERT INTO Kulisser VALUES
    --KE
    (1, "Sverd"),
    (2, "Hest"),
    (3, "Rustning"),
    (4, "Dukke"),
    (5, "Instrument"),
    (6, "Scenerøyk"),
    (7, "Dekk"),
    (8, "Tepper"),
    (9, "Borg"),

    --SAAEK
    (10, "Stol"),
    (11, "Gitar"),
    (12, "Piano"),
    (13, "Lommelykt"),
    (14, "Flomlys"),
    (15, "Scenerøyk");

 -- Oppkobling av verdier AnsattSom
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

  -- Oppkobling av verdier HarOppgave
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

 --Oppkobling av verdier Akt
INSERT INTO Akt VALUES
--KE
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6);

--Oppkobling av verdier HarAkt, Antar at SAAEK har kun en akt, siden det ikke står noe på nettet. 
INSERT INTO HarAkt VALUES
--KE
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),

--SAAEK
(6,2);

--Oppkobling av verdier HarKulisser, antagelse om hvor mange kulisser de forskjellige har
INSERT INTO HarKulisser VALUES
--KE
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(1,8),
(1,9),

(2,1),
(2,2),
(2,3),
(2,4),
(2,5),
(2,6),
(2,7),
(2,8),
(2,9),

(3,1),
(3,2),
(3,3),
(3,4),
(3,5),
(3,6),
(3,7),
(3,8),
(3,9),

(4,1),
(4,2),
(4,3),
(4,4),
(4,5),
(4,6),
(4,7),
(4,8),
(4,9),

(5,1),
(5,2),
(5,3),
(5,4),
(5,5),
(5,6),
(5,7),
(5,8),
(5,9),

--SAAEK
(6,10),
(6,11),
(6,12),
(6,13),
(6,14),
(6,15),

(7, 10),
(7, 11),
(7, 12),
(7, 13),
(7, 14),
(7, 15),

(8, 10),
(8, 11),
(8, 12),
(8, 13),
(8, 14),
(8, 15),

(9, 10),
(9, 11),
(9, 12),
(9, 13),
(9, 14),
(9, 15),

(10, 10),
(10, 11),
(10, 12),
(10, 13),
(10, 14),
(10, 15),

(11, 10),
(11, 11),
(11, 12),
(11, 13),
(11, 14),
(11, 15);

--Oppkobling av verdier for relasjonen HarTeaterstykke
INSERT INTO HarTeaterstykke VALUES
--KE
(1,1),

--SAAEK
(2,2);

--Innsetting av verdier for HarRolle
INSERT INTO HarRolle VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(20,13),
(21,14),
(13,15),
(14,16),
(15,17),
(16,18),
(17,19),
(18,20),
(19,21);


--Innsetting av verdier for DeltarIAkt
INSERT INTO DeltarIAkt VALUES
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),

(1,2),
(3,2),

(1,3),
(2,3),
(3,3),
(4,3),
(5,3),

(1,4),
(5,4),

(1,5),
(2,5),
(3,5),
(4,5),
(5,5),

(1,6),
(2,6),
(5,6),

(1,7),
(2,7),
(3,7),

(1,8),
(2,8),
(3,8),
(4,8),
(5,8),

(1,9),
(2,9),
(3,9),
(4,9),
(5,9),

(2,10),
(4,10),

(4,11),

(3,12),
(4,12),
(5,12),

(1,13),
(2,13),
(3,13),
(4,13),
(5,13),

(4,14);

--Innsetting av verdier for Deltar
INSERT INTO Deltar VALUES
(1,1),
(2,1),
(3,1),
(4,1),
(5,2),
(6,2),
(7,2),
(8,2),
(9,2);

--Innsetting av verdier for ForestillingI
INSERT INTO ForestillingI VALUES

(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(2,6),
(2,7),
(2,8),
(2,9),
(2,10),
(2,11);


--Innsetting av verdier for HarForestilling 
INSERT INTO HarForestilling VALUES
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,2),
(7,2),
(8,2),
(9,2),
(10,2),
(11,2);

INSERT INTO Kundeprofil VALUES
(1, 'Ole Marcus Aarnes', 12345678, 'Gateadresse 123'),
(2, 'Benjamin Faerestrand', 87654321, 'Gateadresse 321'),
(3, 'Morten Kjelsrud', 12345698, 'Gateadresse 124'),
(4, 'Roger Midtstraum', 87652321, 'Gateadresse 322'),
(5, 'Svein Erik Bratsberg', 12345578, 'Gateadresse 125');

INSERT INTO TilForestilling VALUES
(1,3),
(2,3),
(3,3),
(4,3),
(5,3),
(6,3),
(7,3),
(8,3),
(9,3),
(10,3),
(11,3),
(12,3),
(13,3),
(14,3),
(15,3),
(16,3),
(17,3),
(18,3),
(19,3),
(20,3),
(21,3),
(22,3),
(23,3),
(24,3),
(25,3),
(26,3),
(27,3),
(28,3),
(29,3),
(30,3),
(31,3),
(32,3),
(33,3),
(34,3),
(35,3),
(36,3),
(37,3),
(38,3),
(39,3),
(40,3),
(41,3),
(42,3),
(43,3),
(44,3),
(45,3),
(46,3),
(47,3),
(48,3),
(49,3),
(50,3),
(51,3),
(52,3),
(53,3),
(54,3),
(55,3),
(56,3),
(57,3),
(58,3),
(59,3),
(60,3),
(61,3),
(62,3),
(63,3),
(64,3),
(65,3),
(1,6),
(2,6),
(3,6),
(4,6),
(5,6),
(6,6),
(7,6),
(8,6),
(9,6),
(10,6),
(11,6),
(12,6),
(13,6),
(14,6),
(15,6),
(16,6),
(17,6),
(18,6),
(19,6),
(20,6),
(21,6),
(22,6),
(23,6),
(24,6),
(25,6),
(26,6),
(27,6);
