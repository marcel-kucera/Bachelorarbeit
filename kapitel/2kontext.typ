#import "../utils.typ": todo

= Kontext

== Pivot-Tabellen

Pivot-Tabellen sind ein hilfreiches Werkzeug zur Datenanalyse und zum Reporting. Häufig werden sie im Zusammenhang mit Tabellenkalkulationssoftware wie Microsoft Excel verwendet, wo sie es ermöglichen, große Datenmengen interaktiv zu gruppieren, zu filtern, zu aggregieren und zu visualisieren.

Das Grundprinzip besteht darin, Datenfelder in Zeilen- und Spaltenachsen anzuordnen. Dabei werden numerische Werte aus einem anderem Feld der jeweiligen Daten an den Kreuzungen aggregiert, beispielsweise als Summe oder Durchschnitt. Über Filterfunktionen lassen sich spezifische Ausschnitte der Daten betrachten. So kann beispielsweise ausgewertet werden, wie viele Produkte ein bestimmter Vertriebsmitarbeiter in einem Monat verkauft hat.

Moderne Pivot-Tabellen ergänzen die tabellarische Ansicht häufig durch Diagramme wie Balken- oder Kreisdiagramme, um Muster und Trends besser sichtbar zu machen. Insgesamt abstrahieren Pivot-Tabellen SQL-ähnliche Operationen in einer benutzerfreundlichen Oberfläche, sodass auch fachliche Anwender komplexe Datenanalysen ohne Programmier- oder Datenbankkenntnisse durchführen können.

#figure(
  image("../medien/pivottabelle_beispiel.png", width: 80%),
  caption: [Beispiel einer Pivottabelle mit Summierung der Auftragswerte @react-pivottable],
)

#pagebreak()

== CURSOR-CRM

Das CURSOR-CRM ist ein Customer Relationship Management System, das Unternehmen bei der strukturierten Erfassung, Verwaltung und Auswertung ihrer Kunden- und Geschäftsdaten unterstützt. Eine zentrale Funktion des Systems besteht in der Speicherung verschiedenartiger Daten, welche Entitäten genannt werden. 

Entitäten beschreiben eine Klasse gleichartiger Datenobjekte. Sie definieren die Felder und Eigenschaften der jeweiligen Datensätze, wie zum Beispiel Geschäftspartner, Mitarbeitende, Angebote oder Aktivitäten. Jeder Datensatz gehört zu einer bestimmten Entität und kann mit anderen Datensätzen verknüpft sein. Die Anzeige und Bearbeitung der einzelnen Datensätze erfolgt über sogenannte Masken, in denen die zugehörigen Felder benutzerfreundlich dargestellt werden. Diese Masken sind anpassbar und lassen sich durch Scripting erweitern, um individuelle Anforderungen und Prozesse abzubilden.

#figure(
  image("../medien/screenshot_crm_maske.png", width: 100%),
  caption: [Screenshot des CURSOR-CRM auf der Maske für einen Geschäftspartner],
)

Das CURSOR-CRM lässt sich flexibel an individuelle Unternehmensanforderungen anpassen. Neue Entitäten können hinzugefügt und bestehende modifiziert werden. Über vielfältige Schnittstellen ist zudem eine Integration mit externen Systemen möglich, sodass ein reibungsloser Datenaustausch innerhalb bestehender IT-Landschaften gewährleistet ist.

Im CURSOR-CRM stehen sogenannte „Suchen“ zur Verfügung, mit denen Anwender gezielt Daten anhand bestimmter Kriterien auffinden können. Diese Suchen sind ein zentraler Bestandteil des Systems und ermöglichen es, nicht nur innerhalb einzelner Entitäten zu filtern, sondern auch über deren Beziehungen hinweg komplexe Datenabfragen durchzuführen. Nutzerinnen und Nutzer haben dabei die Möglichkeit, eigene Suchen zu erstellen und individuell anzupassen. Zudem lässt sich festlegen, welche Felder in den Suchergebnissen angezeigt werden, sodass die Darstellung exakt auf die jeweiligen Anforderungen abgestimmt werden kann.



== Infoboards und Kacheln im CURSOR-CRM

