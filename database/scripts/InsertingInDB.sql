-- Script til å legge til de nødvendige verdiene inn i databasen.

--Setter inn verdier for de ulike tabellene;

--Sal
INSERT INTO Sal VALUES
(1, 524, 'Hovedscenen'),
(2, 332, 'Gamle Scene');
 
--Teaterstykke
INSERT INTO Teaterstykke VALUES
(1, 'Kongsemnene'),
(2, 'Størst av alt er kjærligheten');
 
--Rolle for de ulike stykkene.

-- Ulike typer Ansatt:
INSERT INTO Ansatt VALUES
(1, "Fast"),
(2, "Midlertidig"),
(3, "Innleid"),
(4, "Statist"),
(5, "Frivillig");

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

--Rolle
INSERT INTO Rolle values (1, 'Haakon Haakonssønn')
INSERT INTO Rolle values (2, 'Inga fra Vartjeg')
INSERT INTO Rolle values (3, 'Skule Jarl')
INSERT INTO Rolle values (4, 'Fru Ragnhild')
INSERT INTO Rolle values (5, 'Margrete')
INSERT INTO Rolle values (6, 'Sigrid')
INSERT INTO Rolle values (7, 'Biskop Nicolas')
INSERT INTO Rolle values (8, 'Gregorius Jonssønn')
INSERT INTO Rolle values (9, 'Paal Flida')
INSERT INTO Rolle values (10, 'Baard Bratte')
INSERT INTO Rolle values (11, 'Jatgeir Skald')
INSERT INTO Rolle values (12, 'Peter')
INSERT INTO Rolle values (13, 'Sunniva Du Mond Nordal')
INSERT INTO Rolle values (14, 'Jo Saberniak')
INSERT INTO Rolle values (15, 'Marte M. Steinholt')
INSERT INTO Rolle values (16, 'Tor Ivar Hagen')
INSERT INTO Rolle values (17, 'Trond-Ove Skrødal')
INSERT INTO Rolle values (18, 'Natalie Grøndahl Tangen')
INSERT INTO Rolle values (19, 'Åsmund Flaten')


--Oppgaver
INSERT INTO Oppgaver values (1, 'Musiker')
INSERT INTO Oppgaver values (2, 'Regissor')
INSERT INTO Oppgaver values (3, 'ScenografiAnsvarlig')
INSERT INTO Oppgaver values (4, 'KostymedesignAnsvarlig')
INSERT INTO Oppgaver values (5, 'Koreografi')
INSERT INTO Oppgaver values (6, 'MusikkOgLydAnsvarlig')
INSERT INTO Oppgaver values (7, 'Dramaturg')
INSERT INTO Oppgaver values (8, 'Sufflor')
INSERT INTO Oppgaver values (9, 'AnsvarligDirektor')

--Skuespiller, Skal vi legge til rolle id for hver skuesspiller? Skal vi legge til teaterstykke til en skuespiller?
INSERT INTO Skuespiller values (1, 'Arturo Scotti')
INSERT INTO Skuespiller values (2, 'Ingunn Beate Strige Øyen')
INSERT INTO Skuespiller values (3, 'Hans Petter Nilsen')
INSERT INTO Skuespiller values (4, 'Madeleine Brandtzæg Nilsen') 
INSERT INTO Skuespiller values (5, 'Synnøve Fossum Eriksen')
INSERT INTO Skuespiller values (6, 'Emma Caroline Deichmann')
INSERT INTO Skuespiller values (7, 'Thomas Jensen Takyi')
INSERT INTO Skuespiller values (8, 'Per Bostad Gulliksen')
INSERT INTO Skuespiller values (9, 'Isak Holmen Sørensen')
INSERT INTO Skuespiller values (10, 'Fabian Heidelberg Lunde')
INSERT INTO Skuespiller values (11, 'Emil Olafsson')
INSERT INTO Skuespiller values (12, 'Snorre Ryen Tøndel')
INSERT INTO Skuespiller values (13, 'Sunniva Du Mond Nordal')
INSERT INTO Skuespiller values (14, 'Jo Saberniak')
INSERT INTO Skuespiller values (15, 'Marte M. Steinholt')
INSERT INTO Skuespiller values (16, 'Tor Ivar Hagen')
INSERT INTO Skuespiller values (17, 'Trond-Ove Skrødal')
INSERT INTO Skuespiller values (18, 'Natalie Grøndahl Tangen')
INSERT INTO Skuespiller values (19, 'Åsmund Flaten')

