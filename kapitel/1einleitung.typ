#import "../utils.typ": todo

= Einleitung

== Motivation

In der heutigen datengetriebenen Geschäftswelt spielen Customer Relationship Management (CRM)-Systeme eine zentrale Rolle bei der Kundengewinnung, -bindung sowie beim Aufbau und der Pflege langfristiger Kundenbeziehungen @becker2019[S. 342]. CRM-Systeme erfassen und verarbeiten dabei eine Vielzahl von Informationen – von Kundenkontakten und Interaktionen über Verkaufschancen bis hin zu Serviceanfragen und -tickets.

Doch die bloße Verfügbarkeit großer Datenmengen führt nicht automatisch zu besseren Entscheidungen. Ohne benutzerfreundliche und leistungsfähige Analysetools bleibt das Potenzial dieser Daten weitgehend ungenutzt. Besonders Vertriebs- und Marketingteams stehen regelmäßig vor analytischen Fragestellungen wie: „In welchen Regionen sind unsere Produkte im letzten Jahr unterdurchschnittlich gelaufen?“ oder „Wie hat sich der Umsatz nach Vertriebsregionen in den letzten drei Jahren entwickelt?“ Solche Fragen zielen darauf ab, Entwicklungen nachzuvollziehen und aufkommende Trends frühzeitig zu erkennen, um fundierte strategische Entscheidungen treffen zu können @becker2019[S. 345].

Pivot-Tabellen sind ein bewährtes Mittel, um genau solche Fragestellungen interaktiv und effizient zu beantworten. Sie ermöglichen es den Nutzern, komplexe Datenbestände flexibel und intuitiv zu gruppieren, zu aggregieren und auszuwerten. Beispielsweise können Verkaufszahlen nach Vertriebsregion, Jahr oder Kundensegment gegliedert und analysiert werden. Dabei lassen sich zentrale Kennzahlen wie Umsätze oder Stückzahlen mithilfe von verschiedenen Aggregationsfunktionen (Summe, Durchschnitt, etc.) berechnen und übersichtlich in Tabellenform darstellen. Ergänzend dazu bieten weitere mögliche Visualisierungsmöglichkeiten der Pivot-Tabelle wie Balken-, Linien- oder Kreisdiagramme eine anschauliche Aufbereitung der Ergebnisse, wodurch sich Muster und Entwicklungen schneller erfassen und kommunizieren lassen.

Die Implementierung einer Pivot-Komponente direkt im CRM-System bietet aus technischer und organisatorischer Sicht mehrere Vorteile.
Insbesondere ermöglicht sie die Nutzung der Datensätze an zentraler Stelle im System, wo die Daten bereits erfasst und gepflegt werden.
Dadurch entfällt die Notwendigkeit, die Daten in externe Anwendungen zu exportieren und dort weiterzuverarbeiten, was mit zusätzlichem Aufwand und potenziellen Inkonsistenzen verbunden sein kann.

Darüber hinaus erleichtert die Integration einer solchen Komponente die Einbettung analytischer Methoden in bestehende Arbeitsabläufe und Prozesse.
Anwender können direkt innerhalb der vertrauten CRM-Systemumgebung Auswertungen interaktiv erstellen und nutzen, ohne zwischen verschiedener Software wechseln zu müssen. Auf diese Weise kann die Auswertung vorhandener Daten, sowie die darauf aufbauende Entscheidungsfindung, unterstützt werden.

== Zielsetzung

Das Ziel dieser Bachelorarbeit ist die Konzeption und Umsetzung einer Pivot-Tabellen-Komponente im Kontext des CURSOR-CRM-Systems (https://www.cursor.de).
Es stellt über sogenannte Infoboards eine Oberfläche bereit, auf der verschiedene Kacheln platziert werden können. Diese Kacheln ermöglichen unter anderem Datenvisualisierungen und -analysen. Die Komponenten lassen sich flexibel in das Infoboard einfügen und können dabei auf den Kontext der jeweiligen Umgebung als Datenquelle zurückgreifen.

Die entwickelte Komponente soll als eine "Infoboard-Kachel" in die bestehende Systemarchitektur integriert werden und somit Zugriff auf die vorhandenen Datenquellen, wie Suchen, Masken und Unterbereiche, haben, sowie eine einheitliche Oberfläche zur Konfiguration der Komponente anbieten. 

Im System existiert bereits eine Pivot-Tabellen-Komponente für Infoboards. Diese basiert jedoch auf veralteten Technologien, die im kommenden Jahr aus dem System entfernt werden sollen. Darüber hinaus hat die derzeitige Version nur begrenzte Anpassungsmöglichkeiten an kundenspezifische Anforderungen. Aus diesen Gründen ergibt sich der Bedarf für die Entwicklung einer aktualisierten, flexibler einsetzbaren und zukunftssicheren Version.

Die Integration in bestehende Arbeitsprozesse sowie CRM-Funktionalitäten stehen bei der Umsetzung im Vordergrund.
Die Komponente soll so gestaltet sein, dass sie für den Nutzer einfach konfigurierbar und intuitiv bedienbar ist.
Zudem soll die Komponente performant sein, um auch bei großen Datenmengen eine flüssige Benutzererfahrung zu bieten.
Des Weiteren soll die entwickelte Komponente die firmeninternen Entwicklungsstandards einhalten sowie bestehenden Code wiederverwenden, damit sie vom Entwicklungsteam auch in Zukunft einfach gewartet werden kann.

== Methodik

#todo("dashier nochmal angucken")

Die Arbeit wird in mehrere aufeinanderfolgende Phasen gegliedert.

Zu Beginn erfolgt eine Anforderungsanalyse, auf deren Grundlage die Konzeption der Pivot-Komponente entwickelt wird. Im Anschluss daran wird ein technischer Entwurf erstellt, bei dem auch geeignete externe Bibliotheken hinsichtlich ihrer Eignung und Kompatibilität untersucht werden.

Die Implementierung der Komponente erfolgt iterativ. In einer ersten Phase wird ein unabhängiger Prototyp entwickelt, der zunächst losgelöst vom CURSOR-CRM-System funktioniert. Nach Fertigstellung eines funktionsfähigen Prototyps erfolgt die Integration in die CRM-Umgebung, einschließlich der Implementierung erforderlicher Schnittstellen. Dabei werden bestehende Systemlogiken und Bibliotheken, soweit möglich, übernommen und wiederverwendet.

Parallel zur technischen Entwicklung werden fortlaufend Usability-Tests durchgeführt, um frühzeitig Rückmeldungen zur Benutzerfreundlichkeit zu erhalten und diese in den Entwicklungsprozess einfließen zu lassen.