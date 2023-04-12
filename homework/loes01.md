## Aufgabe 1
[[ueb01#Aufgabe 1: Formalisierung]]
F(x) - x fährt
Z(x) - x ist Zug
K(x) - x ist kaputt
R(x) - x hat Räder
M(x) - x ist Magnetschwebebahn
a) $Z(x)\rightarrow F(x)$
b) $Z(x)\rightarrow (F(x)\land \lnot K(x) \lor (\lnot F(x)\land K(x))$
c) $R(x)\rightarrow F(x)$
d) $\forall x: (F(x) \land Z(x)) \rightarrow R(x)$
e) $\exists x: Z(x) \land F(x) \land \lnot R(x) \leftrightarrow \exists y: M(y)$ 

i) not((x ist eine Person und qualifiziert) und (x ist eine Person oder qualifiziert))
$\rightarrow$ x ist entweder eine Person oder qualizifiert
ii) Wenn x eine Person und keine Person ist, dann ist x qualifiziert
$\rightarrow$ x ist nicht qualifiziert
iii) Es existiert ein x für das gilt: x ist eine nicht qualifizierte Person gdw. x ist qualifiziert oder nicht qualifiziert
$\rightarrow$Es existiert eine nicht qualifizierte Person
iv) für alle x gilt: es gibt mindestens ein y für das gilt: Wenn x eine Person ist, dann ist y qualifiziert und x vertraut y
$\rightarrow$für jede Person x gibt es ein qualifiziertes y dem x vertraut
v) Wenn x qualifiziert ist, dann vertraut x allen y den x vertraut.??

## Aufgabe 2
[[ueb01#Aufgabe 2: Unifikation]]

a) $Y \rightarrow a, X \rightarrow b$
b) $Y \rightarrow X, Z \rightarrow Y$
c) $Y \rightarrow X$
d) $a \rightarrow X, Z \rightarrow t(X,b)$
e) $a \rightarrow X$

## Aufgabe 3
[[ueb01#Aufgabe 3: Prädikatenlogische Resolution]]

a)
(1) $(\lnot 1 \land \lnot 2) \lor (\lnot 1 \land \lnot 3) \lor (\lnot 2 \land \lnot 3) \lor (\lnot 1 \land \lnot 2 \land \lnot 3)$
(2) $\lnot 1 \land \lnot 3$
(3) $(\lnot 1 \land \lnot 2 \land \lnot 3)$
Wäre 2 wahr, dann wäre auch 1 wahr und keine Lüge.  -> 2 lügt
Währe 3 wahr, dann wäre auch 1 wahr und somit würden nicht mehr alle lügen -> 3 lügt
Nur 1 ist wahr. 2 und 3 lügen.

b) Nein. wenn nun 1 wahr ist, so ist auch 4 wahr -> 1 ist nicht mehr wahr