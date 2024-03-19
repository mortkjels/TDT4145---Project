-- Script til å legge til de nødvendige verdiene inn i databasen.

--Setter inn verdier for de ulike tabellene;

--Innsetting av verdier for Sal
INSERT INTO Sal VALUES
(1, 524, 'Hovedscenen'),
(2, 332, 'Gamle Scene');
 
--Innsetting av verdier for Teaterstykke
INSERT INTO Teaterstykke VALUES
(1, 'Kongsemnene'),
(2, 'Størst av alt er kjærligheten');

--Innsetting av verdier for ulike typer Ansatt:
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

--Innsetting av verdier for Skuespiller, Skal vi legge til rolle id for hver skuesspiller? Skal vi legge til teaterstykke til en skuespiller?
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


--BillettType, forskjellige billetpriser for forestillinger. fremmedid mot det?
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

 -- Innlegging av de ulike personene for teateret, som ikke er skuesspillere:
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

 -- Innlegging av de ulike kulissene, valgt forestillinger fremfor teaterstykke på relasjon hvis det går i stykker.
 --Baserer kulisser ut ifra bildene gitt på Trøndelag Teater sin nettside.
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

 --Oppkobling av verdier Akt
INSERT INTO Akt VALUES
--KE
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6);

--Oppkobling av verdier HarAkt, Antar at SAEK har kun en akt, siden det ikke står noe på nettet. 
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


-- --Python?
-- INSERT INTO Billetter (BID,FID, BTID, StolID) VALUES


