# Aufgabe 1: Zielreduktion
Beim Zielreduktionsbaum handelt es sich um eine graphische Darstellung des Abarbeitungsprozesses von _PROLOG_. Es handelt sich gleichzeitig um eine besser lesbare Darstellung einer Ableitung mittels (SLD-) Resolution. Beachten Sie, daß _PROLOG_ die definiten (definite) Klauseln eines Programmes von oben nach unten und von links nach rechts abarbeitet (selective), und dass eine der beiden Resolventen stets die (aktuelle) Zielklausel ist (linear).

Gegeben sei das folgende _PROLOG_-Programm,

```prolog
p(X,X).
p(X,Z) :- 
    q(X,Y), 
    p(Y,Z).
q(a,b).
```

sowie eine Anfrage

```prolog
?- p(X,b).
```

a) Zeigen Sie anhand des Zielreduktionsbaums zu dieser Anfrage, daß die Anfrage Konsequenz aus dem _PROLOG_-Programm ist. Machen Sie für jeden Reduktions- bzw. Ableitungsschritt die Standardisierung sowie den Unifikator deutlich. Geben Sie die sich aus der Unifikator-Komposition ergebende Lösung für X an!

b) Ermitteln Sie auf gleiche Weise die zweite Lösung!

# Aufgabe 2: Tiefensuche im Graphen
Folgende Fakten definieren einen gerichteten azyklischen Graphen:

```prolog
knoten(n1).
knoten(n2). knoten(n3). knoten(n4).
knoten(n5). knoten(n6). knoten(n7).
nachbar(n1,n2). nachbar(n1,n3). nachbar(n1,n4).
nachbar(n2,n5). nachbar(n2,n6). nachbar(n2,n7).
nachbar(n3,n5). nachbar(n3,n6). nachbar(n3,n7).
nachbar(n4,n5). nachbar(n4,n6). nachbar(n4,n7).
start(n1).
```

Dabei bezeichnet knoten(X) einen Knoten im Graphen, nachbar(X,Y) eine Kante und start(X) die Quelle des Graphen. Mit dem Prädikat

```prolog
lösung(X) :- knoten(X), ist_lösung(X).
```

werden Zielknoten markiert. Im Beispiel oben soll noch

```prolog
ist_lösung(n6).
```

einen Zielknoten auszeichnen.

Die Menge der Zielknoten im Graphen ist durch folgende Relation charakterisiert:

∀X, Y : lösungen(X, Y) ⇔ start(X) ∧ erreichbar(X, Y) ∧ lösung(Y)

lösungen(X, Y) bekommt einen Knoten X als Eingabe und liefert eine Knotenmenge Y zurück. erreichbar(X, Y) ist wahr genau dann, wenn ein Pfad von X nach Y existiert.

a) Begründen Sie, dass erreichbar(X, Y) die transitive Hülle zu nachbar(X, Y) ist.

b) Implementieren Sie erreichbar(X, Y) in _PROLOG_!

c) Implementieren Sie lösungen(X, Y) in _PROLOG_!

d) Welches Ergebnis erhalten Sie für die Anfrage loesungen(n1,S)?

e) Erklären Sie das Ergebnis aus der vorherigen Teilaufgabe mit Hilfe der Definition von erreichbar(X, Y), dem gegebenen Graphen und der Suchstrategie von _PROLOG_!

# Aufgabe 3: Listen in Prolog
Listen werden in Prolog ebenso als geordnete Paare ausgedrückt. Die dafür verwendete Schreibweise sieht wie folgt aus: `[Kopf | Rest]`

a) Handelt es sich bei dem folgenden _PROLOG_-Ausdruck um eine Liste? Begründen Sie Ihre Antwort!

```prolog
[1,[2,3]|[4,5],6]
```

b) Schreiben Sie den folgenden _PROLOG_-Ausdruck ohne Verwendung des „|“-Funktors!

```prolog
[[1,2|[3]]|[4,5]]
```

c) Schreiben Sie ein _PROLOG_-Programm, das die Liste aus b) mit Hilfe des Listen-Konstruktors „.“ und der leeren Liste [] erzeugt!

# Aufgabe 4: Rekursion
a) Schreiben Sie jeweils restrekursiv und nicht-restrekursiv ein _PROLOG_-Prädikat, welches für eine gegebene (flache) Liste von Zahlen die Anzahl der in ihr enthaltenen Nullen berechnet!

b) Kodieren Sie ein Prädikat, das das Skalarprodukt zweier Vektoren (jeweils gegeben als _PROLOG_-Listen) berechnet!

c) Was müssen Sie an Ihrem Programm aus b) ändern, damit es nicht das Skalarprodukt selbst, sondern den (arithmetischen) Term berechnet, der zu diesem Skalar-Produkt gehört und der bei seiner Auswertung / Vereinfachung eben dieses Skalarprodukt liefert? Überprüfen Sie Ihr so modifiziertes Programm mit Hilfe des Prädikats `is`, mit dem man in _PROLOG_ bequem arithmetische Berechnungen durchführen kann!

d) Schreiben Sie ein Prädikat, das für eine gegebene natürliche Zahl errechnet, ob es sich dabei um eine Primzahl handelt!

e) Entwerfen Sie ein _PROLOG_-Prädikat, das eine vorgegebene Zahlenliste aufsteigend (um)sortiert!

# Aufgabe 5: Prolog
Jemand hatte die Aufgabe, ein _PROLOG_-Prädikat `perm` zu entwerfen, das der Reihe nach alle Permutationen einer gegebenen Liste berechnet. Als Tipp hatte man diesem Jemand empfohlen, dafür ein Hilfs-Prädikat `append` zu schreiben, das für zwei gegebene Listen deren Konkatenation berechnet.

Dabei entstand das folgende Programm:

```prolog
Permute(Liste,[Erstes|Element|Rest]) :-
    append(Liste1,[ErstesElement|Liste2],Liste),
    append(Liste1,Liste2,Lsite3),
    permute(Liste1,Rest,Rest1).
    
permute([],[]). /* Abbruchbedingung */

append([],Liste,Liste).

append([ErstesElement|Rest],Liste,[ErstesElement|Liste1]) :-
    append(Rest,Liste).
```

Dieses _PROLOG_-Programm enthält einige Fehler - offensichtliche syntaktische (Vertipper), aber auch kleinere semantische. Beheben Sie sie!