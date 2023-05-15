## Aufgabe 1: Higher-Order Funktionen
In Racket gibt es die sogenannten Funktionen höherer Ordnung, welche Listenoperationen auf ganzen Listen ausführen können. Dazu zählen unter anderen z.B. `map`, `filter`, `foldl`, `foldr`, `apply` und `member`

#### Teil 1: Funktionen definieren
Recherchieren Sie die Funktionsweise der oben genannten Funktionen und definieren Sie Ihre eigenen Varianten davon in Racket mithilfe der Grundfunktionen zu Listen (wie z.B. `car`, `cdr`, `cons`, `append`, `length`). Geben Sie Ihren Funktionen eigene Namen (z.B. `my-map`, `my-filter`, etc.) und testen Sie diese an selbst gewählten Beispielen auf ihre Funktionsweise gemäß der Vorlagen.

#### Teil 2: Anwendung der Funktionen
Gegeben ist eine Liste von Zahlen. Ihre Aufgabe ist es, die folgenden Schritte auszuführen:
1.  Erstellen Sie eine neue Liste, die nur die ungeraden Zahlen dieser gegebenen Liste enthält.
2.  Wenn die 4 Teil der gegebenen Liste ist, quadrieren Sie alle Zahlen in der neuen Liste.
3.  Wenn die **Quersumme** der Zahlen der daraus resultierenden Liste durch 5 teilbar ist, drehen Sie die Liste um.
4.  Berechnen Sie die Differenz der Zahlen aus der resultierenden Liste von links nach rechts.

Verwenden Sie Ihre Funktionen, um diese Aufgabe zu lösen. Versuchen Sie, Ihre Lösung so effizient und elegant wie möglich zu gestalten. Hat die Verwendung ihrer Funktionen die Lösung dieser Aufgabe vereinfacht?

## Aufgabe 2: Primfaktorzerlegung
Definieren Sie eine Funktion `(primfak n)`, die eine gegebene Zahl `n` in ihre Primfaktoren zerlegt. Sie dürfen unter anderen dabei die Funktionen aus der Aufgabe 3-5 verwenden.

Die Funktion `(primfak n)` soll dabei eine Liste der Primfaktoren von `n` in aufsteigender Reihenfolge zurückgeben. Mehrfach auftretende Primfaktoren sollten entsprechend ihrer Häufigkeit in der Liste auftauchen.  

Testen Sie Ihre Funktion `(primfak n)` mit verschiedenen Eingaben und stellen Sie sicher, dass sie die korrekten Ergebnisse liefert. Multiplizieren Sie dabei zur Probe alle Zahlen aus der Liste der Primfaktoren auf!

## Aufgabe 3: Mengenrepräsentation als Binäre Suchbäume
Gegeben seien die folgenden (unvollständigen) Definitionen zur Repräsentation von Mengen als binäre Suchbäume:
```racket
; binäre Bäume
(define the-empty-tree '())
(define (empty-tree? tree) 
  (eq? tree the-empty-tree))
(define (entry tree) 
  (car tree))
(define (left-branch tree) 
  (cadr tree))
(define (right-branch tree) 
  (caddr tree))
(define (make-tree entry left right) 
  (list entry left right))

; Mengenkonstruktor und leere Menge
(define (make-set liste) 
  (liste->baum liste))
(define the-empty-set the-empty-tree)
(define (empty-set? set) 
  (empty-tree? set))

; Prüfung auf Enthaltensein von Elementen und Anfügen von Elementen
(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((= x (entry set)) #t)
        ((< x (entry set))
         (element-of-set? x (left-branch set)))
        ((> x (entry set))
         (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set))
         (make-tree (entry set)
                    (adjoin-set x (left-branch set))
                    (right-branch set)))
        ((> x (entry set))
         (make-tree (entry set)
                    (left-branch set)
                    (adjoin-set x (right-branch set))))))
```

Lösen Sie im Zusammenhang dazu folgende Aufgaben:
1.  Schreiben Sie eine Funktion `(liste->baum liste)`, die die Elemente der Liste `liste` der Reihe nach in einen leeren Baum einfügt.
2.  Schreiben Sie eine Funktion `(baum->liste-infix baum)`, die die Elemente eines Baumes in einer Liste aufsammelt, wobei für jeden Teilbaum des Baumes `baum` gelten soll, dass die Elemente des jeweiligen linken Unterbaumes in der Liste vor dem Eintrag des Teilbaumes und dieser wiederum vor den Elementen des jeweiligen rechten Unterbaumes in der Liste stehen. Diese Reihenfolge nennt man auch Infix-Reihenfolge.
3.  Schreiben Sie eine Funktion `(baum->liste-praefix baum)`, die die Elemente eines Baumes in einer Liste aufsammelt, wobei für jeden Teilbaum des Baumes `baum` gelten soll, dass der Eintrag des Teilbaumes vor den Elementen des jeweiligen linken Unterbaumes in der Liste und diese wiederum vor den Elementen des jeweiligen rechten Unterbaumes in der Liste stehen. Diese Reihenfolge nennt man auch Präfix-Reihenfolge.
4.  Schreiben Sie Funktionen, die die Vereinigungsmenge, Schnittmenge bzw. Differenzmenge zweier als Bäume repräsentierter Mengen berechnen.
5.  Schreiben Sie ein Prädikat `set-eq?`, das die Gleichheit zweier Mengen abprüft.
6.  Schreiben Sie nun eine Funktion `(flatten lst)` die aus beliebig tiefen verschachtelten Listen flache Listen generiert. Zum Beispiel soll die Funktion aus der Liste `'(1 2 (3 (4 5)) 6))` die Liste `'(1 2 3 4 5 6)` machen.
7.  Schreiben Sie zum Schluss mithilfe der Funktion `(random n)`, welche eine zufällige ganze Zahl von `0` bis `n - 1` zurückgibt, eine Funktion `(permutate lst)`, welche die Reihenfolge der Elemente einer gegebenen Liste zufällig neu ordnet. Nutzen sie dieses um die Implementationen aus den vorherigen Aufgaben zu testen!