-- --Innsetting av verdier for Stol
-- INSERT INTO Stol (StolID, StolNR, RadNR, SalID, OmraadeNavn) VALUES
-- (1, 1, 1, 1, 'Parkett'),
-- (2, 2, 1, 1, 'Parkett'),
-- (3, 3, 1, 1, 'Parkett'),
-- (4, 4, 1, 1, 'Parkett'),
-- (5, 5, 1, 1, 'Parkett'),
-- (6, 6, 1, 1, 'Parkett'),
-- (7, 7, 1, 1, 'Parkett'),
-- (8, 8, 1, 1, 'Parkett'),
-- (9, 9, 1, 1, 'Parkett'),
-- (10, 10, 1, 1, 'Parkett'),
-- (11, 11, 1, 1, 'Parkett'),
-- (12, 12, 1, 1, 'Parkett'),
-- (13, 13, 1, 1, 'Parkett'),
-- (14, 14, 1, 1, 'Parkett'),
-- (15, 15, 1, 1, 'Parkett'),
-- (16, 16, 1, 1, 'Parkett'),
-- (17, 17, 1, 1, 'Parkett'),
-- (18, 18, 1, 1, 'Parkett'),
-- (19, 19, 1, 1, 'Parkett'),
-- (20, 20, 1, 1, 'Parkett'),
-- (21, 21, 1, 1, 'Parkett'),
-- (22, 22, 1, 1, 'Parkett'),
-- (23, 23, 1, 1, 'Parkett'),
-- (24, 24, 1, 1, 'Parkett'),
-- (25, 25, 1, 1, 'Parkett'),
-- (26, 26, 1, 1, 'Parkett'),
-- (27, 27, 1, 1, 'Parkett'),
-- (28, 28, 1, 1, 'Parkett'),
-- (29, 29, 2, 1, 'Parkett'), 
-- (30, 30, 2, 1, 'Parkett'),
-- (31, 31, 2, 1, 'Parkett'),
-- (32, 32, 2, 1, 'Parkett'),
-- (33, 33, 2, 1, 'Parkett'),
-- (34, 34, 2, 1, 'Parkett'),
-- (35, 35, 2, 1, 'Parkett'),
-- (36, 36, 2, 1, 'Parkett'),
-- (37, 37, 2, 1, 'Parkett'),
-- (38, 38, 2, 1, 'Parkett'),
-- (39, 39, 2, 1, 'Parkett'),
-- (40, 40, 2, 1, 'Parkett'),
-- (41, 41, 2, 1, 'Parkett'),
-- (42, 42, 2, 1, 'Parkett'),
-- (43, 43, 2, 1, 'Parkett'),
-- (44, 44, 2, 1, 'Parkett'),
-- (45, 45, 2, 1, 'Parkett'),
-- (46, 46, 2, 1, 'Parkett'),
-- (47, 47, 2, 1, 'Parkett'),
-- (48, 48, 2, 1, 'Parkett'),
-- (49, 49, 2, 1, 'Parkett'),
-- (50, 50, 2, 1, 'Parkett'),
-- (51, 51, 2, 1, 'Parkett'),
-- (52, 52, 2, 1, 'Parkett'),
-- (53, 53, 2, 1, 'Parkett'),
-- (54, 54, 2, 1, 'Parkett'),
-- (55, 55, 2, 1, 'Parkett'),
-- (56, 56, 2, 1, 'Parkett'),
-- (57, 57, 3, 1, 'Parkett'),
-- (58, 58, 3, 1, 'Parkett'),
-- (59, 59, 3, 1, 'Parkett'),
-- (60, 60, 3, 1, 'Parkett'),
-- (61, 61, 3, 1, 'Parkett'),
-- (62, 62, 3, 1, 'Parkett'),
-- (63, 63, 3, 1, 'Parkett'),
-- (64, 64, 3, 1, 'Parkett'),
-- (65, 65, 3, 1, 'Parkett'),
-- (66, 66, 3, 1, 'Parkett'),
-- (67, 67, 3, 1, 'Parkett'),
-- (68, 68, 3, 1, 'Parkett'),
-- (69, 69, 3, 1, 'Parkett'),
-- (70, 70, 3, 1, 'Parkett'),
-- (71, 71, 3, 1, 'Parkett'),
-- (72, 72, 3, 1, 'Parkett'),
-- (73, 73, 3, 1, 'Parkett'),
-- (74, 74, 3, 1, 'Parkett'),
-- (75, 75, 3, 1, 'Parkett'),
-- (76, 76, 3, 1, 'Parkett'),
-- (77, 77, 3, 1, 'Parkett'),
-- (78, 78, 3, 1, 'Parkett'),
-- (79, 79, 3, 1, 'Parkett'),
-- (80, 80, 3, 1, 'Parkett'),
-- (81, 81, 3, 1, 'Parkett'),
-- (82, 82, 3, 1, 'Parkett'),
-- (83, 83, 3, 1, 'Parkett'),
-- (84, 84, 3, 1, 'Parkett'),
-- (85, 85, 4, 1, 'Parkett'),
-- (86, 86, 4, 1, 'Parkett'),
-- (87, 87, 4, 1, 'Parkett'),
-- (88, 88, 4, 1, 'Parkett'),
-- (89, 89, 4, 1, 'Parkett'),
-- (90, 90, 4, 1, 'Parkett'),
-- (91, 91, 4, 1, 'Parkett'),
-- (92, 92, 4, 1, 'Parkett'),
-- (93, 93, 4, 1, 'Parkett'),
-- (94, 94, 4, 1, 'Parkett'),
-- (95, 95, 4, 1, 'Parkett'),
-- (96, 96, 4, 1, 'Parkett'),
-- (97, 97, 4, 1, 'Parkett'),
-- (98, 98, 4, 1, 'Parkett'),
-- (99, 99, 4, 1, 'Parkett'),
-- (100, 100, 4, 1, 'Parkett'),
-- (101, 101, 4, 1, 'Parkett'),
-- (102, 102, 4, 1, 'Parkett'),
-- (103, 103, 4, 1, 'Parkett'),
-- (104, 104, 4, 1, 'Parkett'),
-- (105, 105, 4, 1, 'Parkett'),
-- (106, 106, 4, 1, 'Parkett'),
-- (107, 107, 4, 1, 'Parkett'),
-- (108, 108, 4, 1, 'Parkett'),
-- (109, 109, 4, 1, 'Parkett'),
-- (110, 110, 4, 1, 'Parkett'),
-- (111, 111, 4, 1, 'Parkett'),
-- (112, 112, 4, 1, 'Parkett'),
-- (113, 113, 5, 1, 'Parkett'),
-- (114, 114, 5, 1, 'Parkett'),
-- (115, 115, 5, 1, 'Parkett'),
-- (116, 116, 5, 1, 'Parkett'),
-- (117, 117, 5, 1, 'Parkett'),
-- (118, 118, 5, 1, 'Parkett'),
-- (119, 119, 5, 1, 'Parkett'),
-- (120, 120, 5, 1, 'Parkett'),
-- (121, 121, 5, 1, 'Parkett'),
-- (122, 122, 5, 1, 'Parkett'),
-- (123, 123, 5, 1, 'Parkett'),
-- (124, 124, 5, 1, 'Parkett'),
-- (125, 125, 5, 1, 'Parkett'),
-- (126, 126, 5, 1, 'Parkett'),
-- (127, 127, 5, 1, 'Parkett'),
-- (128, 128, 5, 1, 'Parkett'),
-- (129, 129, 5, 1, 'Parkett'),
-- (130, 130, 5, 1, 'Parkett'),
-- (131, 131, 5, 1, 'Parkett'),
-- (132, 132, 5, 1, 'Parkett'),
-- (133, 133, 5, 1, 'Parkett'),
-- (134, 134, 5, 1, 'Parkett'),
-- (135, 135, 5, 1, 'Parkett'),
-- (136, 136, 5, 1, 'Parkett'),
-- (137, 137, 5, 1, 'Parkett'),
-- (138, 138, 5, 1, 'Parkett'),
-- (139, 139, 5, 1, 'Parkett'),
-- (140, 140, 5, 1, 'Parkett'),
-- (141, 141, 6, 1, 'Parkett'),
-- (142, 142, 6, 1, 'Parkett'),
-- (143, 143, 6, 1, 'Parkett'),
-- (144, 144, 6, 1, 'Parkett'),
-- (145, 145, 6, 1, 'Parkett'),
-- (146, 146, 6, 1, 'Parkett'),
-- (147, 147, 6, 1, 'Parkett'),
-- (148, 148, 6, 1, 'Parkett'),
-- (149, 149, 6, 1, 'Parkett'),
-- (150, 150, 6, 1, 'Parkett'),
-- (151, 151, 6, 1, 'Parkett'),
-- (152, 152, 6, 1, 'Parkett'),
-- (153, 153, 6, 1, 'Parkett'),
-- (154, 154, 6, 1, 'Parkett'),
-- (155, 155, 6, 1, 'Parkett'),
-- (156, 156, 6, 1, 'Parkett'),
-- (157, 157, 6, 1, 'Parkett'),
-- (158, 158, 6, 1, 'Parkett'),
-- (159, 159, 6, 1, 'Parkett'),
-- (160, 160, 6, 1, 'Parkett'),
-- (161, 161, 6, 1, 'Parkett'),
-- (162, 162, 6, 1, 'Parkett'),
-- (163, 163, 6, 1, 'Parkett'),
-- (164, 164, 6, 1, 'Parkett'),
-- (165, 165, 6, 1, 'Parkett'),
-- (166, 166, 6, 1, 'Parkett'),
-- (167, 167, 6, 1, 'Parkett'),
-- (168, 168, 6, 1, 'Parkett'),
-- (169, 169, 7, 1, 'Parkett'),
-- (170, 170, 7, 1, 'Parkett'),
-- (171, 171, 7, 1, 'Parkett'),
-- (172, 172, 7, 1, 'Parkett'),
-- (173, 173, 7, 1, 'Parkett'),
-- (174, 174, 7, 1, 'Parkett'),
-- (175, 175, 7, 1, 'Parkett'),
-- (176, 176, 7, 1, 'Parkett'),
-- (177, 177, 7, 1, 'Parkett'),
-- (178, 178, 7, 1, 'Parkett'),
-- (179, 179, 7, 1, 'Parkett'),
-- (180, 180, 7, 1, 'Parkett'),
-- (181, 181, 7, 1, 'Parkett'),
-- (182, 182, 7, 1, 'Parkett'),
-- (183, 183, 7, 1, 'Parkett'),
-- (184, 184, 7, 1, 'Parkett'),
-- (185, 185, 7, 1, 'Parkett'),
-- (186, 186, 7, 1, 'Parkett'),
-- (187, 187, 7, 1, 'Parkett'),
-- (188, 188, 7, 1, 'Parkett'),
-- (189, 189, 7, 1, 'Parkett'),
-- (190, 190, 7, 1, 'Parkett'),
-- (191, 191, 7, 1, 'Parkett'),
-- (192, 192, 7, 1, 'Parkett'),
-- (193, 193, 7, 1, 'Parkett'),
-- (194, 194, 7, 1, 'Parkett'),
-- (195, 195, 7, 1, 'Parkett'),
-- (196, 196, 7, 1, 'Parkett'),
-- (197, 197, 8, 1, 'Parkett'),
-- (198, 198, 8, 1, 'Parkett'),
-- (199, 199, 8, 1, 'Parkett'),
-- (200, 200, 8, 1, 'Parkett'),
-- (201, 201, 8, 1, 'Parkett'),
-- (202, 202, 8, 1, 'Parkett'),
-- (203, 203, 8, 1, 'Parkett'),
-- (204, 204, 8, 1, 'Parkett'),
-- (205, 205, 8, 1, 'Parkett'),
-- (206, 206, 8, 1, 'Parkett'),
-- (207, 207, 8, 1, 'Parkett'),
-- (208, 208, 8, 1, 'Parkett'),
-- (209, 209, 8, 1, 'Parkett'),
-- (210, 210, 8, 1, 'Parkett'),
-- (211, 211, 8, 1, 'Parkett'),
-- (212, 212, 8, 1, 'Parkett'),
-- (213, 213, 8, 1, 'Parkett'),
-- (214, 214, 8, 1, 'Parkett'),
-- (215, 215, 8, 1, 'Parkett'),
-- (216, 216, 8, 1, 'Parkett'),
-- (217, 217, 8, 1, 'Parkett'),
-- (218, 218, 8, 1, 'Parkett'),
-- (219, 219, 8, 1, 'Parkett'),
-- (220, 220, 8, 1, 'Parkett'),
-- (221, 221, 8, 1, 'Parkett'),
-- (222, 222, 8, 1, 'Parkett'),
-- (223, 223, 8, 1, 'Parkett'),
-- (224, 224, 8, 1, 'Parkett'),
-- (225, 225, 9, 1, 'Parkett'),
-- (226, 226, 9, 1, 'Parkett'),
-- (227, 227, 9, 1, 'Parkett'),
-- (228, 228, 9, 1, 'Parkett'),
-- (229, 229, 9, 1, 'Parkett'),
-- (230, 230, 9, 1, 'Parkett'),
-- (231, 231, 9, 1, 'Parkett'),
-- (232, 232, 9, 1, 'Parkett'),
-- (233, 233, 9, 1, 'Parkett'),
-- (234, 234, 9, 1, 'Parkett'),
-- (235, 235, 9, 1, 'Parkett'),
-- (236, 236, 9, 1, 'Parkett'),
-- (237, 237, 9, 1, 'Parkett'),
-- (238, 238, 9, 1, 'Parkett'),
-- (239, 239, 9, 1, 'Parkett'),
-- (240, 240, 9, 1, 'Parkett'),
-- (241, 241, 9, 1, 'Parkett'),
-- (242, 242, 9, 1, 'Parkett'),
-- (243, 243, 9, 1, 'Parkett'),
-- (244, 244, 9, 1, 'Parkett'),
-- (245, 245, 9, 1, 'Parkett'),
-- (246, 246, 9, 1, 'Parkett'),
-- (247, 247, 9, 1, 'Parkett'),
-- (248, 248, 9, 1, 'Parkett'),
-- (249, 249, 9, 1, 'Parkett'),
-- (250, 250, 9, 1, 'Parkett'),
-- (251, 251, 9, 1, 'Parkett'),
-- (252, 252, 9, 1, 'Parkett'),
-- (253, 253, 10, 1, 'Parkett'),
-- (254, 254, 10, 1, 'Parkett'),
-- (255, 255, 10, 1, 'Parkett'),
-- (256, 256, 10, 1, 'Parkett'),
-- (257, 257, 10, 1, 'Parkett'),
-- (258, 258, 10, 1, 'Parkett'),
-- (259, 259, 10, 1, 'Parkett'),
-- (260, 260, 10, 1, 'Parkett'),
-- (261, 261, 10, 1, 'Parkett'),
-- (262, 262, 10, 1, 'Parkett'),
-- (263, 263, 10, 1, 'Parkett'),
-- (264, 264, 10, 1, 'Parkett'),
-- (265, 265, 10, 1, 'Parkett'),
-- (266, 266, 10, 1, 'Parkett'),
-- (267, 267, 10, 1, 'Parkett'),
-- (268, 268, 10, 1, 'Parkett'),
-- (269, 269, 10, 1, 'Parkett'),
-- (270, 270, 10, 1, 'Parkett'),
-- (271, 271, 10, 1, 'Parkett'),
-- (272, 272, 10, 1, 'Parkett'),
-- (273, 273, 10, 1, 'Parkett'),
-- (274, 274, 10, 1, 'Parkett'),
-- (275, 275, 10, 1, 'Parkett'),
-- (276, 276, 10, 1, 'Parkett'),
-- (277, 277, 10, 1, 'Parkett'),
-- (278, 278, 10, 1, 'Parkett'),
-- (279, 279, 10, 1, 'Parkett'),
-- (280, 280, 10, 1, 'Parkett'),
-- (281, 281, 11, 1, 'Parkett'),
-- (282, 282, 11, 1, 'Parkett'),
-- (283, 283, 11, 1, 'Parkett'),
-- (284, 284, 11, 1, 'Parkett'),
-- (285, 285, 11, 1, 'Parkett'),
-- (286, 286, 11, 1, 'Parkett'),
-- (287, 287, 11, 1, 'Parkett'),
-- (288, 288, 11, 1, 'Parkett'),
-- (289, 289, 11, 1, 'Parkett'),
-- (290, 290, 11, 1, 'Parkett'),
-- (291, 291, 11, 1, 'Parkett'),
-- (292, 292, 11, 1, 'Parkett'),
-- (293, 293, 11, 1, 'Parkett'),
-- (294, 294, 11, 1, 'Parkett'),
-- (295, 295, 11, 1, 'Parkett'),
-- (296, 296, 11, 1, 'Parkett'),
-- (297, 297, 11, 1, 'Parkett'),
-- (298, 298, 11, 1, 'Parkett'),
-- (299, 299, 11, 1, 'Parkett'),
-- (300, 300, 11, 1, 'Parkett'),
-- (301, 301, 11, 1, 'Parkett'),
-- (302, 302, 11, 1, 'Parkett'),
-- (303, 303, 11, 1, 'Parkett'),
-- (304, 304, 11, 1, 'Parkett'),
-- (305, 305, 11, 1, 'Parkett'),
-- (306, 306, 11, 1, 'Parkett'),
-- (307, 307, 11, 1, 'Parkett'),
-- (308, 308, 11, 1, 'Parkett'),
-- (309, 309, 12, 1, 'Parkett'),
-- (310, 310, 12, 1, 'Parkett'),
-- (311, 311, 12, 1, 'Parkett'),
-- (312, 312, 12, 1, 'Parkett'),
-- (313, 313, 12, 1, 'Parkett'),
-- (314, 314, 12, 1, 'Parkett'),
-- (315, 315, 12, 1, 'Parkett'),
-- (316, 316, 12, 1, 'Parkett'),
-- (317, 317, 12, 1, 'Parkett'),
-- (318, 318, 12, 1, 'Parkett'),
-- (319, 319, 12, 1, 'Parkett'),
-- (320, 320, 12, 1, 'Parkett'),
-- (321, 321, 12, 1, 'Parkett'),
-- (322, 322, 12, 1, 'Parkett'),
-- (323, 323, 12, 1, 'Parkett'),
-- (324, 324, 12, 1, 'Parkett'),
-- (325, 325, 12, 1, 'Parkett'),
-- (326, 326, 12, 1, 'Parkett'),
-- (327, 327, 12, 1, 'Parkett'),
-- (328, 328, 12, 1, 'Parkett'),
-- (329, 329, 12, 1, 'Parkett'),
-- (330, 330, 12, 1, 'Parkett'),
-- (331, 331, 12, 1, 'Parkett'),
-- (332, 332, 12, 1, 'Parkett'),
-- (333, 333, 12, 1, 'Parkett'),
-- (334, 334, 12, 1, 'Parkett'),
-- (335, 335, 12, 1, 'Parkett'),
-- (336, 336, 12, 1, 'Parkett'),
-- (337, 337, 12, 1, 'Parkett'),
-- (338, 338, 13, 1, 'Parkett'),
-- (339, 339, 13, 1, 'Parkett'),
-- (340, 340, 13, 1, 'Parkett'),
-- (341, 341, 13, 1, 'Parkett'),
-- (342, 342, 13, 1, 'Parkett'),
-- (343, 343, 13, 1, 'Parkett'),
-- (344, 344, 13, 1, 'Parkett'),
-- (345, 345, 13, 1, 'Parkett'),
-- (346, 346, 13, 1, 'Parkett'),
-- (347, 347, 13, 1, 'Parkett'),
-- (348, 348, 13, 1, 'Parkett'),
-- (349, 349, 13, 1, 'Parkett'),
-- (350, 350, 13, 1, 'Parkett'),
-- (351, 351, 13, 1, 'Parkett'),
-- (352, 352, 13, 1, 'Parkett'),
-- (353, 353, 13, 1, 'Parkett'),
-- (354, 354, 13, 1, 'Parkett'),
-- (355, 355, 13, 1, 'Parkett'),
-- (356, 356, 13, 1, 'Parkett'),
-- (357, 357, 13, 1, 'Parkett'),
-- (358, 358, 13, 1, 'Parkett'),
-- (359, 359, 13, 1, 'Parkett'),
-- (360, 360, 13, 1, 'Parkett'),
-- (361, 361, 13, 1, 'Parkett'),
-- (362, 362, 13, 1, 'Parkett'),
-- (363, 363, 13, 1, 'Parkett'),
-- (364, 364, 13, 1, 'Parkett'),
-- (365, 365, 13, 1, 'Parkett'),
-- (366, 366, 13, 1, 'Parkett'),
-- (367, 367, 13, 1, 'Parkett'),
-- (368, 368, 14, 1, 'Parkett'),
-- (369, 369, 14, 1, 'Parkett'),
-- (370, 370, 14, 1, 'Parkett'),
-- (371, 371, 14, 1, 'Parkett'),
-- (372, 372, 14, 1, 'Parkett'),
-- (373, 373, 14, 1, 'Parkett'),
-- (374, 374, 14, 1, 'Parkett'),
-- (375, 375, 14, 1, 'Parkett'),
-- (376, 376, 14, 1, 'Parkett'),
-- (377, 377, 14, 1, 'Parkett'),
-- (378, 378, 14, 1, 'Parkett'),
-- (379, 379, 14, 1, 'Parkett'),
-- (380, 380, 14, 1, 'Parkett'),
-- (381, 381, 14, 1, 'Parkett'),
-- (382, 382, 14, 1, 'Parkett'),
-- (383, 383, 14, 1, 'Parkett'),
-- (384, 384, 14, 1, 'Parkett'),
-- (385, 385, 14, 1, 'Parkett'),
-- (386, 386, 14, 1, 'Parkett'),
-- (387, 387, 14, 1, 'Parkett'),
-- (388, 388, 14, 1, 'Parkett'),
-- (389, 389, 14, 1, 'Parkett'),
-- (390, 390, 14, 1, 'Parkett'),
-- (391, 391, 14, 1, 'Parkett'),
-- (392, 392, 14, 1, 'Parkett'),
-- (393, 393, 14, 1, 'Parkett'),
-- (394, 394, 14, 1, 'Parkett'),
-- (395, 395, 14, 1, 'Parkett'),
-- (396, 396, 14, 1, 'Parkett'),
-- (397, 397, 14, 1, 'Parkett'),
-- (398, 398, 14, 1, 'Parkett'),
-- (399, 399, 15, 1, 'Parkett'),
-- (400, 400, 15, 1, 'Parkett'),
-- (401, 401, 15, 1, 'Parkett'),
-- (402, 402, 15, 1, 'Parkett'),
-- (403, 403, 15, 1, 'Parkett'),
-- (404, 404, 15, 1, 'Parkett'),
-- (405, 405, 15, 1, 'Parkett'),
-- (406, 406, 15, 1, 'Parkett'),
-- (407, 407, 15, 1, 'Parkett'),
-- (408, 408, 15, 1, 'Parkett'),
-- (409, 409, 15, 1, 'Parkett'),
-- (410, 410, 15, 1, 'Parkett'),
-- (411, 411, 15, 1, 'Parkett'),
-- (412, 412, 15, 1, 'Parkett'),
-- (413, 413, 15, 1, 'Parkett'),
-- (414, 414, 15, 1, 'Parkett'),
-- (415, 415, 15, 1, 'Parkett'),
-- (416, 416, 15, 1, 'Parkett'),
-- (417, 417, 15, 1, 'Parkett'),
-- (418, 418, 15, 1, 'Parkett'),
-- (419, 419, 15, 1, 'Parkett'),
-- (420, 420, 15, 1, 'Parkett'),
-- (421, 421, 15, 1, 'Parkett'),
-- (422, 422, 15, 1, 'Parkett'),
-- (423, 423, 15, 1, 'Parkett'),
-- (424, 424, 15, 1, 'Parkett'),
-- (425, 425, 15, 1, 'Parkett'),
-- (426, 426, 15, 1, 'Parkett'),
-- (427, 427, 15, 1, 'Parkett'),
-- (428, 428, 15, 1, 'Parkett'),
-- (429, 429, 16, 1, 'Parkett'),
-- (430, 430, 16, 1, 'Parkett'),
-- (431, 431, 16, 1, 'Parkett'),
-- (432, 432, 16, 1, 'Parkett'),
-- (433, 433, 16, 1, 'Parkett'),
-- (434, 434, 16, 1, 'Parkett'),
-- (435, 435, 16, 1, 'Parkett'),
-- (436, 436, 16, 1, 'Parkett'),
-- (437, 437, 16, 1, 'Parkett'),
-- (438, 438, 16, 1, 'Parkett'),
-- (439, 439, 16, 1, 'Parkett'),
-- (440, 440, 16, 1, 'Parkett'),
-- (441, 441, 16, 1, 'Parkett'),
-- (442, 442, 16, 1, 'Parkett'),
-- (443, 443, 16, 1, 'Parkett'),
-- (444, 444, 16, 1, 'Parkett'),
-- (445, 445, 16, 1, 'Parkett'),
-- (446, 446, 16, 1, 'Parkett'),
-- (447, 447, 16, 1, 'Parkett'),
-- (448, 448, 16, 1, 'Parkett'),
-- (449, 449, 17, 1, 'Parkett'),
-- (450, 450, 17, 1, 'Parkett'),
-- (451, 451, 17, 1, 'Parkett'),
-- (452, 452, 17, 1, 'Parkett'),
-- (453, 453, 17, 1, 'Parkett'),
-- (454, 454, 17, 1, 'Parkett'),
-- (455, 455, 17, 1, 'Parkett'),
-- (456, 456, 17, 1, 'Parkett'),
-- (457, 457, 17, 1, 'Parkett'),
-- (458, 458, 17, 1, 'Parkett'),
-- (459, 459, 17, 1, 'Parkett'),
-- (460, 460, 17, 1, 'Parkett'),
-- (461, 461, 17, 1, 'Parkett'),
-- (462, 462, 17, 1, 'Parkett'),
-- (463, 463, 17, 1, 'Parkett'),
-- (464, 464, 17, 1, 'Parkett'),
-- (465, 465, 17, 1, 'Parkett'),
-- (466, 466, 17, 1, 'Parkett'),
-- (471, 471, 17, 1, 'Parkett'),
-- (472, 472, 17, 1, 'Parkett'),
-- (473, 473, 17, 1, 'Parkett'),
-- (474, 474, 17, 1, 'Parkett'),
-- (475, 475, 17, 1, 'Parkett'),
-- (476, 476, 17, 1, 'Parkett'),
-- (477, 477, 18, 1, 'Parkett'),
-- (478, 478, 18, 1, 'Parkett'),
-- (479, 479, 18, 1, 'Parkett'),
-- (480, 480, 18, 1, 'Parkett'),
-- (481, 481, 18, 1, 'Parkett'),
-- (482, 482, 18, 1, 'Parkett'),
-- (483, 483, 18, 1, 'Parkett'),
-- (484, 484, 18, 1, 'Parkett'),
-- (485, 485, 18, 1, 'Parkett'),
-- (486, 486, 18, 1, 'Parkett'),
-- (487, 487, 18, 1, 'Parkett'),
-- (488, 488, 18, 1, 'Parkett'),
-- (489, 489, 18, 1, 'Parkett'),
-- (490, 490, 18, 1, 'Parkett'),
-- (491, 491, 18, 1, 'Parkett'),
-- (492, 492, 18, 1, 'Parkett'),
-- (493, 493, 18, 1, 'Parkett'),
-- (494, 494, 18, 1, 'Parkett'),
-- (499, 499, 18, 1, 'Parkett'),
-- (500, 500, 18, 1, 'Parkett'),
-- (501, 501, 18, 1, 'Parkett'),
-- (502, 502, 18, 1, 'Parkett'),
-- (503, 503, 18, 1, 'Parkett'),
-- (504, 504, 18, 1, 'Parkett'),

