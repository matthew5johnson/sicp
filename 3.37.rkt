#lang sicp

(define (c+ x y)
  (let ((m (make-connector)))
    (adder x y m)
    m))
    
; the others use multiplier and put the constraints in different sequences

(define (c* x y)
  (let (m (make-connector)))
    (multiplier x y m)
    m))

(define (c/ x y)
  (let ((m (make-connector)))
    (multiplier m y x)
    m))

(define (c- x y)
  (let ((m (make-connector)))
    (multiplier m y x)
    z))
