--SQL Script, Gruppe 27, Prosjekt TDT4145 VÅR 2024: Ole Marcus Aarnes, Morten Kjelsrud, Benjamin Færestrand


--Dropper eksisterende tabeller
drop table if exists Billetter, Forestillinger, Person, Teaterstykke, Akt, Sal, Kulisser, Stol, Rolle, Skuespiller, Kundeprofil, BillettType, Oppgaver, Ansatt, HarOppgave,
AnsattSom, HarAkt, Deltar, HarStol, ForestillingI, HarForestilling, TilForestilling, HarKulisser, HarRolle, DeltarIAkt, BillettKjoep, Typene, HarSete, HarTeaterstykke, 
PersonSkuespiller;


--Oppretter Billett-tabell
CREATE TABLE Billetter (
    BID INTEGER,
    stolNR INTEGER,
    radNR INTEGER,
    FID INTEGER,
    BTID INTEGER,
    SalID INTEGER,
    OmraadeNavn VARCHAR(50),
    constraint BID_pk primary key (BID),
    constraint forestilling_fk foreign key (FID) references Forestillinger(FID),
    constraint billettype_fk foreign key (BTID) references BillettType(BTID),
    constraint salID_fk foreign key (SalID) references Sal(SalID)
    );

--Oppretter Forestillinger-tabell
CREATE TABLE Forestillinger (
    FID INTEGER,
    Dato DATE,
    Klokkeslett TIME,
    BID INTEGER,
    navn VARCHAR(50),
    constraint FID_pk primary key (FID),
    constraint billett_fk foreign key (BID) references Billetter(BID)
    );

--Oppretter Person-tabell
CREATE TABLE Person (
    PID INTEGER,
    navn VARCHAR(30),
    epost VARCHAR(50),
    AID INTEGER,
    OpID INTEGER,
    constraint PID_pk primary key (PID),
    constraint Ansatt_fk foreign key (AID) references Ansatt (AID),
    constraint oppgaver_fk foreign key (OpID) references Oppgaver (OpID)
    );

--Oppretter Teaterstykke-tabell
CREATE TABLE Teaterstykke (
    TID INTEGER,
    navn VARCHAR(50),
    constraint TID_pk primary key (TID)
    );

--Oppretter Akt-tabell
CREATE TABLE Akt (
    AKID INTEGER,
    navn VARCHAR(50),
    Nummer INTEGER,
    constraint AKID_pk primary key (AKID)
    );

--Oppretter Sal-tabell
CREATE TABLE Sal (
    SalID INTEGER,
    Kapasitet INTEGER,
    navn VARCHAR(50),
    constraint salID_pk primary key (SalID)
    );

--Oppretter Kulisser-tabell    
CREATE TABLE Kulisser (
    KUID INTEGER,
    Typer VARCHAR(30),
    constraint KUID_pk primary key (KUID)
    );

--Oppretter Stol-tabell
CREATE TABLE Stol (
    StolNR INTEGER,
    RadNR INTEGER,
    SalID INTEGER,
    OmraadeNavn VARCHAR(50),
    constraint Stol_pk primary key (StolNR, RadNR, OmraadeNavn, SalID),
    constraint salID_fk foreign key (SalID) references Sal(SalID)
    );

--Oppretter Rolle-tabell
CREATE TABLE Rolle (
    RID INTEGER,
    navn VARCHAR(50),
    constraint RID_pk primary key (RID)
    );

--Oppretter Skuespiller-tabell
CREATE TABLE Skuespiller (
    SKID INTEGER,
    navn VARCHAR(50),
    constraint SKID_pk primary key (SKID)
    );

--Oppretter Kundeprofil-tabell
CREATE TABLE Kundeprofil (
    KID INTEGER,
    navn VARCHAR(50),
    TlfNr INTEGER,
    Adresse VARCHAR(50),
    constraint KID_pk primary key (KID)
    );

--Oppretter BillettType-tabell
CREATE TABLE BillettType (
    BTID INTEGER,
    Gruppe VARCHAR(30),
    Pris INTEGER,
    constraint BTID_pk primary key (BTID)  
    constraint TID_fk foreign key (TID) references Teaterstykke(TID)
    );

