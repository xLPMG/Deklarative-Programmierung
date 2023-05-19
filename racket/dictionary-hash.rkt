#lang racket
(define dict make-hash) ; joinken uns den hash table,
; eigentlich können wir den auch direkt verwenden
(define dict-set! hash-set!) ; setzen eines values für einen key
(define dict-ref hash-ref) ; suche nach key
(define dict-remove hash-remove) ; entfernen eines keys

(define d (dict))
(dict-set! d 'a 1) ; lege einen key 'a an mit value 1
(dict-ref d 'a)
(dict-ref d 'a #f)
(dict-ref d 'b #f) ; Brauchen noch Standardverhalten bei fail, sonst key access error
(dict-ref d 'b "key is not in the dictionary")
(dict-remove! d 'b) ; need to add the ! to make it possible to mutate arguments
; if key is not in the dictionary, that doesn't matter
(dict-set! d 'a 4) ; we could even mutate the value behind a key, this
; goes against our functional programming paradigm, use with caution
(dict-ref d 'a #f)
(dict-remove! d 'a)
(dict-ref d 'a #f)