--KundeProfil
INSERT INTO Kundeprofil (KID, navn, TlfNr, Adresse) VALUES
(1, 'Ola Nordmann', 12345678, 'Gateadresse 123'),
(2, 'Kari Nordmann', 87654321, 'Gateadresse 321'),
--etc.

--Billetter, 28 seter per rad for hovedscenen, 18 rader
INSERT INTO Billetter (BID, stolNR, radNR, FID, BTID, SalID, OmraadeNavn) VALUES
(1, 1, 1, 1, 1, 1) 
(2, 2, 1, 1, 1, 1),
(3, 3, 1, 1, 1, 1),
(4, 4, 1, 1, 1, 1),
(5, 5, 1, 1, 1, 1),
(6, 6, 1, 1, 1, 1),
(7, 7, 1, 1, 1, 1),
(8, 8, 1, 1, 1, 1),
(9, 9, 1, 1, 1, 1),
(10, 10, 1, 1, 1, ),
(11, 11, 1, 1, 1, 1),
(12, 12, 1, 1, 1, 1),
(13, 13, 1, 1, 1, 1),
(14, 14, 1, 1, 1, 1),
(15, 15, 1, 1, 1, 1),
(16, 16, 1, 1, 1, 1),
(17, 17, 1, 1, 1, 1),
(18, 18, 1, 1, 1, 1),
(19, 19, 1, 1, 1, 1),
(20, 20, 1, 1, 1, 1),
(21, 21, 1, 1, 1, 1),
(22, 22, 1, 1, 1, 1),
(23, 23, 1, 1, 1, 1),
(24, 24, 1, 1, 1, 1),
(25, 25, 1, 1, 1, 1),
(26, 26, 1, 1, 1, 1),
(27, 27, 1, 1, 1, 1),
(28, 28, 1, 1, 1, 1),
(29, 29, 2, 1, 1, 1), 
(30, 30, 2, 1, 1, 1),
(31, 31, 2, 1, 1, 1),
(32, 32, 2, 1, 1, 1),
(33, 33, 2, 1, 1, 1),
(34, 34, 2, 1, 1, 1),
(35, 35, 2, 1, 1, 1),
(36, 36, 2, 1, 1, 1),
(37, 37, 2, 1, 1, 1),
(38, 38, 2, 1, 1, 1),
(39, 39, 2, 1, 1, 1),
(40, 40, 2, 1, 1, 1),
(41, 41, 2, 1, 1, 1),
(42, 42, 2, 1, 1, 1),
(43, 43, 2, 1, 1, 1),
(44, 44, 2, 1, 1, 1),
(45, 45, 2, 1, 1, 1),
(46, 46, 2, 1, 1, 1),
(47, 47, 2, 1, 1, 1),
(48, 48, 2, 1, 1, 1),
(49, 49, 2, 1, 1, 1),
(50, 50, 2, 1, 1, 1),
(51, 51, 2, 1, 1, 1),
(52, 52, 2, 1, 1, 1),
(53, 53, 2, 1, 1, 1),
(54, 54, 2, 1, 1, 1),
(55, 55, 2, 1, 1, 1),
(56, 56, 2, 1, 1, 1),
(57, 57, 3, 1, 1, 1),
(58, 58, 3, 1, 1, 1),
(59, 59, 3, 1, 1, 1),
(60, 60, 3, 1, 1, 1),
(61, 61, 3, 1, 1, 1),
(62, 62, 3, 1, 1, 1),
(63, 63, 3, 1, 1, 1),
(64, 64, 3, 1, 1, 1),
(65, 65, 3, 1, 1, 1),
(66, 66, 3, 1, 1, 1),
(67, 67, 3, 1, 1, 1),
(68, 68, 3, 1, 1, 1),
(69, 69, 3, 1, 1, 1),
(70, 70, 3, 1, 1, 1),
(71, 71, 3, 1, 1, 1),
(72, 72, 3, 1, 1, 1),
(73, 73, 3, 1, 1, 1),
(74, 74, 3, 1, 1, 1),
(75, 75, 3, 1, 1, 1),
(76, 76, 3, 1, 1, 1),
(77, 77, 3, 1, 1, 1),
(78, 78, 3, 1, 1, 1),
(79, 79, 3, 1, 1, 1),
(80, 80, 3, 1, 1, 1),
(81, 81, 3, 1, 1, 1),
(82, 82, 3, 1, 1, 1),
(83, 83, 3, 1, 1, 1),
(84, 84, 3, 1, 1, 1),
(85, 85, 4, 1, 1, 1), 
(86, 86, 4, 1, 1, 1),
(87, 87, 4, 1, 1, 1),
(88, 88, 4, 1, 1, 1),
(89, 89, 4, 1, 1, 1),
(90, 90, 4, 1, 1, 1),
(91, 91, 4, 1, 1, 1),
(92, 92, 4, 1, 1, 1),
(93, 93, 4, 1, 1, 1),
(94, 94, 4, 1, 1, 1),
(95, 95, 4, 1, 1, 1),
(96, 96, 4, 1, 1, 1),
(97, 97, 4, 1, 1, 1),
(98, 98, 4, 1, 1, 1),
(99, 99, 4, 1, 1, 1),
(100, 100, 4, 1, 1, 1),
(101, 101, 4, 1, 1, 1),
(102, 102, 4, 1, 1, 1),
(103, 103, 4, 1, 1, 1),
(104, 104, 4, 1, 1, 1),
(105, 105, 4, 1, 1, 1),
(106, 106, 4, 1, 1, 1),
(107, 107, 4, 1, 1, 1),
(108, 108, 4, 1, 1, 1),
(109, 109, 4, 1, 1, 1),
(110, 110, 4, 1, 1, 1),
(111, 111, 4, 1, 1, 1),
(112, 112, 4, 1, 1, 1),
(113, 113, 5, 1, 1, 1),
(114, 114, 5, 1, 1, 1),
(115, 115, 5, 1, 1, 1),
(116, 116, 5, 1, 1, 1),
(117, 117, 5, 1, 1, 1),
(118, 118, 5, 1, 1, 1),
(119, 119, 5, 1, 1, 1),
(120, 120, 5, 1, 1, 1),
(121, 121, 5, 1, 1, 1),
(122, 122, 5, 1, 1, 1),
(123, 123, 5, 1, 1, 1),
(124, 124, 5, 1, 1, 1),
(125, 125, 5, 1, 1, 1),
(126, 126, 5, 1, 1, 1),
(127, 127, 5, 1, 1, 1),
(128, 128, 5, 1, 1, 1),
(129, 129, 5, 1, 1, 1), 
(130, 130, 5, 1, 1, 1),
(131, 131, 5, 1, 1, 1),
(132, 132, 5, 1, 1, 1),
(133, 133, 5, 1, 1, 1),
(134, 134, 5, 1, 1, 1),
(135, 135, 5, 1, 1, 1),
(136, 136, 5, 1, 1, 1),
(137, 137, 5, 1, 1, 1),
(138, 138, 5, 1, 1, 1),
(139, 139, 5, 1, 1, 1),
(140, 140, 5, 1, 1, 1),
(141, 141, 6, 1, 1, 1),
(142, 142, 6, 1, 1, 1),
(143, 143, 6, 1, 1, 1),
(144, 144, 6, 1, 1, 1),
(145, 145, 6, 1, 1, 1),
(146, 146, 6, 1, 1, 1),
(147, 147, 6, 1, 1, 1),
(148, 148, 6, 1, 1, 1),
(149, 149, 6, 1, 1, 1),
(150, 150, 6, 1, 1, 1),
(151, 151, 6, 1, 1, 1),
(152, 152, 6, 1, 1, 1),
(153, 153, 6, 1, 1, 1),
(154, 154, 6, 1, 1, 1),
(155, 155, 6, 1, 1, 1),
(156, 156, 6, 1, 1, 1),
(157, 157, 6, 1, 1, 1),
(158, 158, 6, 1, 1, 1),
(159, 159, 6, 1, 1, 1),
(160, 160, 6, 1, 1, 1),
(161, 161, 6, 1, 1, 1),
(162, 162, 6, 1, 1, 1),
(163, 163, 6, 1, 1, 1),
(164, 164, 6, 1, 1, 1),
(165, 165, 6, 1, 1, 1),
(166, 166, 6, 1, 1, 1),
(167, 167, 6, 1, 1, 1),
(168, 168, 6, 1, 1, 1),
(169, 169, 7, 1, 1, 1),
(170, 170, 7, 1, 1, 1),
(171, 171, 7, 1, 1, 1),
(172, 172, 7, 1, 1, 1),
(173, 173, 7, 1, 1, 1),
(174, 174, 7, 1, 1, 1),
(175, 175, 7, 1, 1, 1),
(176, 176, 7, 1, 1, 1),
(177, 177, 7, 1, 1, 1),
(178, 178, 7, 1, 1, 1),
(179, 179, 7, 1, 1, 1),
(180, 180, 7, 1, 1, 1),
(181, 181, 7, 1, 1, 1),
(182, 182, 7, 1, 1, 1),
(183, 183, 7, 1, 1, 1),
(184, 184, 7, 1, 1, 1),
(185, 185, 7, 1, 1, 1),
(186, 186, 7, 1, 1, 1),
(187, 187, 7, 1, 1, 1),
(188, 188, 7, 1, 1, 1),
(189, 189, 7, 1, 1, 1),
(190, 190, 7, 1, 1, 1),
(191, 191, 7, 1, 1, 1),
(192, 192, 7, 1, 1, 1),
(193, 193, 7, 1, 1, 1),
(194, 194, 7, 1, 1, 1),
(195, 195, 7, 1, 1, 1),
(196, 196, 7, 1, 1, 1),
(197, 197, 8, 1, 1, 1),
(198, 198, 8, 1, 1, 1),
(199, 199, 8, 1, 1, 1),
(200, 200, 8, 1, 1, 1),
(201, 201, 8, 1, 1, 1),
(202, 202, 8, 1, 1, 1),
(203, 203, 8, 1, 1, 1),
(204, 204, 8, 1, 1, 1),
(205, 205, 8, 1, 1, 1),
(206, 206, 8, 1, 1, 1),
(207, 207, 8, 1, 1, 1),
(208, 208, 8, 1, 1, 1),
(209, 209, 8, 1, 1, 1),
(210, 210, 8, 1, 1, 1),
(211, 211, 8, 1, 1, 1),
(212, 212, 8, 1, 1, 1),
(213, 213, 8, 1, 1, 1),
(214, 214, 8, 1, 1, 1),
(215, 215, 8, 1, 1, 1),
(216, 216, 8, 1, 1, 1),
(217, 217, 8, 1, 1, 1),
(218, 218, 8, 1, 1, 1),
(219, 219, 8, 1, 1, 1),
(220, 220, 8, 1, 1, 1),
(221, 221, 8, 1, 1, 1),
(222, 222, 8, 1, 1, 1),
(223, 223, 8, 1, 1, 1),
(224, 224, 8, 1, 1, 1),
(225, 225, 9, 1, 1, 1),
(226, 226, 9, 1, 1, 1),
(227, 227, 9, 1, 1, 1),
(228, 228, 9, 1, 1, 1),
(229, 229, 9, 1, 1, 1),
(230, 230, 9, 1, 1, 1),
(231, 231, 9, 1, 1, 1),
(232, 232, 9, 1, 1, 1),
(233, 233, 9, 1, 1, 1),
(234, 234, 9, 1, 1, 1),
(235, 235, 9, 1, 1, 1),
(236, 236, 9, 1, 1, 1),
(237, 237, 9, 1, 1, 1)


--Stol
INSERT INTO Stol (StolNR, RadNR, SalID, OmraadeNavn) VALUES
(1, 1, 1, 'Hovedscenen'),
(2, 1, 1, 'Hovedscenen'),
(3, 1, 1, 'Hovedscenen'),
--etc.

--BillettType, forskjellige billetpriser for forestillinger. fremmedid mot det?
INSERT INTO BillettType (BTID, Gruppe) VALUES
(1, 'Ordinær',450,1),
(2, 'Student', 280,1),
(3, 'Honnør', 380,1),
(4, 'Gruppe 10', 420,1),
(5, 'Gruppe 10 Honnør', 360,1)
(6, 'Ordinær',350,2),
(7, 'Student', 300,2),
(8, 'Honnør', 220,2),
(9, 'Gruppe 10', 320,2),
(10, 'Gruppe 10 Honnør',270,2)



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