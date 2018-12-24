(define (integral integrand initial-value dt)
  (cons-stream initial-value
    (if (stream-null? integrand)
        the-empty-stream
        (integrand (stream-cdr integrand)
                   (+ (* dt (stream-car integrand))
                      initial-value)
                   dt))))
                   
; modify the procedure so that it expects the integrand as a delayed argument and hence can be used in the solve procedure shown above

(define (integral delay-integrand initial-value dt)
  (cons-stream initial-value
    (if (stream-null? delay-integrand)
        the-empty-stream
        (integral (delay (stream-cdr (force delay-integrand)))
                   (+ (* dt (stream-car (force delay-integrand))
                      initial-value)
                   dt))))
                   
; this is just like the example on the previous page in this chapter
