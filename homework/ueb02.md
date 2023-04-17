## Aufgabe 1: SCHEME-Syntax
[[loes02#Aufgabe 1]]
Die Ihnen bekannte Schreibweise für arithmetische Ausdrücke wie z. B. 23 × x, heißt Infixnotation: Der Operator, hier ×, befindet sich zwischen den Operanden, hier 23 und x. Ausdrücke der Programmiersprache Scheme werden jedoch in der sog. Präfixnotation aufgeschrieben: Der Operator wird den Operanden vorangestellt, wie z. B. in (* 23 x).

a.) Übersetzen Sie die folgenden Scheme-Ausdrücke in Infixnotation.
i. `(- 10 (- 8 (- 6 4)))`
ii. `(+ (* 0.1 20) (/ 4 -3))`
iii. `(/ 40 (* 5 20))`
iv. `(- (- (- 5 (- 2 100) 3) 10) 5)`
b.) Übersetzen Sie die folgenden arithmetischen Ausdrücke in Scheme-Ausdrücke.
i. `(4 × 7) − (13 + 5)`
ii. `5 × (537 × (98.3 + (37.5 − (2.5 × 153)))) + 255`

## Aufgabe 2: Substitutionsmodell: formale/aktuale Parameter
[[loes02#Aufgabe 2]]
Gegeben seien folgende Definitionen:

```
  1   (define (string-sort a b)
  2     (cond ((string=? a b) a)
  3           ((string<? a b) (string-append a ", " b))
  4           (else (string-append b ", " a))))
  5   (define a "b")
  6   (define b "a")
```

Veranschaulichen Sie mit Hilfe des Substitutionsmodells die applikative Auswertung des Ausdrucks (string-sort a b)!

## Aufgabe 3: Arithmetik-freie Prozedurdefinitionen
[[loes02#Aufgabe 3]]
Definieren Sie eine Funktion `cut`, die aus einem String `string` einen neuen String erzeugt, der den Teilstring von Position `x` bis `y` nicht mehr enthält. Überlegen Sie sich dazu zuerst, welche Parameter Ihre Prozedur benötigt und von welchem Typ sie sein müssen.

Hinweis: _Nutzen Sie zur Funktionsdefinition die Kurzform von `define` und für die Umsetzung Ihrer Funktion die `string` operationen: `string-append`, `substring` und `string-length`. Lesen Sie zu den verwendeten Funktionen die [DrRacket Dokumentation](https://docs.racket-lang.org/reference/strings.html)._

## Aufgabe 4: Substitutionsmodell: Rekursive und iterative Prozesse
Jede der beiden folgenden Funktionen definiert eine Methode, um zwei positive ganze Zahlen zu addieren:

```
  1   (define (a-plus x y)
  2     (if (zero? x)
  3         y
  4         (1+ (a-plus (1- x) y))))
  5    
  6   (define (b-plus x y)
  7     (if (zero? x)
  8         y
  9         (b-plus (1- x) (1+ y))))
```

Die Addition wird dabei auf die Funktionen `1+` und `1-` zurückgeführt, die ihr Argument jeweils um 1 inkrementieren bzw. dekrementieren.

**a)** Definieren Sie die beiden Hilfsfunktionen `1+` und `1-`!  
**b)** Veranschaulichen Sie mit Hilfe des Substitutionsmodells den Prozess, der von jeder der Funktionen beim Auswerten von `(a-plus 4 5)` und `(b-plus 4 5)` erzeugt wird. Gehen Sie dabei von _Auswertung in applikativer Reihenfolge_ aus.  
**c)** Sind die von den beiden Additions-Funktionen erzeugten Prozesse iterativ oder rekursiv?  
Begründen Sie jeweils Ihre Entscheidung!  
**d)** Veranschaulichen Sie analog zu Teilaufgabe b) mit Hilfe des Substitutionsmodells den Prozess, der beim Auswerten von `(b-plus 1 (b-plus 1 2))` erzeugt wird. Gehen Sie nun aber von _Auswertung in normaler Reihenfolge_ aus.

## Aufgabe 5: Auswertungsordnung
Ben Bitdiddle hat in einem Lisp-Museum einen antiken Lisp-Interpreter aufgestöbert, von dem nicht bekannt ist, ob dieser Interpreter in applikativer Reihenfolge auswertet oder in normaler Reihenfolge.

Er hat aber trotzdem eine Möglichkeit gefunden, zu überprüfen, ob der Interpreter, mit dem er zu tun hat, in applikativer Reihenfolge auswertet oder in normaler Reihenfolge. Er definiert die folgenden beiden Funktionen:

```
  1   (define (p x) (p (+ x 1)))
  2   (define (test x y) (if (= x 0) 0 y))
```

Dann wertet er den folgenden Ausdruck aus: `(test 0 (p 1))`

Welches Verhalten wird ein Interpreter zeigen, der in applikativer Reihenfolge auswertet? Welches Verhalten wird ein Interpreter zeigen, der in normaler Reihenfolge auswertet? Erklären Sie Ihre Antwort! Gehen Sie dabei davon aus, daß die Auswertungsregel für die Spezialform `if` dieselbe ist, ganz gleich, ob der Interpreter in normaler Reihenfolge oder in applikativer Reihenfolge auswertet: Der Bedingungsausdruck wird zuerst ausgewertet, und das Ergebnis entscheidet darüber, ob der Folgeausdruck oder der Alternativausdruck ausgewertet werden soll.