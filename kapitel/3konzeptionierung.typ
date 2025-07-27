#import "../utils.typ": todo, usecase

= Konzeptionierung

== Betrachtung alte Pivot-Tabellen-Komponente

Die bisher im CURSOR-CRM eingesetzte Pivot-Tabelle, folgend als "Pivot-V1" bezeichnet, zählt zu den funktional umfangreichsten Kacheln des Systems. Ähnlich wie Diagramm-Kacheln, KPI-Anzeigen oder die Suchergebnisliste unterstützt sie komplexere Analyse- und Auswertungsaufgaben basierend auf dem Infoboard-Kontext oder einer hinterlegten Suche.

#figure(
  image("../medien/pivot_v1.png", width: 80%),
  caption: "Pivot-V1 im CRM-System",
)

Fundamental bietet die bestehende Komponente alle wesentlichen Pivot-Funktionen.
Grundsätzlich ist die Komponente grob in zwei Teile, Konfiguration und Auswertung, unterteilt.
Die Konfiguration bildet einen Rahmen um die Auswertung und stellt Dropdowns für die Art der Darstellung und Aggregation sowie eine Liste der für die Auswertung verfügbaren Felder bereit.
Diese Felder kann man dann in die Zeilen und Spalten ziehen, um die Analyse nach diesen Feldern zu unterteilen. Zusätzlich kann man die Werte der Spalten und Zeilen sortieren

Für jedes verfügbare Feld kann man die betrachteten Werte über ein Dropdown eingrenzen. So kann man beispielsweise für eine Analyse von Angeboten nur die Abgeschlossenen in die Analyse miteinbeziehen. In dem Dropdown gibt ein Suchfeld, mit welchem man Werte suchen kann. So kann man einen gewünschten Wert schneller finden und muss diesen nicht in der Liste von potentiell vielen Werten suchen. Ebenso gibt es Buttons, mit welchen man alle Werte für die Eingrenzung aus- oder abwählen kann.

Eine weitere Konfigurationsmöglichkeit ist die Auswahl der Aggregatsfunktion, mit welcher die Datensätze zusammengefasst werden sollen. Zu diesen Aggregatsfunktionen gehören unter Anderem Anzahl, Summe, Durchschnitt und Median. Wird eine Aggregatsfunktion ausgewählt, welche Werte zusammenfasst, wie beispielsweise Summe oder Durchschnitt, wird automatisch ein Dropdown angezeigt, in welchem man auswählen kann, welches Feld der Datensätze aggregiert werden soll.

Basierend auf diesen Konfigurationen wird automatisch die Auswertung und Visualisierung der Analyse in der unteren Rechten Ecke der Komponente angezeigt.
Zusätzlich kann man die derzeitige Konfiguration mit einem Button in der unteren Leiste speichern, damit diese auch beim Neuladen der Kachel oder des Infoboards bestehen bleibt.

Abgesehen von der Konfiguration auf der Oberfläche der Pivot-Tabelle selbst, muss man ebenfalls weitere Konfigurationen in dem Kachel-Konfigurationsmenü vornehmen. Wenn man die Kachel auf einem Infoboard plaziert zeigt diese zuerst eine Fehlermeldung an, dass die Konfiguration fehlerhaft ist. Der Nutzer muss daraufhin das separate Konfigurationsmenü öffnen und dort mindestens die Datenquelle oder die hinterliegende Suche eintragen, wobei bei einer Suche der systeminterne Name verwendet werden muss. In diesem Menü kann man ebenfalls einstellen ob die Datumswerte nach Tag, Monat oder Jahr zusammengefasst werden sollen. Zudem kann man auswählen ob für Schlüssel der Schüsselname, die Beschreibung oder beides angezeigt werden soll.

//#todo("Bild von dem Kachel-Konfigurationsmenü einbinden")

