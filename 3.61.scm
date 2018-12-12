; write a procedure invert-unit-series that computes 1/S for a power series S with constant term 1.
; this looks like a Taylor series, and specifically a polynomial example around a center c of 1

(define (invert-unit-series S
  (cons-stream 1
               (scale-stream (mul-series (stream-cdr S)
                                         (invert-unit-series S)) 
                              -1)))
