**Begrifflichkeiten für die Wiederholung:**
-Logische Konsequenz  
-Resolutionskalkül  
-Skolem-Normalform  
-Unifikation

## Aufgabe 1: Formalisierung 
[[loes01#Aufgabe 1]]
Wandeln Sie die folgenden Aussagen in prädikatenlogische Formeln um:  
a) Züge fahren  
b) Entweder ein Zug ist kaputt, oder er fährt  
c) Wenn etwas Räder hat kann es fahren  
d) Alle Züge die fahren können, haben Räder  
e) Mindestens einer der Züge die fahren, hat keine Räder genau dann, wenn es Magnetschwebebahnen gibt

Interpretieren Sie die folgenden Formeln unter eigener Interpretation von P, Q und V umgangssprachlich:  
i) ¬(P(x) ∧ Q(x)) ∧ (P(x) ∨ Q(x))  
ii) ¬P(x) ∨ P(x) → Q(x)  
iii) ∃x: (P(x) ∧ ¬Q(x)) ⇔ ¬(Q(x) ∧ ¬Q(x))  
iv) ∀x∃y: P(x) → Q(y) ∧ V(x, y)  
v) ∃x: (P(x) → Q(x)) → ∀y: (V(x, y) ⇔ V(x, y))  
Hinweis: _Eine mögliche Interpretation für P, Q und V könnte sein:  
P(x) bedeutet: x ist eine Person  
Q(x) bedeutet: x ist qualifiziert  
V(x, y) bedeutet: x vertraut y

## Aufgabe 2: Unifikation  
**Stellen Sie für jedes der folgenden Paare von Atomformeln fest, ob die Formeln unifiziert werden können. Wenn ja, geben Sie jeweils den allgemeinsten Unifikator an!
[[loes01#Aufgabe 2]]

a) p(a,X) und p(Y,b)  
b) p(X,X) und p(Y,Z)  
c) p(X,Y) und p(Y,X)  
d) p(t(X,t(X,b))) und p(t(a,Z))  
e) p(t(X,t(X,b))) und p(t(a,t(Z,Z)))  
f) p(X,f(Y)) und p(f(Y),X)  
g) p(X,f(X)) und p(f(Z),f(Z))

## Aufgabe 3: Prädikatenlogische Resolution  
Georg, Max und Moritz beschuldigen sich gegenseitig zu lügen. Wer lügt wirklich und wer sagt die Wahrheit?  
  
(1) Georg: Die absolute Mehrheit von uns lügen!  
(2) Max: Nur Georg und Moritz lügen!  
(3) Moritz: Alle lügen!  
**a)** Formalisieren Sie die Aussagen und leiten Sie einen wahren Sachverhalt ab, von dem Sie ableiten können, wer lügt und wer die Wahrheit sagt.  
**b)** Tatsächlich wurde Jonas völlig übersehen, er gehört natürlich auch zu der Gruppe. Seine Aussage ist:  
(4) Jonas: Georg sagt die Wahrheit!  
Können Sie immer noch eindeutig herleiten wer lügt? Begründen sie ggf. einen Widerspruch formal durch das Ableiten der leeren Klausel!