Aus technischer Sicht basiert die alte Pivot-Kachel auf dem alten Kachel-V1-System und nutzt die inzwischen nicht mehr gepflegte Open-Source-Bibliothek „pivottable“@kruchten2025, welche selbst auf der jQuery-Bibliothek basiert. Die neuste Version dieser Bibliothek ist v2.23.0, welche vor 6 Jahren veröffentlicht wurde @pivot-old.
Insbesondere das veraltete Kachel-V1-System, welches in zukünftigen Versionen entfernt werden soll, macht eine Neuentwicklung erforderlich, wobei die fehlende Weiterentwicklung der eingesetzten Bibliothek die zukünftige Wartbarkeit zusätzlich erschwert.

#todo("pm fragen, welche technischen gründe es noch geben könnte, um die kachel neu zu entwickeln")

== Ziele der neuen Implementierung

/*
x- modernere technologien
x  - react
x  - moderne bibliotheken
- verbesserte nutzerfreundlichkeit
  - bessere konfiguration

- interne wartbarkeit und erweiterbarkeit
  - verwendung von internen komponenten
  - einheitliche oberfläche
- excelexport?
- hier nochmal auf den aspekt der einfachen datenanalyse eingehen (insbesondere zeigen, dass das wirklich wert hat)
*/

// Moderne Technologien und Bibliotheken
Die Neuentwicklung der Pivot-Kachel hat das grundlegende Ziel die Komponente in das Kachel-V2-System zu bringen, wodurch die alte, auf dem Kachel-V1-System basierende Komponente, aus dem CRM-System entfernt werden kann.
Zusätzlich sollen die nicht mehr gewarteten Bibliotheken durch neue Bibliotheken ersetzt werden, welche mit React und somit dem Kachel-V2-System kompatibel sind.

// Fokus auf bestehende bibliotheken
Dabei sollen bevorzugt Bibliotheken eingesetzt werden, die bereits in anderen Bereichen des Systems genutzt werden. Eine reduzierte Anzahl verwendeter Bibliotheken senkt die Komplexität des Systems und erleichtert die Pflege der Abhängigkeiten. Insbesondere für die Visualisierung der Diagramme sollen die bewährten Bibliotheken aus der bestehenden Charts-Komponente wiederverwendet werden, um bei den Visualisierungen ein konsistentes Oberflächendesign sicherzustellen.

// interne komponenten sowie wartbarkeit und erweiterbarkeit

Ein weiteres Ziel der Neuentwicklung ist die stärkeren Nutzung von internen, wiederverwendbaren Komponenten, welche im Rahmen des Kachel-V2-Systems zur Verfügung stehen. Dadurch wird die Codebasis vereinheitlicht und gängige UI-Komponente systemweit konsistent gestaltet. Dies trägt ebenso zur Erhöhung der Wartbarkeit bei, da Anpassungen an zentralen Komponenten direkt an allen relevanten Stellen wirksam werden. Im Vergleich dazu bietet die Bibliothek der alten Pivot-V1-Komponente keine Möglichkeit die UI-Elemente anzupassen.
// Quelle: https://github.com/nicolaskruchten/pivottable/wiki/Parameters

Gleichzeitig soll die Erweiterbarkeit der neuen Pivot-Kachel für die Entwicklung deutlich verbessert werden. Die Architektur der Komponente soll so gestaltet werden, dass zukünftige Funktionserweiterungen, wie beispielsweise die Integration neuer Visualisierungen, mit geringem Entwicklungsaufwand möglich sind.

// nutzerfreundlichkeit

Ein weiterer Schwerpunkt der Neuentwicklung und das Hauptmerkmal der Pivot-V2 ist die Verbesserung der Nutzerfreundlichkeit.
Insbesondere die Abhängigkeit der Konfiguration über das Kachel-Konfigurationsmenü soll reduziert werden und die wichtigsten Konfigurationen, unter Anderem auch die Auswahl der Datenquelle, sollen innerhalb der Kachel verfügbar sein.
In der Pivot-V1-Komponente wird ein Fehler angezeigt wenn die Kachel neu auf einem Infoboard hinzugefügt wird und noch keine Datenquelle konfiguriert ist.

