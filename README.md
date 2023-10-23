# PDF-Kombinierungs-Skript

Dieses Shell-Skript ermöglicht es, zwei oder mehr PDF-Dateien miteinander zu kombinieren und ein drittes PDF (optional) auf jede kombinierte Seite zu stempeln. Das kombinierte PDF wird im `output`-Verzeichnis gespeichert.

## Verwendung

Führe das Skript wie folgt aus:

`./combine.sh <Datei1.pdf> <Datei2.pdf> [Stempel.pdf]`

- `Datei1.pdf`: Der Pfad zur ersten PDF-Datei, die kombiniert werden soll.
- `Datei2.pdf`: Der Pfad zur zweiten PDF-Datei, die kombiniert werden soll.
- `Stempel.pdf` (optional): Der Pfad zur dritten PDF-Datei, die auf jede Seite des kombinierten PDFs gestempelt werden soll. Dieses Argument ist optional.

## Ergebnis

Das kombinierte PDF wird standardmäßig im `output`-Verzeichnis gespeichert:

- `output/kombiniert.pdf`: Das kombinierte PDF, wenn kein Stempel-PDF angegeben wurde.
- `output/kombiniert_gestempelt.pdf`: Das kombinierte PDF mit Stempel, wenn ein Stempel-PDF angegeben wurde.

## Voraussetzungen

- Du musst pdftk installiert haben, pdftk kann mit Homebrew installiert werden:
`brew install pdftk-java`

## Hinweise

- Wenn der `output`-Ordner nicht existiert, wird er automatisch erstellt.
- Wenn das Skript nicht funktioniert, überprüfe die Berechtigungen für das Skript und das `output`-Verzeichnis.

## Autor

Hauptsächlich ChatGPT und ein wenig [Moritz Bützer](https://www.buetzer.ch)
 ;-)

## Lizenz

[WTFPL](http://www.wtfpl.net/)