Infoboards im CURSOR CRM dienen als flexible Oberfläche zur Visualisierung und Strukturierung von Informationen. Sie können in unterschiedlichen Kontexten eingesetzt werden, etwa in Dashboards, innerhalb von Masken oder den Unterbereichen der Masken, wo die verknüpften Entitäten angezeigt werden. Auf diesen Infoboards lassen sich sogenannte Kacheln platzieren, die individuell konfigurierbar sind und unterschiedliche Funktionen übernehmen können.

Kacheln ermöglichen es, kontextbezogene Daten dynamisch zu verarbeiten und visuell aufzubereiten. Dabei greifen sie auf Informationen aus dem jeweiligen Anzeigekontext zu, verarbeiten diese und stellen sie in geeigneter Form für den Nutzer dar. Typische Anwendungsbeispiele sind ToDo-Listen, die offene Aktivitäten anzeigen, grafische Darstellungen wie Diagramme oder einfache tabellarische Auflistungen relevanter Datensätze. 
Die Anordnung der Kacheln auf einem Infoboard kann per Drag-and-Drop angepasst werden, wodurch sich individuelle Arbeitsoberflächen schnell und intuitiv gestalten lassen.
Kacheln lassen sich über ein Konfigurationsmenü individuell anpassen, wobei neben allgemeinen Einstellungen wie Inhalt, Darstellung und Sortierung auch kachelspezifische Optionen zur Verfügung stehen.


=== Kachel V1 zu V2

Im aktuellen System existieren zwei Versionen des Kachel-Systems, die sich hinsichtlich ihrer technologischen Grundlage unterscheiden. Die erste Version, welche als Kachel V1 bezeichnet wird, basiert auf klassischen Webtechnologien wie Vanilla JavaScript, HTML und CSS. Diese Variante ist funktional weiterhin im Einsatz, soll jedoch perspektivisch vollkommen durch die modernere Lösung Kachel V2 ersetzt werden.

Das neue Kachel V2 System basiert auf dem JavaScript-Framework React. Durch die Verwendung von React ist es möglich, auf eine bestehende Sammlung von wiederverwendbaren Komponenten innerhalb des CURSOR-CRM zuzugreifen. Dies ermöglicht ein konsistenteres Erscheinungsbild zwischen der Systemoberfläche und den Kacheln und kann die Entwicklung und Wartung neuer Kacheln erleichtern. Darüber hinaus bietet diese zweite Version eine verbesserte Wart- und Erweiterbarkeit, da sie auf modernen Entwicklungsstandards aufbaut.

#todo("in erfahrung bringen warum genau gewechselt wird")

== React

React ist eine von Meta entwickelte JavaScript-Bibliothek zur Erstellung dynamischer Benutzeroberflächen. Sie basiert auf einer komponentenbasierten Architektur, bei der wiederverwendbare UI-Elemente, sogenannte Komponenten, sowohl Struktur als auch Verhalten kapseln. Dies ermöglicht eine modulare und übersichtliche Entwicklung komplexer Webanwendungen.

Ein zentrales Konzept von React ist der Virtual DOM, eine abstrahierte Repräsentation des tatsächlichen DOM im Speicher. Änderungen am Anwendungszustand werden dort simuliert und durch einen Vergleichsalgorithmus gezielt und effizient auf den realen DOM übertragen. Dadurch wird die Performance bei der Darstellung dynamischer Inhalte deutlich verbessert.

React folgt einer deklarativen Programmierweise. Entwicklerinnen und Entwickler beschreiben den gewünschten UI-Zustand, während React sich um dessen Umsetzung kümmert. Zum Einsatz kommt dabei JSX, eine Syntaxerweiterung, die HTML-ähnliche Strukturen direkt in JavaScript integriert. Das erleichtert die Strukturierung und Wartung von Komponenten.

React ist als Bibliothek konzipiert und konzentriert sich hauptsächlich auf die Darstellung von Benutzeroberflächen. Durch diesen modularen Aufbau lässt sich React problemlos in bestehende Anwendungen integrieren, beispielsweise um einzelne UI-Komponenten schrittweise zu modernisieren oder interaktiver zu gestalten. Gleichzeitig besteht jedoch auch die Möglichkeit, mit Hilfe von darauf aufbauenden Frameworks komplette Anwendungen umzusetzen.

#todo("typescript?")