-- (505, 505, 1, 1, 'Galleri'),
-- (506, 506, 1, 1, 'Galleri'),
-- (507, 507, 1, 1, 'Galleri'),
-- (508, 508, 1, 1, 'Galleri'),
-- (509, 509, 1, 1, 'Galleri'),
-- (510, 510, 2, 1, 'Galleri'),
-- (511, 511, 2, 1, 'Galleri'),
-- (512, 512, 2, 1, 'Galleri'),
-- (513, 513, 2, 1, 'Galleri'),
-- (514, 514, 2, 1, 'Galleri'),
-- (515, 515, 3, 1, 'Galleri'),
-- (516, 516, 3, 1, 'Galleri'),
-- (517, 517, 3, 1, 'Galleri'),
-- (518, 518, 3, 1, 'Galleri'),
-- (519, 519, 3, 1, 'Galleri'),
-- (520, 520, 4, 1, 'Galleri'),
-- (521, 521, 4, 1, 'Galleri'),
-- (522, 522, 4, 1, 'Galleri'),
-- (523, 523, 4, 1, 'Galleri'),
-- (524, 524, 4, 1, 'Galleri'),

-- (1, 1, 1, 2, 'Parkett'),
-- (2, 2, 1, 2, 'Parkett'),
-- (3, 3, 1, 2, 'Parkett'),
-- (4, 4, 1, 2, 'Parkett'),
-- (5, 5, 1, 2, 'Parkett'),
-- (6, 6, 1, 2, 'Parkett'),
-- (7, 7, 1, 2, 'Parkett'),
-- (8, 8, 1, 2, 'Parkett'),
-- (9, 9, 1, 2, 'Parkett'),
-- (10, 10, 1, 2, 'Parkett'),
-- (11, 11, 1, 2, 'Parkett'),
-- (12, 12, 1, 2, 'Parkett'),
-- (13, 13, 1, 2, 'Parkett'),
-- (14, 14, 1, 2, 'Parkett'),
-- (15, 15, 1, 2, 'Parkett'),
-- (16, 16, 1, 2, 'Parkett'),
-- (17, 17, 1, 2, 'Parkett'),
-- (18, 18, 1, 2, 'Parkett'),
-- (19, 1, 2, 2, 'Parkett'),
-- (20, 2, 2, 2, 'Parkett'),
-- (21, 3, 2, 2, 'Parkett'),
-- (22, 4, 2, 2, 'Parkett'),
-- (23, 5, 2, 2, 'Parkett'),
-- (24, 6, 2, 2, 'Parkett'),
-- (25, 7, 2, 2, 'Parkett'),
-- (26, 8, 2, 2, 'Parkett'),
-- (27, 9, 2, 2, 'Parkett'),
-- (28, 10, 2, 2, 'Parkett'),
-- (29, 11, 2, 2, 'Parkett'),
-- (30, 12, 2, 2, 'Parkett'),
-- (31, 13, 2, 2, 'Parkett'),
-- (32, 14, 2, 2, 'Parkett'),
-- (33, 15, 2, 2, 'Parkett'),
-- (34, 16, 2, 2, 'Parkett'),
-- (35, 1, 3, 2, 'Parkett'),
-- (36, 2, 3, 2, 'Parkett'),
-- (37, 3, 3, 2, 'Parkett'),
-- (38, 4, 3, 2, 'Parkett'),
-- (39, 5, 3, 2, 'Parkett'),
-- (40, 6, 3, 2, 'Parkett'),
-- (41, 7, 3, 2, 'Parkett'),
-- (42, 8, 3, 2, 'Parkett'),
-- (43, 9, 3, 2, 'Parkett'),
-- (44, 10, 3, 2, 'Parkett'),
-- (45, 11, 3, 2, 'Parkett'),
-- (46, 12, 3, 2, 'Parkett'),
-- (47, 13, 3, 2, 'Parkett'),
-- (48, 14, 3, 2, 'Parkett'),
-- (49, 15, 3, 2, 'Parkett'),
-- (50, 16, 3, 2, 'Parkett'),
-- (51, 17, 3, 2, 'Parkett'),
-- (52, 1, 4, 2, 'Parkett'),
-- (53, 2, 4, 2, 'Parkett'),
-- (54, 3, 4, 2, 'Parkett'),
-- (55, 4, 4, 2, 'Parkett'),
-- (56, 5, 4, 2, 'Parkett'),
-- (57, 6, 4, 2, 'Parkett'),
-- (58, 7, 4, 2, 'Parkett'),
-- (59, 8, 4, 2, 'Parkett'),
-- (60, 9, 4, 2, 'Parkett'),
-- (61, 10, 4, 2, 'Parkett'),
-- (62, 11, 4, 2, 'Parkett'),
-- (63, 12, 4, 2, 'Parkett'),
-- (64, 13, 4, 2, 'Parkett'),
-- (65, 14, 4, 2, 'Parkett'),
-- (66, 15, 4, 2, 'Parkett'),
-- (67, 16, 4, 2, 'Parkett'),
-- (68, 17, 4, 2, 'Parkett'),
-- (69, 18, 4, 2, 'Parkett'),
-- (70, 1, 5, 2, 'Parkett'),
-- (71, 2, 5, 2, 'Parkett'),
-- (72, 3, 5, 2, 'Parkett'),
-- (73, 4, 5, 2, 'Parkett'),
-- (74, 5, 5, 2, 'Parkett'),
-- (75, 6, 5, 2, 'Parkett'),
-- (76, 7, 5, 2, 'Parkett'),
-- (77, 8, 5, 2, 'Parkett'),
-- (78, 9, 5, 2, 'Parkett'),
-- (79, 10, 5, 2, 'Parkett'),
-- (80, 11, 5, 2, 'Parkett'),
-- (81, 12, 5, 2, 'Parkett'),
-- (82, 13, 5, 2, 'Parkett'),
-- (83, 14, 5, 2, 'Parkett'),
-- (84, 15, 5, 2, 'Parkett'),
-- (85, 16, 5, 2, 'Parkett'),
-- (86, 17, 5, 2, 'Parkett'),
-- (87, 18, 5, 2, 'Parkett'),
-- (88, 1, 6, 2, 'Parkett'),
-- (89, 2, 6, 2, 'Parkett'),
-- (90, 3, 6, 2, 'Parkett'),
-- (91, 4, 6, 2, 'Parkett'),
-- (92, 5, 6, 2, 'Parkett'),
-- (93, 6, 6, 2, 'Parkett'),
-- (94, 7, 6, 2, 'Parkett'),
-- (95, 8, 6, 2, 'Parkett'),
-- (96, 9, 6, 2, 'Parkett'),
-- (97, 10, 6, 2, 'Parkett'),
-- (98, 11, 6, 2, 'Parkett'),
-- (99, 12, 6, 2, 'Parkett'),
-- (100, 13, 6, 2, 'Parkett'),
-- (101, 14, 6, 2, 'Parkett'),
-- (102, 15, 6, 2, 'Parkett'),
-- (103, 16, 6, 2, 'Parkett'),
-- (104, 17, 6, 2, 'Parkett'),
-- (105, 1, 7, 2, 'Parkett'),
-- (106, 2, 7, 2, 'Parkett'),
-- (107, 3, 7, 2, 'Parkett'),
-- (108, 4, 7, 2, 'Parkett'),
-- (109, 5, 7, 2, 'Parkett'),
-- (110, 6, 7, 2, 'Parkett'),
-- (111, 7, 7, 2, 'Parkett'),
-- (112, 8, 7, 2, 'Parkett'),
-- (113, 9, 7, 2, 'Parkett'),
-- (114, 10, 7, 2, 'Parkett'),
-- (115, 11, 7, 2, 'Parkett'),
-- (116, 12, 7, 2, 'Parkett'),
-- (117, 13, 7, 2, 'Parkett'),
-- (118, 14, 7, 2, 'Parkett'),
-- (119, 15, 7, 2, 'Parkett'),
-- (120, 16, 7, 2, 'Parkett'),
-- (121, 17, 7, 2, 'Parkett'),
-- (122, 18, 7, 2, 'Parkett'),
-- (123, 1, 8, 2, 'Parkett'),
-- (124, 2, 8, 2, 'Parkett'),
-- (125, 3, 8, 2, 'Parkett'),
-- (126, 4, 8, 2, 'Parkett'),
-- (127, 5, 8, 2, 'Parkett'),
-- (128, 6, 8, 2, 'Parkett'),
-- (129, 7, 8, 2, 'Parkett'),
-- (130, 8, 8, 2, 'Parkett'),
-- (131, 9, 8, 2, 'Parkett'),
-- (132, 10, 8, 2, 'Parkett'),
-- (133, 11, 8, 2, 'Parkett'),
-- (134, 12, 8, 2, 'Parkett'),
-- (135, 13, 8, 2, 'Parkett'),
-- (136, 14, 8, 2, 'Parkett'),
-- (137, 15, 8, 2, 'Parkett'),
-- (138, 16, 8, 2, 'Parkett'),
-- (139, 17, 8, 2, 'Parkett'),
-- (140, 1, 9, 2, 'Parkett'),
-- (141, 2, 9, 2, 'Parkett'),
-- (142, 3, 9, 2, 'Parkett'),
-- (143, 4, 9, 2, 'Parkett'),
-- (144, 5, 9, 2, 'Parkett'),
-- (145, 6, 9, 2, 'Parkett'),
-- (146, 7, 9, 2, 'Parkett'),
-- (147, 8, 9, 2, 'Parkett'),
-- (148, 9, 9, 2, 'Parkett'),
-- (149, 10, 9, 2, 'Parkett'),
-- (150, 11, 9, 2, 'Parkett'),
-- (151, 12, 9, 2, 'Parkett'),
-- (152, 13, 9, 2, 'Parkett'),
-- (153, 14, 9, 2, 'Parkett'),
-- (154, 15, 9, 2, 'Parkett'),
-- (155, 16, 9, 2, 'Parkett'),
-- (156, 17, 9, 2, 'Parkett'),
-- (157, 1, 10, 2, 'Parkett'),
-- (158, 2, 10, 2, 'Parkett'),
-- (159, 3, 10, 2, 'Parkett'),
-- (160, 4, 10, 2, 'Parkett'),
-- (161, 5, 10, 2, 'Parkett'),
-- (162, 6, 10, 2, 'Parkett'),
-- (163, 7, 10, 2, 'Parkett'),
-- (164, 8, 10, 2, 'Parkett'),
-- (165, 9, 10, 2, 'Parkett'),
-- (166, 10, 10, 2, 'Parkett'),
-- (167, 11, 10, 2, 'Parkett'),
-- (168, 12, 10, 2, 'Parkett'),
-- (169, 13, 10, 2, 'Parkett'),
-- (170, 14, 10, 2, 'Parkett'),

