#lang sicp
; 3.29

(define (or-gate a1 a2 output)
  (let ((c (make-wire))
        (o1 (make-wire)) (o2 (make-wire))
        (f (make-wire)) (g (make-wire))))
                
    (and-gate a1 a1 o1)
    (and-gate a2 a2 o2)
    (inverter o1 f)
    (inverter o2 g)
    (and-gate f g c)
    (inverter c output)
    'done))
  
