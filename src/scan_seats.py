# Tester å lage en scanner til å undersøke tekstfilen.
# Henter filene:
gamle_scene = "./files needed/gamle-scene.txt"
hovedscenen = "./files needed/hovedscenen.txt"

def scan_alle_stoler(filnavn):
    omraade_til_salID = {'Galleri': 1, 'Balkong': 2, 'Parkett': 3}
    stoler = []
    omraade_navn = ''
    rad_nr = 1  # Anta at radnummer starter på 1 for hvert område

    with open(filnavn, 'r') as fil:
        for linje in fil:
            linje = linje.strip()
            if linje in omraade_til_salID:
                omraade_navn = linje
                rad_nr = 1  # Nullstiller radnummer for hvert nytt område
            elif linje and omraade_navn:  # Sjekker også at omraade_navn er gyldig før vi legger til stoler
                stol_nr = 1
                for tegn in linje:
                    # Inkluderer kun gyldige stolposisjoner fra oppgitt tekstfil. (ignorer 'x')
                    if tegn in '1': # Legger så kun til stolene som er kjøpt, som er stol gitt ved 1.
                        stoler.append((stol_nr, rad_nr, omraade_til_salID[omraade_navn], omraade_navn))
                        stol_nr += 1
                rad_nr += 1

    return stoler


# Debugging 
stoler_kjopt_hs = scan_alle_stoler(hovedscenen)
stoler_kjopt_gs = scan_alle_stoler(gamle_scene)
print("Printer kjøpte stoler for Hovedscenen:\n")
for stol in stoler_kjopt_hs:
    print(stol)
print("\n ------------------------- \n")
print("Printer kjøpte stoler for Gamle Scenen:\n")
for stol in stoler_kjopt_gs:
    print(stol)
