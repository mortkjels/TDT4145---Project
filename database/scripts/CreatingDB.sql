--SQL Script, Gruppe 27, Prosjekt TDT4145 VÅR 2024: Ole Marcus Aarnes, Morten Kjelsrud, Benjamin Færestrand

--Oppretter Billett-tabell (dropper tabell hvis allerede finnes)
DROP TABLE Billetter;
CREATE TABLE Billetter (
    BID INTEGER,
    FID INTEGER,
    BTID INTEGER,
    StolID INTEGER,
    constraint BID_pk primary key (BID),
    constraint forestilling_fk foreign key (FID) references Forestillinger(FID),
    constraint billettype_fk foreign key (BTID) references BillettType(BTID),
    constraint stolID_fk foreign key (StolID) references Stol(StolID)
    );

--Oppretter Forestillinger-tabell (dropper tabell hvis allerede finnes)
DROP TABLE Forestillinger;
CREATE TABLE Forestillinger (
    FID INTEGER,
    Dato DATE,
    Klokkeslett TIME,
    BID INTEGER,
    navn VARCHAR(50),
    constraint FID_pk primary key (FID),
    constraint billett_fk foreign key (BID) references Billetter(BID)
    );

--Oppretter Person-tabell (dropper tabell hvis allerede finnes)
DROP TABLE Person;
CREATE TABLE Person (
    PID INTEGER,
    navn VARCHAR(30),
    epost VARCHAR(50),
    constraint PID_pk primary key (PID),
    constraint Ansatt_fk foreign key (AID) references Ansatt (AID),
    constraint oppgaver_fk foreign key (OpID) references Oppgaver (OpID)
    );

--Oppretter Teaterstykke-tabell (dropper tabell hvis allerede finnes)
DROP TABLE Teaterstykke;
CREATE TABLE Teaterstykke (
    TID INTEGER,
    navn VARCHAR(50),
    constraint TID_pk primary key (TID)
    );

--Oppretter Akt-tabell (dropper tabell hvis allerede finnes)
DROP TABLE Akt;
CREATE TABLE Akt (
    AKID INTEGER,
    navn VARCHAR(50),
    Nummer INTEGER,
    constraint AKID_pk primary key (AKID)
    );

--Oppretter Sal-tabell (dropper tabell hvis allerede finnes)
DROP TABLE Sal;
CREATE TABLE Sal (
    SalID INTEGER,
    Kapasitet INTEGER,
    navn VARCHAR(50),
    constraint salID_pk primary key (SalID)
    );

--Oppretter Kulisser-tabell (dropper tabell hvis allerede finnes)
DROP TABLE Kulisser;  
CREATE TABLE Kulisser (
    KUID INTEGER,
    Typer VARCHAR(30),
    constraint KUID_pk primary key (KUID)
    );

--Oppretter Stol-tabell (dropper tabell hvis allerede finnes)
DROP TABLE Stol;
CREATE TABLE Stol (
    StolID INTEGER,
    StolNR INTEGER,
    RadNR INTEGER,
    SalID INTEGER,
    OmraadeNavn VARCHAR(50),
    constraint StolID_pk primary key (StolID), 
    constraint salID_fk foreign key (SalID) references Sal(SalID)
    );

--Oppretter Rolle-tabell (dropper tabell hvis allerede finnes)
DROP TABLE Rolle;
CREATE TABLE Rolle (
    RID INTEGER,
    navn VARCHAR(50),
    constraint RID_pk primary key (RID)
    );

--Oppretter Skuespiller-tabell (dropper tabell hvis allerede finnes)
DROP TABLE Skuespiller;
CREATE TABLE Skuespiller (
    SKID INTEGER,
    navn VARCHAR(50),
    constraint SKID_pk primary key (SKID)
    );

--Oppretter Kundeprofil-tabell (dropper tabell hvis allerede finnes)
DROP TABLE Kundeprofil;
CREATE TABLE Kundeprofil (
    KID INTEGER,
    navn VARCHAR(50),
    TlfNr INTEGER,
    Adresse VARCHAR(50),
    constraint KID_pk primary key (KID)
    );

