#import "../utils.typ": todo

= Technischer Entwurf

== Evaluation und Auswahl von verfügbaren Bibliotheken
- Eine Drag and Drop Library wird bereits im System verwendet. Diese wurde für diese Komponente auch verwendet.
- Kurz beschreiben was die macht, dass die eine einfachere version von react-dnd ist, aber für unsere anwendungsfälle reicht

- ein paar pivot libraries raussuchen. dabei eingehen, dass mui-x verwendet wird, aber an sich nicht den anforderungen entspricht

- der react port der bisher verwendeten version wir nichtmehr gewartet und ist mit neueren react versionen inkompatibel
  - hier auch ein bild der fehlermeldung einbinden

- visualisierungslibrary ist auch schon größtenteils vorgegeben (mui charts)
  - adapterkomponenten für die jeweiligen visualisierungen
  - erweiterbarkeit

=== react-pivottable

=== MUI-X Datagrid Pivottable

=== Hilfsbibliotheken

=== Fazit

== Architektur

/*
- Die Komponente ist in Rahmen zur konfiguration und den visualisierungen aufgeteilt

- Komponente als eine im System verfügbare React-Komponente entwickelt, die zuerst unabhängig vom Kachel-V2-System ist. Die Komponente nimmt die Konfiguration und Daten als Parameter. Die Integration in das Kachel-V2-System geschieht über eine Kachel, welche nur die Kachel-API und Daten handhabt und diese für die Pivot-Tabellen-Komponente aufarbeitet und weitergibt.
  - diese Trennung wird gemacht, da kacheln einige begrenzungen haben (keine klassen, keine alleinstehenden funktionen)

- der rahmen zur konfiguration wird komplett selbst entwickelt
- für die visualisierungen werden hauptsächlich bibliotheken benutzt (mit ausnahme von tabelle?)
- auswertung wird auf dem client ausgeführt
  - datenmengen sind nicht sehr groß und werden vom server limitiert. standardmäßig auf 20.000. bisherige performance war akzeptabel

- diagram zum datenmodell mit client?
*/



Die Architektur der Pivot-Tabellen-Komponente folgt einem modularen Aufbau, der eine klare Trennung zwischen Konfigurationslogik und der eigentlichen Darstellung der Auswertung vorsieht. Funktional gliedert sich die Komponente in zwei Hauptbereiche: den Konfigurationsrahmen, in dem Nutzerinnen und Nutzer die Auswertung definieren, und den Visualisierungsbereich, in dem die Daten in tabellarischer oder grafischer Form dargestellt werden.

Die Komponente selbst wird als eigenständige React-Komponente entwickelt, die systemweit verfügbar ist. In ihrer Grundstruktur ist sie zunächst unabhängig vom Kachel-V2-System konzipiert. Sie erhält sowohl die Konfiguration als auch die auszuwertenden Daten über definierte Parameter. Die eigentliche Integration in das Kachel-V2-System erfolgt über eine dedizierte Kachel, welche die Kommunikation mit der Kachel-API übernimmt. Diese Kachel extrahiert die erforderlichen Informationen und übergibt sie in aufbereiteter Form an die Pivot-Komponente. Hintergrund dieser Aufteilung ist die Architektur des Kachel-V2-Systems, das bestimmte Einschränkungen aufweist – etwa die fehlende Unterstützung für Klassen oder eigenständige Funktionsdefinitionen. Durch die Trennung von Kachel und Komponente kann die Funktionalität der Pivot-Tabelle unabhängig von diesen Begrenzungen entwickelt werden.

Der Konfigurationsrahmen wird vollständig eigenentwickelt, um maximale Kontrolle über die Funktionalität, die Interaktion und das Nutzererlebnis zu gewährleisten. Für die Darstellung der Visualisierungen hingegen wird überwiegend auf bestehende Bibliotheken zurückgegriffen. Dies betrifft insbesondere die Diagrammdarstellung, für die auf bereits im System etablierte Bibliotheken zurückgegriffen wird, um Konsistenz und Wiederverwendbarkeit sicherzustellen. Die tabellarische Darstellung der Daten bildet eine Ausnahme, da diese spezifische Anforderungen an Layout, Interaktivität und Exportfunktionen stellt und daher weitgehend individuell umgesetzt wird.

Die gesamte Auswertung der Daten erfolgt clientseitig innerhalb der Komponente. Eine serverseitige Aggregation oder Vorverarbeitung findet nicht statt. Dieser Entwurfsansatz ist möglich, da die zugrunde liegenden Datenmengen durch den Server limitiert werden – standardmäßig auf maximal 20.000 Einträge. Die bisherige Nutzung und Performanzmessung im System zeigt, dass diese Datenmengen von modernen Browsern effizient verarbeitet werden können und eine clientseitige Umsetzung unter Berücksichtigung dieser Begrenzung als angemessen und performant einzustufen ist.

=== Komponenten

- server
- kachel
- Pivot-Tabellen-Komponente
- klasse zur datenverarbeitung
- feld listen (verfügbare felder, spalten, zeilen)
- felder haben filter
- visualisierungsadapter

=== datenverarbeitung

- hier weiß ich nicht so 100%, ob das wirklich benötigt ist, oder ob alle visualisierungslibraries mir hier die arbeit abnehmen
- hier werde ich zumindest mal die filter und die selektion der felder bearbeiten müssen


- hier könnte ich noch daten modell machen bzw. welchen zustand die kachel haben soll.
  - felder in Zeilen
  - felder in Spalten
  - ausgewählte visualisierung
  - ausgewählte Aggregationsfunktion
  - ausgewähltes feld für Aggregationsfunktion
  - ausgewählte filter
  - konfuguration (anzeige schlüsselfelder, aggragation von datumswerten)

=== Visualisierungsadapter