Im Gegensatz dazu wird im Kachel-V2-System der sogenannte "Datasource-Editor" angeboten.
Dieser wird angezeigt, wenn die Kachel noch keine Datenquelle konfiguriert hat.
Der Datasource-Editor ist eine Maske, welche auf der Kachel selbst angezeigt wird. Sie ermöglicht es dem Nutzer eine Datenquelle auszuwählen. Verglichen zu dem Kachel-Konfigurationsmenü muss der Nutzer eine Suche nicht mit dem technischen Namen angeben, sondern kann diese über ein Feld anhand deren Anzeigenamen suchen und auswählen. Sobald der Nutzer eine Datenquelle ausgewählt hat, wird diese automatisch in der Konfiguration eingetragen und die Kachel ist funktionsbereit.

Darüber hinaus ist vorgesehen, den bisher separaten Button zum Speichern der derzeitigen Konfiguration der Pivot-Kachel zu entfernen. Stattdessen soll das Speichern zukünftig implizit erfolgen, sodass Konfigurationsänderungen automatisch übernommen werden und über ein Neuladen der Kachel hinweg persistieren.

Da die Pivot-V1-Komponente in einigen Kundensystemen weiterhin verwendet wird, soll eine automatisierte und möglichst reibungslose Migration bestehender Konfigurationen auf die neue Pivot-V2-Komponente implementiert werden. Ziel ist es, die bisher verwendeten Einstellungen weitgehend zu übernehmen, um den Umstieg für Anwender zu erleichtern und zusätzliche Konfigurationaufwände zu vermeiden.

== Anforderungen

/*
- betrachtung der stakeholder (kunde, produktmanagement, entwickler, (berater?))
- zusammen mit dem product management erarbeitet
- migration von v1 zu v2 von den kacheleinstellungen
- woran messe ich die qualität?
  - ansi softwarequalitätskriterien
- funktionale und nicht funktionale anforderungen
- abnahmekriterien
- umfrage?
- die typischen anwendungsfälle
  - userstories?
  - konfiguration
*/

=== Nicht funktionale Anforderungen

#todo("Nicht funktionale Anforderungen")

- usability
- performance
- wartbarkeit/erweiterbarkeit (insbesondere neue visualisierungen)
- zum system einheitliches design
- verwendung von standart komponenten
- minimaler einsatz von neuen bibliotheken

=== Anwendungsfälle

Zur Festlegung der funktionalen Anforderungen an die Pivot-Tabellen-Komponente wurden verschiedene Anwendungsfälle erarbeitet, die verdeutlichen, welche konkreten Nutzungsszenarien durch die Komponente unterstützt werden sollen. Die Formulierung und Strukturierung dieser Anwendungsfälle orientiert sich an der Methodik von Alistair Cockburn, wie sie in seinem Werk Writing Effective Use Cases beschrieben ist @cockburn2012. Eine Auswahl besonders relevanter Anwendungsfälle wird im Folgenden im Detail dargestellt.

- Anwendungsfall 1: Konfiguration der Datenquelle
- Anwendungsfall 2: Anzeigen der Verfügbaren Felder
- Anwendungsfall 3: Felder in die Spalten einfügen
- Anwendungsfall 4: Felder in die Zeilen einfügen
- Anwendungsfall 5: Auswahl einer Visualisierung
- Anwendungsfall 6: Auswahl einer Aggregationsfunktion
- Anwendungsfall 7: Auswahl eines Aggregationsfeldes
- Anwendungsfall 8: Aus- / Eingrenzen von Werten eines Feldes
- Anwendungsfall 9: Erzeugen der Auswertung
- Anwendungsfall 10: Mit Klick auf die Visualisierung eine Suche mit den relevanten Datensätzen öffnen
- Anwendungsfall 11: Datumsfelder nach Tag, Monat oder Jahr aggregieren
- Anwendungsfall 12: Schlüsselwerte als Schlüssel und/oder Beschreibung anzeigen

