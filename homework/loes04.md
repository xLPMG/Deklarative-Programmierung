## Aufgabe 1
### Teil 1:
##### `map` 
The `map` function walks a list (or multiple lists), and applies a given function to every value of a list
Implementierung:
```racket
(define (my-map f xs) 
	(if (null? xs) 
		null 
		(cons (f (first xs))
		(my-map f (rest xs)))))
```

##### `filter`
`(filter pred lst)` returns a list with the elements of lst for which pred produces a true value. The pred procedure is applied to each element from first to last.
```racket
(define (my-filter pred xs) 
	(if (null? xs) 
		null 
		(if (pred (first xs)) 
			(cons (first xs) (my-filter pred (rest xs))) 
			(my-filter pred (rest xs)))))
```

##### `foldl`
`(foldl proc init lst ...+)` applies a procedure to the elements of one or more lists. Whereas [map](https://docs.racket-lang.org/reference/pairs.html#%28def._%28%28lib._racket%2Fprivate%2Fmap..rkt%29._map%29%29) combines the return values into a list, [foldl](https://docs.racket-lang.org/reference/pairs.html#%28def._%28%28lib._racket%2Fprivate%2Flist..rkt%29._foldl%29%29) combines the return values in an arbitrary way that is determined by proc.
```racket
(define (my-foldr combine nullval vals) 
	(if (null? vals) 
		nullval 
		(combine 
			(first vals) 
			(my-foldr combine nullval (rest vals)))))
```

##### `foldr`
`(foldr proc init lst ...+)` is like foldl, but the lists are traversed from right to left. Unlike [foldl](https://docs.racket-lang.org/reference/pairs.html#%28def._%28%28lib._racket%2Fprivate%2Flist..rkt%29._foldl%29%29), [foldr](https://docs.racket-lang.org/reference/pairs.html#%28def._%28%28lib._racket%2Fprivate%2Flist..rkt%29._foldr%29%29) processes the lsts in space proportional to the length of lsts (plus the space for each call to proc).

##### `apply`
The apply function applies a function to a list of its arguments.
#### `member`
`(member v lst [is-equal?])` locates the first element of lst that is equal? to v. If such an element exists, the tail of lst starting with that element is returned. Otherwise, the result is #f.