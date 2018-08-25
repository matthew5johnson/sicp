#lang sicp
;;;;   3.18 

(define a (list 'a 'b 'c))
(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define loop-a (make-cycle a))

(define b (list 'c 'd 'e))



(define (loop? x)
  (define encountered '())
  (define (within z)
    (cond ((not (pair? z)) "No loop here")
            ((memq (car z) encountered) "It's a trap")
            (else (set! encountered (cons (car z) encountered))
                  (within (cdr z)))))
  (within x))

(loop? loop-a)            
> "It's a trap

(loop? b)
> "No loop here"

; Notes: Using a let for "encountered '()" doesn't work for some reason. So it required an extra function to be
; written within the loop? test function. There must be some quirk within the functionality of "let" that doesn't
; prevents it from maintain state after being modulated with a set! ?  