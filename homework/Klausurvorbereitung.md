# Auswertung
**applikativ:** Auswertung der Argumente und anschließende Anwendung der Prozedur auf die ausgewerteten Argumente
**normal**: Zuerst Ersetzung aller Prozeduren, bis ein Term erreicht ist, der nur noch primitive Operatoren enthält, dann Durchfuhren der Auswertung.

Beide geben das gleiche Ergebnis. Beispiel:
```racket
(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))

(define (f a) (sum-of-squares (+ a 1) (* a 2)))
```
applikativ:
```
(f 5)
(sum-of-squares (+ a 1) (* a 2))
(sum-of-squares (+ 5 1) (* 5 2))

sum-of-squares ==> (+ (square x) (square y)) 
(+ 5 1) ==> 6 
(* 5 2) ==> 10

(+ (square 6) (square 10))

+ ==> #[primitive +] 
square ==> (* x x)
(* 6 6) ==> 36 
(* 10 10) ==> 100

(+ 36 100) ==> 136
```

normal:
```
(f 5)
(sum-of-squares (+ 5 1) (* 5 2)) 
(+ (square (+ 5 1)) (square (* 5 2))) 
(+ (* (+ 5 1) (+ 5 1)) (* (* 5 2) (* 5 2)))

(+ (* 6 6) (* 10 10)) 
(+ 36 100) 
136
```

# Rekusionsarten

**Baumrekursion**
- f(x) = f(x-1) + f(x-2)

**Lineare Rekursion**
- f(x) = 1 + f(x-1)

**Werteverlaufsrekursion / Iteration / Endrekursion / Restrekursion**
- f(x, y) = f(x-1, y+1)  

**Verschachtelte Rekursion**
- f(x) = f(f(x - 1)) 

# Skolem-Normalform
F ist in der Form ∀x1, . . . , xl : (C1 ∧ . . . ∧ Cs)

1. Variablen durch Umbenennung eindeutig machen
2. Ersetzen der Konnektive $\to$ und $\equiv$
	1. $B \to C$ durch $\lnot B \lor C$
	2. $B \equiv C$ durch $(\lnot B \lor C) \land (\lnot C \lor B)$
3. Negationen ins Formelinnere bewegen
	1. ¬(∀x : B) durch ∃x : (¬B) 
	2. ¬(∃x : B) durch ∀x : (¬B) 
	3. ¬(B∨C) durch ¬B∧¬C 
	4. ¬(B∧C) durch ¬B∨¬C 
	5. ¬¬B durch B
4. Eliminieren aller existentiellen Quantoren durch iterierte Ausführung der folgenden Operation
	1. Sei (∃x : B) der am weitesten links stehende Teilausdruck mit Existenzquantor und $x_1, \dots, x_n$ all jene allquantifizierten Variablen, in deren Gültigkeitsbereich (∃x : B) liegt.
	2. Eliminiere x durch Skolemisierung mit einer n-stelligen Skolemfunktion in den Variablen $x_1, \dots, x_n$.
5. Alle Allquantoren nach links ziehen.
6. Umformung in konjunktive Normalform durch die Ersetzungen:
	1. B∨(C∧D) durch (B∨C)∧(B∨D)
	2. (B∧C)∨D durch (B∨D)∧(C∨D)

### Beispiel
initial: ∀x (∀y P(x,y) → ¬(∀y Q(x,y) → R(x,y)))
Schritt 1: ∀x (∀y P(x,y) → ¬(∀z Q(x,z) → R(x,z)))
Schritt 2: ∀x (¬(∀y P(x,y)) ∨ ¬(∀z ¬Q(x,z) ∨ R(x,z)))
Schritt 3: ∀x (∃y ¬P(x,y) ∨ (∃z Q(x,z) ∧ ¬R(x,z)))
Schritt 4: ∀x (¬P(x,f1(x)) ∨ (Q(x,f2(x)) ∧ ¬R(x,f2(x))))
Schritt 5: ¬P(x,f1(x)) ∨ (Q(x,f2(x)) ∧ ¬R(x,f2(x)))
Schritt 6:(¬P(x,f1(x)) ∨ Q(x,f2(x))) ∧ (¬P(x,f1(x)) ∨ ¬R(x,f2(x))) {¬P(x,f1(x)), Q(x,f2(x))}

{¬P(x,f1(x)), ¬R(x,f2(x))} {¬P(x1,f1(x1)), Q(x1,f2(x1))}
{¬P(x2,f1(x2)), ¬R(x2,f2(x2))}