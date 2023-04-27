#lang slideshow

(define (ear)
  (vc-append
   (rectangle 10 50)
   (rectangle 10 50)))

(define (head)
  (circle 50))

(define (eye)
  (circle 5))

(define (nose)
  (circle 5))

(define (body)
  (ellipse 40 60))

(define (foot)
  (vc-append
   (rectangle 10 30)
   (rectangle 10 30)))

(define (easter-bunny)
  (vc-append
   (hc-append
    (ear)
    (vc-append
     (hc-append
      (head)
      (ear))
     (cc-superimpose
      (vc-append
       (hc-append
        (eye)
        (nose)
        (eye)))
      (body))
    (ear))
   (hc-append
    (foot)
    (foot)))))

(define easter-bunny-slide
  (slide
   #:title "Easter Bunny"
   (easter-bunny)))
