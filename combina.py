# Leggi i nomi da nomi.txt specificando la codifica
with open("nomi.txt", "r", encoding="utf-8") as nomi_file:
    nomi = nomi_file.read().splitlines()

# Leggi i cognomi da cognomi.txt specificando la codifica
with open("cognomi.txt", "r", encoding="utf-8") as cognomi_file:
    cognomi = cognomi_file.read().splitlines()


with open("combinazioni.txt", "w", encoding="utf-8") as output_file:
    # Scrivi le combinazioni nel file con la codifica utf-8
    for nome in nomi:
        for cognome in cognomi:
            combinazione = f"{nome}.{cognome}"
            output_file.write(combinazione + "\n")


