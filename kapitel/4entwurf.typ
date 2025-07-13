= Technischer Entwurf

== Architektur

- Die Komponente ist in Rahmen und visualisierung aufgeteilt
- abwägen ob die komponente komplett im kacheleditor entwickelt werden soll oder im standard und dann die komponente im kachel kontext verwenden
- rahmen ist komplett selbst
- visualisierungen sind hauptsächlich bibliotheken mit ausnahme von
- diagram zum datenmodell mit client
- auswertung wird auf dem client ausgeführt

== datenverarbeitung

- hier weiß ich nicht so 100%, ob das wirklich benötigt ist, oder ob alle visualisierungslibraries mir hier die arbeit abnehmen

== Evaluation und Auswahl von verfügbaren Bibliotheken
- Eine Drag and Drop Library wird bereits im System verwendet. Diese wurde für diese Komponente auch verwendet.
- Kurz beschreiben was die macht, dass die eine einfachere version von react-dnd ist, aber für unsere anwendungsfälle reicht

- ein paar pivot libraries raussuchen. dabei eingehen, dass mui-x verwendet wird, aber an sich nicht den anforderungen entspricht

- der react port der bisher verwendeten version wir nichtmehr gewartet und ist mit neueren react versionen inkompatibel
  - hier auch ein bild der fehlermeldung einbinden

- visualisierungslibrary ist auch schon größtenteils vorgegeben (mui charts)
  - adapterkomponenten für die jeweiligen visualisierungen
  - erweiterbarkeit