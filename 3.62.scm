; use 60 and 61 to define div-series that divides two power series.

; 60: mul-series ... 61: invert-unit-series

(define (div-series s1 s2)
  (mul-series s1 
              (scale-stream 
                (invert-unit-series
                  (scale-stream s2
                                (/ 1 (stream-car s2)))
                  (/ 1 (stream-car s2)))))