/*
- Optional
  - Ausblenden von Konfigurationsrahmen
  - Sperren und Entsperren der Konfiguration über Kachel-Konfigurationsmenü. (usecase wäre, dass ein consultant eine kachel konfiguriert und der user sich nicht um die konfiguration kümmern muss. setzt aber vorraus, dass man diese konfiguration auch irgendwie speichern kann)
  - Excel export
*/

#usecase(
  1,
  "Konfiguration der Datenquelle",
  "Kachel mit gewünschter Datenquelle konfigurieren",
  vorbedingung: "Keine",
  nachbedingung: "Kachel wurde mit einer Datenquelle konfiguriert und ist funktionsbereit",
  fehlernachbedingung: "Fehlermeldung wird angezeigt und Konfiguration wird automatisch neugestartet",
  ausloeser: "Kachel wird auf einem Infoboard hinzugefügt",
  ablauf: [
    1. Kachel wird auf ein Infoboard gezogen
    2. Der Nutzer gibt den Anzeigenamen einem Suchfeld ein
    3. Es wird eine Liste von Suchen dem Nutzer vorgeschlagen
    4. Der Nutzer wählt die gewünschte Suche aus
    5. Die gewählte Suche wird in die Konfiguration übernommen
    6. Konfigurationsmaske schließt sich und Kachel läd mit Inhalt
  ],
  erweiterung: [
    - 1a. Kachel wird auf Infoboard im Unterbereich plaziert
      - 1a1. Datenquelle wird automatisch auf den Unterbereich gesetzt 
  ]
)

#todo("Weitere Anwendungsfälle")

== Mockups

// mockups. zuerst das mockup zeigen und dann erklären was darauf zu sehen ist und welche anderen

/*
- hier vielleicht auf das alte design eingehen und "modernisieren"
- was sind die probleme von dem alten design und wie verbessere ich diese mit dem neuen
- vielleicht ein modus mit dem man den konfigurationsrahmen verstecken kann.
- komponenten identifizieren, die man aus dem standard wiederverwenden kann
*/

Die folgenden Mockups zeigen die geplante Benutzeroberfläche der neuen Pivot-Tabellen-Komponente und veranschaulichen die wesentlichen Interaktionselemente. Dazu wird der typische Arbeitsablauf beschrieben, den Nutzer bei der Konfiguration und Verwendung der Pivot-Tabelle durchlaufen.

#figure(image("../medien/datasource_selector.png"),caption: "Mockup des Datasource-Selectors")

/*
- Erste Ansicht sobald Kachel auf ein Infoboard gezogen wird
- Aufforderung, dass der Nutzer die eine Datenquelle auswählen soll
- Suchfeld in der Mitte
- Liste von Suchergebnissen
- User klick aut eine Suche
- User klickt auf bestätigen
- Datenquelle wird in der Konfiguration gespeichert und Hauptansicht wird automatisch geladen
*/

Nachdem die Kachel auf einem Infoboard plaziert wurde, wird zunächst der Datasource-Selector angezeigt. In dieser ersten Ansicht wird der Nutzer dazu aufgefordert, eine Datenquelle bzw. Suche auszuwählen. Im Zentrum der Oberfläche befindet sich ein Suchfeld, über das die verfügbaren Datenquellen gesucht werden können. Sobald der Nutzer eine Eingabe tätigt, wird unter der Suchleiste eine Liste der passenden Suchergebnisse angezeigt.
Der Nutzer kann ein Suchergebnis aus der Liste anklicken, um es zu übernehmen.
Nach Auswahl der Datenquelle drückt der Nutzer auf den "Übernehmen"-Button.
Dadurch wird gewählte Datenquelle in der Konfiguration der Kachel gespeichert.
Nachdem die Datenquelle konfiguriert wurde, wird die Hauptansicht der Pivot-Tabelle automatisch geladen.