-- (171, 1, 1, 2, 'Balkong'),
-- (172, 2, 1, 2, 'Balkong'),
-- (173, 3, 1, 2, 'Balkong'),
-- (174, 4, 1, 2, 'Balkong'),
-- (175, 5, 1, 2, 'Balkong'),
-- (176, 6, 1, 2, 'Balkong'),
-- (177, 7, 1, 2, 'Balkong'),
-- (178, 8, 1, 2, 'Balkong'),
-- (179, 9, 1, 2, 'Balkong'),
-- (180, 10, 1, 2, 'Balkong'),
-- (181, 11, 1, 2, 'Balkong'),
-- (182, 12, 1, 2, 'Balkong'),
-- (183, 13, 1, 2, 'Balkong'),
-- (184, 14, 1, 2, 'Balkong'),
-- (185, 15, 1, 2, 'Balkong'),
-- (186, 16, 1, 2, 'Balkong'),
-- (187, 17, 1, 2, 'Balkong'),
-- (188, 18, 1, 2, 'Balkong'),
-- (189, 19, 1, 2, 'Balkong'),
-- (190, 20, 1, 2, 'Balkong'),
-- (191, 21, 1, 2, 'Balkong'),
-- (192, 22, 1, 2, 'Balkong'),
-- (193, 23, 1, 2, 'Balkong'),
-- (194, 24, 1, 2, 'Balkong'),
-- (195, 25, 1, 2, 'Balkong'),
-- (196, 26, 1, 2, 'Balkong'),
-- (197, 27, 1, 2, 'Balkong'),
-- (198, 28, 1, 2, 'Balkong'),
-- (199, 1, 2, 2, 'Balkong'),
-- (200, 2, 2, 2, 'Balkong'),
-- (201, 3, 2, 2, 'Balkong'),
-- (202, 4, 2, 2, 'Balkong'),
-- (203, 5, 2, 2, 'Balkong'),
-- (204, 6, 2, 2, 'Balkong'),
-- (205, 7, 2, 2, 'Balkong'),
-- (206, 8, 2, 2, 'Balkong'),
-- (207, 9, 2, 2, 'Balkong'),
-- (208, 10, 2, 2, 'Balkong'),
-- (209, 11, 2, 2, 'Balkong'),
-- (210, 12, 2, 2, 'Balkong'),
-- (211, 13, 2, 2, 'Balkong'),
-- (212, 14, 2, 2, 'Balkong'),
-- (213, 15, 2, 2, 'Balkong'),
-- (214, 16, 2, 2, 'Balkong'),
-- (215, 17, 2, 2, 'Balkong'),
-- (216, 18, 2, 2, 'Balkong'),
-- (217, 19, 2, 2, 'Balkong'),
-- (218, 20, 2, 2, 'Balkong'),
-- (219, 21, 2, 2, 'Balkong'),
-- (220, 22, 2, 2, 'Balkong'),
-- (221, 23, 2, 2, 'Balkong'),
-- (222, 24, 2, 2, 'Balkong'),
-- (223, 25, 2, 2, 'Balkong'),
-- (224, 26, 2, 2, 'Balkong'),
-- (225, 27, 2, 2, 'Balkong'),
-- (226, 1, 3, 2, 'Balkong'),
-- (227, 2, 3, 2, 'Balkong'),
-- (228, 3, 3, 2, 'Balkong'),
-- (229, 4, 3, 2, 'Balkong'),
-- (230, 5, 3, 2, 'Balkong'),
-- (231, 6, 3, 2, 'Balkong'),
-- (232, 7, 3, 2, 'Balkong'),
-- (233, 8, 3, 2, 'Balkong'),
-- (234, 9, 3, 2, 'Balkong'),
-- (235, 10, 3, 2, 'Balkong'),
-- (236, 11, 3, 2, 'Balkong'),
-- (237, 12, 3, 2, 'Balkong'),
-- (238, 13, 3, 2, 'Balkong'),
-- (239, 14, 3, 2, 'Balkong'),
-- (240, 15, 3, 2, 'Balkong'),
-- (241, 16, 3, 2, 'Balkong'),
-- (242, 17, 3, 2, 'Balkong'),
-- (243, 18, 3, 2, 'Balkong'),
-- (244, 19, 3, 2, 'Balkong'),
-- (245, 20, 3, 2, 'Balkong'),
-- (246, 21, 3, 2, 'Balkong'),
-- (247, 22, 3, 2, 'Balkong'),
-- (248, 1, 4, 2, 'Balkong'),
-- (249, 2, 4, 2, 'Balkong'),
-- (250, 3, 4, 2, 'Balkong'),
-- (251, 4, 4, 2, 'Balkong'),
-- (252, 5, 4, 2, 'Balkong'),
-- (253, 6, 4, 2, 'Balkong'),
-- (254, 7, 4, 2, 'Balkong'),
-- (255, 8, 4, 2, 'Balkong'),
-- (256, 9, 4, 2, 'Balkong'),
-- (257, 10, 4, 2, 'Balkong'),
-- (258, 11, 4, 2, 'Balkong'),
-- (259, 12, 4, 2, 'Balkong'),
-- (260, 13, 4, 2, 'Balkong'),
-- (261, 14, 4, 2, 'Balkong'),
-- (262, 15, 4, 2, 'Balkong'),
-- (263, 16, 4, 2, 'Balkong'),
-- (264, 17, 4, 2, 'Balkong'),

