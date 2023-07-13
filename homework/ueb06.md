# Aufgabe 1: Zähle Elemente einer Liste
Implementieren Sie die Funktion `zaehle_elemente/3` in Prolog, die ein spezifisches Element in einer Liste zählt und folgende Anforderungen erfüllt:

1. Die Funktion sollte die Anzahl eines spezifischen Elements in einer Liste zählen können, wenn als Eingabe das zu zählende Element, eine Liste und eine Variable gegeben sind.
2. Die Funktion sollte in der Lage sein zu überprüfen, ob die Anzahl eines spezifischen Elements in einer Liste korrekt ist, wenn als Eingabe das zu zählende Element, eine Liste und eine Zahl gegeben sind. In diesem Fall sollte die Funktion `true` zurückgeben, wenn die Anzahl korrekt ist, und `false` sonst.
3. Die Funktion sollte in der Lage sein, alle Elemente einer Liste aufzuzählen und ihre Häufigkeit zu bestimmen, wenn als Eingabe eine Variable, eine Liste und eine weitere Variable gegeben sind.

Verwenden Sie Cuts, um unnötige Backtracking-Schritte zu vermeiden und um zu gewährleisten, dass die Funktion in alle Richtungen korrekt arbeitet.

### Beispiele

Die Funktion könnte beispielsweise wie folgt aufgerufen werden:

```

?- zaehle_elemente(a, [a, b, a, c, a, d, a], N).
N = 4.

?- zaehle_elemente(a, [a, b, a, c, a, d, a], 4).
true.

?- zaehle_elemente(E, [a, b, a, c, a, d, a], N).
E = a, N = 4 ;
E = b, N = 1 ;
E = c, N = 1 ;
E = d, N = 1.
```

# Aufgabe 2: Multidirektionale Fakultät
Programmieren Sie die Fakultätsfunktion multidirektional in Prolog, dabei soll sie folgenden Kriterien genügen:

1. Wenn als Eingabe eine natürliche Zahl gegeben ist, soll die Funktion die Fakultät dieser Zahl berechnen.
2. Wenn eine Fakultätszahl gegeben ist, soll die Funktion die dazugehörige natürliche Zahl berechnen, oder `false` zurückgeben, wenn die Eingabe keine Fakultätszahl ist.
3. Wenn beide Variablen unbekannt sind, soll die Funktion Paare von natürlichen Zahlen und ihren zugehörigen Fakultäten der Reihe nach aufzählen.

Zur Unterscheidung der Fälle sollen die Prolog-Prädikate `nonvar` und `var` verwendet werden.

### Beispiele

Ihre Fakultätsfunktion könnte etwa folgendermaßen aufgerufen werden:

```
?- fac(N, 120).
N = 5.
?- fac(5, F).
F = 120.

?- fac(N, F).
N = 0, F = 1 ;
N = 1, F = 1 ;
N = 2, F = 2 ;
N = 3, F = 6 ;
N = 4, F = 24 ;
N = 5, F = 120 ;
...
```

# Aufgabe 3: Collatz in Prolog
Implementieren Sie eine Prolog-Funktion namens `collatz/2`, die mit der Collatzfolge arbeitet und die folgenden Anforderungen erfüllt:

1. Wenn als Eingabe eine natürliche Zahl und eine Variable gegeben sind, sollte die Funktion die Collatzfolge für diese Zahl generieren.
2. Wenn als Eingabe eine natürliche Zahl und eine Liste gegeben sind, sollte die Funktion überprüfen, ob die Liste die korrekte Collatzfolge für diese Zahl ist. Wenn die Liste die korrekte Collatzfolge ist, sollte die Funktion `true` zurückgeben, und `false`, wenn nicht.
3. Wenn beide Variablen unbekannt sind, sollte die Funktion der Reihe nach alle Collatzfolgen für alle natürlichen Zahlen generieren.

Die Collatzfolge für eine Zahl `n` wird wie folgt generiert:

- Beginne mit `n`.
- Wenn `n` gerade ist, teile `n` durch 2.
- Wenn `n` ungerade ist, multipliziere `n` mit 3 und addiere 1.
- Wiederhole die Schritte, bis `n` einem Wert der zuvor schon vorkam entspricht.

Die Funktion sollte so strukturiert sein, dass sie in alle Richtungen korrekt arbeitet.

### Beispiele

Die Funktion könnte beispielsweise wie folgt aufgerufen werden:

```

?- collatz(5, L).
L = [5, 16, 8, 4, 2, 1].

?- collatz(5, [5, 16, 8, 4, 2, 1]).
true.

?- collatz(N, L).
N = 1, L = [1, 4, 2] ;
N = 2, L = [2, 1, 4] ;
N = 3, L = [3, 10, 5, 16, 8, 4, 2, 1] ;
N = 4, L = [4, 2, 1] ;
N = 5, L = [5, 16, 8, 4, 2, 1] ;
...
```