--Oppretter BillettType-tabell (dropper tabell hvis allerede finnes)
DROP TABLE BillettType;
CREATE TABLE BillettType (
    BTID INTEGER,
    Gruppe VARCHAR(30),
    constraint BTID_pk primary key (BTID)   
    );

--Oppretter Oppgaver-tabell (dropper tabell hvis allerede finnes)
DROP TABLE Oppgaver;
CREATE TABLE Oppgaver (
    OpID INTEGER,
    OppgaveType VARCHAR(50),
    CHECK (OppgaveType IN ('Musiker', 'Regissor', 'ScenografiAnsvarlig', 'KostymedesignAnsvarlig',
    'Koreografi', 'MusikkOgLydAnsvarlig', 'Dramaturg', 'Sufflor', 'AnsvarligDirektor')),
    constraint OpID_pk primary key (OpID)
    );

--Oppretter Ansatt-tabell (dropper tabell hvis allerede finnes)
DROP TABLE Ansatt;
CREATE TABLE Ansatt (
    AID INTEGER,
    TypeAnsatt VARCHAR(50),
    CHECK (TypeAnsatt IN ('Fast', 'Midlertidig', 'Innleid', 'Statist', 'Frivillig')),
    constraint AID_pk primary key (AID)
    );

--Oppretter HarOppgave-Tabell (dropper tabell hvis allerede finnes)
DROP TABLE HarOppgave;
CREATE TABLE HarOppgave (
    PID INT NOT NULL,
    OpID INT NOT NULL,
    constraint PK_HarOppgave primary key (PID),
    constraint FK_HarOppgave_PID foreign key (PID) references Person(PID),
    constraint FK_HarOppgave_OpID foreign key (OpID) references Oppgaver(OpID)
);

--Oppretter AnsattSom-Tabell (dropper tabell hvis allerede finnes)
DROP TABLE AnsattSom;
CREATE TABLE AnsattSom (
    PID INT NOT NULL,
    AID INT NOT NULL,
    constraint PK_AnsattSom primary key (PID),
    constraint FK_AnsattSom_PID foreign key (PID) references Person(PID),
    constraint FK_AnsattSom_AID foreign key (AID) references Ansatt(AID)
);

--Oppretter Deltar-Tabell (dropper tabell hvis allerede finnes)
DROP TABLE Deltar;
CREATE TABLE Deltar (
    PID INT NOT NULL,
    TID INT NOT NULL,
    constraint PK_Deltar primary key (PID, TID),
    constraint FK_Deltar_PID foreign key (PID) references Person(PID),
    constraint FK_Deltar_TID foreign key (TID) references Teaterstykke(TID)
);

--Oppretter HarAkt-Tabell (dropper tabell hvis allerede finnes)
DROP TABLE HarAkt;
CREATE TABLE HarAkt (
    AKID INT NOT NULL,
    TID INT NOT NULL,
    constraint PK_HarAkt primary key (AKID),
    constraint FK_HarAkt_TID foreign key (TID) references Teaterstykke(TID),
    constraint FK_HarAkt_AKID foreign key (AKID) references Akt(AKID)
);

--Oppretter HarStol-Tabell (dropper tabell hvis allerede finnes)
DROP TABLE HarStol;
CREATE TABLE HarStol (
    OmrådeNavn VARCHAR(50) NOT NULL,
    RadNr INT NOT NULL,
    StolNr INT NOT NULL,
    SalID INT NOT NULL,
    constraint PK_HarStol primary key (OmrådeNavn, RadNr, StolNr, SalID),
    constraint FK_HarStol_SalID foreign key (SalID) references Sal(SalID)
);

--Oppretter ForestillingI-Tabell (dropper tabell hvis allerede finnes)
DROP TABLE ForestillingI;
CREATE TABLE ForestillingI (
    SalID INT NOT NULL,
    FID INT NOT NULL,
    constraint PK_ForestillingI primary key (SalID),
    constraint FK_ForestillingI_SalID foreign key (SalID) references Sal(SalID),
    constraint FK_ForestillingI_FID foreign key (FID) references Forestilling(FID)
);