-- (265, 1, 1, 2, 'Galleri'),
-- (266, 2, 1, 2, 'Galleri'),
-- (267, 3, 1, 2, 'Galleri'),
-- (268, 4, 1, 2, 'Galleri'),
-- (269, 5, 1, 2, 'Galleri'),
-- (270, 6, 1, 2, 'Galleri'),
-- (271, 7, 1, 2, 'Galleri'),
-- (272, 8, 1, 2, 'Galleri'),
-- (273, 9, 1, 2, 'Galleri'),
-- (274, 10, 1, 2, 'Galleri'),
-- (275, 11, 1, 2, 'Galleri'),
-- (276, 12, 1, 2, 'Galleri'),
-- (277, 13, 1, 2, 'Galleri'),
-- (278, 14, 1, 2, 'Galleri'),
-- (279, 15, 1, 2, 'Galleri'),
-- (280, 16, 1, 2, 'Galleri'),
-- (281, 17, 1, 2, 'Galleri'),
-- (282, 18, 1, 2, 'Galleri'),
-- (283, 19, 1, 2, 'Galleri'),
-- (284, 20, 1, 2, 'Galleri'),
-- (285, 21, 1, 2, 'Galleri'),
-- (286, 22, 1, 2, 'Galleri'),
-- (287, 23, 1, 2, 'Galleri'),
-- (288, 24, 1, 2, 'Galleri'),
-- (289, 25, 1, 2, 'Galleri'),
-- (290, 26, 1, 2, 'Galleri'),
-- (291, 27, 1, 2, 'Galleri'),
-- (292, 28, 1, 2, 'Galleri'),
-- (293, 29, 1, 2, 'Galleri'),
-- (294, 30, 1, 2, 'Galleri'),
-- (295, 31, 1, 2, 'Galleri'),
-- (296, 32, 1, 2, 'Galleri'),
-- (297, 33, 1, 2, 'Galleri'),
-- (298, 1, 2, 2, 'Galleri'),
-- (299, 2, 2, 2, 'Galleri'),
-- (300, 3, 2, 2, 'Galleri'),
-- (301, 4, 2, 2, 'Galleri'),
-- (302, 5, 2, 2, 'Galleri'),
-- (303, 6, 2, 2, 'Galleri'),
-- (304, 7, 2, 2, 'Galleri'),
-- (305, 8, 2, 2, 'Galleri'),
-- (306, 9, 2, 2, 'Galleri'),
-- (307, 10, 2, 2, 'Galleri'),
-- (308, 11, 2, 2, 'Galleri'),
-- (309, 12, 2, 2, 'Galleri'),
-- (310, 13, 2, 2, 'Galleri'),
-- (311, 14, 2, 2, 'Galleri'),
-- (312, 15, 2, 2, 'Galleri'),
-- (313, 16, 2, 2, 'Galleri'),
-- (314, 17, 2, 2, 'Galleri'),
-- (315, 18, 2, 2, 'Galleri'),
-- (316, 1, 3, 2, 'Galleri'),
-- (317, 2, 3, 2, 'Galleri'),
-- (318, 3, 3, 2, 'Galleri'),
-- (319, 4, 3, 2, 'Galleri'),
-- (320, 5, 3, 2, 'Galleri'),
-- (321, 6, 3, 2, 'Galleri'),
-- (322, 7, 3, 2, 'Galleri'),
-- (323, 8, 3, 2, 'Galleri'),
-- (324, 9, 3, 2, 'Galleri'),
-- (325, 10, 3, 2, 'Galleri'),
-- (326, 11, 3, 2, 'Galleri'),
-- (327, 12, 3, 2, 'Galleri'),
-- (328, 13, 3, 2, 'Galleri'),
-- (329, 14, 3, 2, 'Galleri'),
-- (330, 15, 3, 2, 'Galleri'),
-- (331, 16, 3, 2, 'Galleri'),
-- (332, 17, 3, 2, 'Galleri');

-- --Innsetting av verdier for KundeProfil
-- INSERT INTO Kundeprofil (KID, navn, TlfNr, Adresse) VALUES
-- (1, 'Ola Nordmann', 12345678, 'Gateadresse 123'),
-- (2, 'Kari Nordmann', 87654321, 'Gateadresse 321'),
-- --etc.

-- --Antagelser;

-- --Person, legger inn personer som ikke er skuespillere i denne entiteten. Person er definert som ikke skuespillere
-- --HarRolle og Skuesspiller, antar at for Rolle i SAAEK er kun skuesspiller navn og derfor er de like. Fant ikke noe mer angående dette på TT sine sider. 
-- --En Skuespiller kan spille flere roller