#figure(image("../medien/mockup1.png"),caption: "Mockup der Pivot-Tabelle")

/*
- Unterteilt in mehrere Abschnitte
- Oben links auswahl der Visualisierung
- Darunter Auswahl der Aggregation
- Rechts oben ist eine Liste von verfügbaren Feldern
- Unten rechts am größten ist die Visualisierung
- Die Visualisierung wird automatisch neu generiert, sobald sich die konfiguration ändert (felder,aggregation,visualisierung)
- Links und überhalb davon sind die Felder der Zeilen bzw. Spalten
- Oben rechts in der ecke ist ein button zum öffnen der weiteren Konfiguration (darstellung schlüssel, aggregation datumswerte)
- Die Felder haben ein Button zum öffnen des Filters
*/

Die Hauptansicht der Pivot-Tabellen-Komponente ist in mehrere Bereiche unterteilt. Im oberen linken Bereich befindet sich die Auswahl der Visualisierungsart, darunter ist die Auswahl der Aggregationsfunktion. Im rechten oberen Bereich wird eine Liste verfügbarer Felder angezeigt, aus der Elemente per Drag-and-Drop in die Auswertung übernommen werden können. Die eigentliche Visualisierung nimmt den unteren rechten Bereich ein und bildet den größten Bereich der Oberfläche.

Die in der Analyse verwendeten Felder werden links und oberhalb der Visualisierung dargestellt.
Die im linken Bereich platzierten Felder definieren die Zeilen beziehungsweise die Y-Achse der Auswertung, während die oberhalb angeordneten Felder den Spalten beziehungsweise der X-Achse zugeordnet sind.
Felder können per Drag-and-Drop zwischen der Liste der verfügbaren Felder und den Bereichen für Zeilen und Spalten verschoben werden.

Darüber hinaus verfügen die einzelnen Felder über einen Button zum Ausklappen des jeweiligen Filterdialogs.
Sobald sich eine Konfiguration ändert, wie etwa durch Auswahl eines anderen Visualisierungstyps, einer neuen Aggregationsfunktion oder das verschieben von Feldern, wird die Visualisierung automatisch aktualisiert.
In der rechten oberen Ecke befindet sich ein Button, über den zusätzliche Konfigurationseinstellungen geöffnet werden können, beispielsweise zur Darstellung von Schlüsseln oder zur Aggregation von Datumswerten.


#figure(image("../medien/filter.png", height: 10cm),caption: "Mockup der Werteeingrenzung")

/*
- Eine Suchleiste, um Werte zu suchen
- Liste der Werte mit checkboxen, ob diese in die Auswertung miteinbezogen werden
- Unten Buttons, um alle Werte aus-/abzuwählen
- Oben rechts Button, zum schließen des Popups
- Alternativ klick außerhalb, um das popup wieder zu schließen
*/

Der Filterdialog ermöglicht eine gezielte Eingrenzung der in die Auswertung einbezogenen Werte der jeweiligen Felder. Im oberen Bereich befindet sich eine Suchleiste, über die die angezeigten Werte gefiltert werden können. Darunter wird eine Liste aller verfügbaren Werte angezeigt. Die Werte haben jeweils eine Checkbox, über die der Nutzer festlegen kann, ob der entsprechende Wert in die Auswertung aufgenommen werden soll.

Am unteren Rand des Dialogs befinden sich Schaltflächen, mit denen alle Werte gleichzeitig ausgewählt oder abgewählt werden können. Zum Schließen des Dialogs steht ein Button in der oberen rechten Ecke zur Verfügung. Alternativ kann das Dialogfenster auch durch einen Klick außerhalb des Popups geschlossen werden.


#todo("Mockup Tabelle? (eigentlich noch unklar wie, da eventuell hier ein Bibliothek benutzt wird)")