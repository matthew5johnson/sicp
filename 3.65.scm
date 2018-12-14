; The three ways that pi was found, from earlier in the section
(define (pi-summands n)
  (cons-stream (/ 1.0 n)
               (stream-map - (pi-summands (+ n 2)))))
         
(define pi-stream
  (scale-stream (partial-sums (pi-summands 1)) 4))
  
;#1
(display-stream pi-stream)
;#2
(display-stream (euler-transform pi-stream))
;#3
(display-stream (accelerated-sequence euler-transform pi-stream))

; For the ln(2) sequence, we'll want to increment the summands by 1 instead of 2.
(define (ln-summands n)
  (cons-stream (/ 1.0 n)
               (stream-map - (ln-summands (+ n 1)))))
         
(define ln-stream
  (scale-stream (partial-sums (ln-summands 1)) 4))
  
;#1
(display-stream ln-stream)
;#2
(display-stream (euler-transform ln-stream))
;#3
(display-stream (accelerated-sequence euler-transform ln-stream))
