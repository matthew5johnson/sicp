;(define (mul-series s1 s2)
;  (cons-stream x
;               (add-streams y
;                            z)))
                            
(define (mul-series s1 s2)
  (cons-stream (* (s-car s1) (s-car s2))
               (add-streams (scale-stream (s-cdr s1) (s-car s2))
                            (mul-series s1 (s-cdr s2)))
      