--Oppretter HarForestilling-Tabell (dropper tabell hvis allerede finnes)
DROP TABLE HarForestilling;
CREATE TABLE HarForestilling (
    TID INT NOT NULL,
    FID INT NOT NULL,
    constraint PK_HarForestilling primary key (TID),
    constraint FK_HarForestilling_TID foreign key (TID) references Teaterstykke(TID),
    constraint FK_HarForestilling_FID foreign key (FID) references Forestilling(FID)
);

--Oppretter TilForestilling-Tabell (dropper tabell hvis allerede finnes)
DROP TABLE TilForestilling;
CREATE TABLE TilForestilling (
    BID INT NOT NULL,
    FID INT,
    constraint PK_TilForestilling primary key (BID),
    constraint FK_TilForestilling_FID foreign key (FID) references Forestilling(FID),
    constraint FK_TilForestilling_BID foreign key (BID) references Billetter(BID)
);

--Oppretter HarKulisser-Tabell (dropper tabell hvis allerede finnes)
DROP TABLE HarKulisser;
CREATE TABLE HarKulisser (
    FID INT NOT NULL,
    KUID INT NOT NULL,
    constraint PK_HarKulisser primary key (FID, KUID),
    constraint FK_HarKulisser_FID foreign key (FID) references Forestilling(FID),
    constraint FK_HarKulisser_KUID foreign key (KUID) references Kulisser(KUID)
);

--Oppretter HarRolle-Tabell (dropper tabell hvis allerede finnes)
DROP TABLE HarRolle;
CREATE TABLE HarRolle (
    SKID INT NOT NULL,
    RID INT,
    constraint PK_HarRolle primary key (SKID),
    constraint FK_HarRolle_SKID foreign key (SKID) references Skuespiller(SKID),
    constraint FK_HarRolle_RID foreign key (RID) references Rolle(RID)
);

--Oppretter DeltarIAkt-Tabell (dropper tabell hvis allerede finnes)
DROP TABLE DeltarIAkt;
CREATE TABLE DeltarIAkt (
    AKID INT NOT NULL,
    RID INT,
    constraint PK_DeltarIAkt primary key (AKID),
    constraint FK_DeltarIAkt_RID foreign key (RID) references Rolle(RID),
    constraint FK_DeltarIAkt_AKID foreign key (AKID) references Akt(AKID)
);

--Oppretter Billettkjoep-Tabell (dropper tabell hvis allerede finnes)
DROP TABLE BillettKjoep;
CREATE TABLE BillettKjoep (
    BID INT NOT NULL,
    KID INT NOT NULL,
    Dato DATE NOT NULL,
    Tid TIME NOT NULL,
    constraint FK_BillettKjoep_BID foreign key (BID) references Billett(BID),
    constraint FK_BillettKjoep_KID foreign key (KID) references Kundeprofil(KID)
);

--Oppretter Typene-Tabell (dropper tabell hvis allerede finnes)
DROP TABLE Typene;
CREATE TABLE Typene (
    BTID INT NOT NULL,
    BID INT NOT NULL,
    constraint PK_Typene primary key (BTID),
    constraint FK_Typene_BID foreign key (BID) references Billett(BID),
    constraint FK_Typene_BTID foreign key (BTID) references BillettType(BTID)
);

--Oppretter HarSete-Tabell (dropper tabell hvis allerede finnes)
DROP TABLE HarSete;
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

--Oppretter HarTeaterstykke-Tabell (dropper tabell hvis allerede finnes)
DROP TABLE HarTeaterstykke;
CREATE TABLE HarTeaterstykke (
    TID INT NOT NULL,
    SalID INT NOT NULL,
    constraint PK_HarTeaterstykke primary key (TID, SalID),
    constraint FK_HarTeaterstykke_TID foreign key (TID) references Teaterstykke(TID),
    constraint FK_HarTeaterstykke_SalID foreign key (SalID) references Sal(SalID)
);

--Oppretter ErPerson-Tabell (dropper tabell hvis allerede finnes)
DROP TABLE ErPerson;
CREATE TABLE PersonSkuespiller (
    PID INT NOT NULL,
    SKID INT NOT NULL,
    constraint PK_PersonSkuespiller primary key (SKID),
    constraint FK_PersonSkuespiller_PID foreign key (PID) references Person(PID),
    constraint FK_PersonSkuespiller_SKID foreign key (SKID) references Skuespiller(SKID)
);