--Oppretter Oppgaver-tabell
CREATE TABLE Oppgaver (
    OpID INTEGER,
    OppgaveType VARCHAR(50),
    CHECK (OppgaveType IN ('Musiker', 'Regissor', 'ScenografiAnsvarlig', 'KostymedesignAnsvarlig',
    'Koreografi', 'MusikkOgLydAnsvarlig', 'Dramaturg', 'Sufflor', 'AnsvarligDirektor')),
    constraint OpID_pk primary key (OpID)
    );

--Oppretter Ansatt-tabell
CREATE TABLE Ansatt (
    AID INTEGER,
    TypeAnsatt VARCHAR(50),
    CHECK (TypeAnsatt IN ('Fast', 'Midlertidig', 'Innleid', 'Statist', 'Frivillig')),
    constraint AID_pk primary key (AID)
    );

--Oppretter HarOppgave-Tabell
CREATE TABLE HarOppgave (
    PID INT NOT NULL,
    OpID INT NOT NULL,
    constraint PK_HarOppgave primary key (PID),
    constraint FK_HarOppgave_PID foreign key (PID) references Person(PID),
    constraint FK_HarOppgave_OpID foreign key (OpID) references Oppgaver(OpID)
);

--Oppretter AnsattSom-Tabell
CREATE TABLE AnsattSom (
    PID INT NOT NULL,
    AID INT NOT NULL,
    constraint PK_AnsattSom primary key (PID),
    constraint FK_AnsattSom_PID foreign key (PID) references Person(PID),
    constraint FK_AnsattSom_AID foreign key (AID) references Ansatt(AID)
);

--Oppretter HarOppgave-Tabell
CREATE TABLE Deltar (
    PID INT NOT NULL,
    TID INT NOT NULL,
    constraint PK_Deltar primary key (PID, TID),
    constraint FK_Deltar_PID foreign key (PID) references Person(PID),
    constraint FK_Deltar_TID foreign key (TID) references Teaterstykke(TID)
);

--Oppretter HarOppgave-Tabell
CREATE TABLE HarAkt (
    AKID INT NOT NULL,
    TID INT NOT NULL,
    constraint PK_HarAkt primary key (AKID),
    constraint FK_HarAkt_TID foreign key (TID) references Teaterstykke(TID),
    constraint FK_HarAkt_AKID foreign key (AKID) references Akt(AKID)
);

--Oppretter HarStol-Tabell
CREATE TABLE HarStol (
    OmrådeNavn VARCHAR(50) NOT NULL,
    RadNr INT NOT NULL,
    StolNr INT NOT NULL,
    SalID INT NOT NULL,
    constraint PK_HarStol primary key (OmrådeNavn, RadNr, StolNr, SalID),
    constraint FK_HarStol_SalID foreign key (SalID) references Sal(SalID)
);

--Oppretter ForestillingI-Tabell
CREATE TABLE ForestillingI (
    SalID INT NOT NULL,
    FID INT NOT NULL,
    constraint PK_ForestillingI primary key (SalID),
    constraint FK_ForestillingI_SalID foreign key (SalID) references Sal(SalID),
    constraint FK_ForestillingI_FID foreign key (FID) references Forestilling(FID)
);

--Oppretter HarForestilling-Tabell
CREATE TABLE HarForestilling (
    TID INT NOT NULL,
    FID INT NOT NULL,
    constraint PK_HarForestilling primary key (TID),
    constraint FK_HarForestilling_TID foreign key (TID) references Teaterstykke(TID),
    constraint FK_HarForestilling_FID foreign key (FID) references Forestilling(FID)
);

--Oppretter TilForestilling-Tabell
CREATE TABLE TilForestilling (
    BID INT NOT NULL,
    FID INT,
    constraint PK_TilForestilling primary key (BID),
    constraint FK_TilForestilling_FID foreign key (FID) references Forestilling(FID),
    constraint FK_TilForestilling_BID foreign key (BID) references Billetter(BID)
);

