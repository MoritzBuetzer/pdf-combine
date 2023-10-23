#!/bin/bash

# Überprüfen, ob mindestens zwei Argumente übergeben wurden
if [ "$#" -lt 2 ]; then
    echo "Verwendung: $0 <Datei1.pdf> <Datei2.pdf> [Stempel.pdf]"
    exit 1
fi

# Dateinamen extrahieren
input_file1="$1"
input_file2="$2"
output_dir="output"

# Überprüfen, ob der "output"-Ordner existiert, andernfalls erstellen
if [ ! -d "$output_dir" ]; then
    mkdir "$output_dir"
fi

# Einen optionalen Stempel-PDF-Dateinamen festlegen
if [ "$#" -eq 3 ]; then
    stamp_file="$3"
    output_file="$output_dir/kombiniert_gestempelt.pdf"
else
    stamp_file=""  # Wenn kein Stempel-PDF angegeben ist
    output_file="$output_dir/kombiniert.pdf"
fi

# Überprüfen, ob pdftk installiert ist
if ! command -v pdftk > /dev/null; then
    echo "pdftk ist nicht installiert. Bitte installieren Sie pdftk."
    exit 1
fi

# Anzahl der Seiten in den beiden Eingabedateien ermitteln
pages_file1=$(pdftk "$input_file1" dump_data | grep NumberOfPages | awk '{print $2}')
pages_file2=$(pdftk "$input_file2" dump_data | grep NumberOfPages | awk '{print $2}')

# Überprüfen, ob die Anzahl der Seiten in den beiden Dateien übereinstimmt
if [ "$pages_file1" -ne "$pages_file2" ]; then
    echo "Fehler: Die beiden PDF-Dateien haben eine unterschiedliche Anzahl an Seiten."
    exit 1
fi

# Anzahl der Seiten in den beiden Eingabedateien ermitteln
pages_file1=$(pdftk "$input_file1" dump_data | grep NumberOfPages | awk '{print $2}')
pages_file2=$(pdftk "$input_file2" dump_data | grep NumberOfPages | awk '{print $2}')

# Kombinieren der PDF-Dateien und Stempeln des dritten PDFs (falls vorhanden)
pdftk "$input_file1" multistamp "$input_file2" output temp_combined.pdf
if [ -n "$stamp_file" ]; then
    pdftk temp_combined.pdf multistamp "$stamp_file" output "$output_file"
    
    # Aufräumen
    rm temp_combined.pdf

    echo "PDF-Dateien wurden erfolgreich kombiniert, gestempelt und als '$output_file' gespeichert."
else
    mv temp_combined.pdf "$output_file"
    echo "PDF-Dateien wurden erfolgreich kombiniert und als '$output_file' gespeichert."
fi