--Oppretter HarKulisser-Tabell
CREATE TABLE HarKulisser (
    FID INT NOT NULL,
    KUID INT NOT NULL,
    constraint PK_HarKulisser primary key (FID, KUID),
    constraint FK_HarKulisser_FID foreign key (FID) references Forestilling(FID),
    constraint FK_HarKulisser_KUID foreign key (KUID) references Kulisser(KUID)
);

--Oppretter HarRolle-Tabell
CREATE TABLE HarRolle (
    SKID INT NOT NULL,
    RID INT,
    constraint PK_HarRolle primary key (SKID),
    constraint FK_HarRolle_SKID foreign key (SKID) references Skuespiller(SKID),
    constraint FK_HarRolle_RID foreign key (RID) references Rolle(RID)
);

--Oppretter DeltarIAkt-Tabell
CREATE TABLE DeltarIAkt (
    AKID INT NOT NULL,
    RID INT,
    constraint PK_DeltarIAkt primary key (AKID),
    constraint FK_DeltarIAkt_RID foreign key (RID) references Rolle(RID),
    constraint FK_DeltarIAkt_AKID foreign key (AKID) references Akt(AKID)
);

--Oppretter Billettkjoep-Tabell
CREATE TABLE BillettKjoep (
    BID INT NOT NULL,
    KID INT NOT NULL,
    Dato DATE NOT NULL,
    Tid TIME NOT NULL,
    constraint FK_BillettKjoep_BID foreign key (BID) references Billett(BID),
    constraint FK_BillettKjoep_KID foreign key (KID) references Kundeprofil(KID)
);

--Oppretter Typene-Tabell
CREATE TABLE Typene (
    BTID INT NOT NULL,
    BID INT NOT NULL,
    constraint PK_Typene primary key (BTID),
    constraint FK_Typene_BID foreign key (BID) references Billett(BID),
    constraint FK_Typene_BTID foreign key (BTID) references BillettType(BTID)
);

--Oppretter HarSete-Tabell
CREATE TABLE HarSete (
    BID INT NOT NULL,
    OmrådeNavn VARCHAR(50) NOT NULL,
    RadNr INT NOT NULL,
    StolNr INT NOT NULL,
    SalID INT NOT NULL,
    constraint PK_HarSete primary key (BID),
    constraint FK_HarSete_BID foreign key (BID) references Billetter(BID),
    constraint FK_HarSete_Stol foreign key (OmrådeNavn, RadNr, StolNr, SalID) references Stol(OmrådeNavn, RadNr, StolNr, SalID)
);

--Oppretter HarTeaterstykke-Tabell
CREATE TABLE HarTeaterstykke (
    TID INT NOT NULL,
    SalID INT NOT NULL,
    constraint PK_HarTeaterstykke primary key (TID, SalID),
    constraint FK_HarTeaterstykke_TID foreign key (TID) references Teaterstykke(TID),
    constraint FK_HarTeaterstykke_SalID foreign key (SalID) references Sal(SalID)
);

--Oppretter ErPerson-Tabell
CREATE TABLE PersonSkuespiller (
    PID INT NOT NULL,
    SKID INT NOT NULL,
    constraint PK_PersonSkuespiller primary key (SKID),
    constraint FK_PersonSkuespiller_PID foreign key (PID) references Person(PID),
    constraint FK_PersonSkuespiller_SKID foreign key (SKID) references Skuespiller(SKID)
);


--Setter inn verdier for de ulike tabellene;

--Sal
INSERT INTO Sal values (1, 524, 'Hovedscenen');
INSERT INTO Sal values (1, 332, 'Gamle Scene');

--Teaterstykke
INSERT INTO Teaterstykke values (1, 'Kongsemnene')
INSERT INTO Teaterstykke values (2, 'Størst av alt er kjærligheten')

--Person


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

--Billetter
INSERT INTO Billetter (BID, stolNR, radNR, FID, BTID, SalID, OmraadeNavn) VALUES
(1, 1, 1, 1, 1, 1, 'Hovedscenen'), 
(2, 2, 1, 1, 1, 1, 'Hovedscenen'),
(3, 3, 1, 1, 1, 1, 'Hovedscenen'),
, --etc.

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


