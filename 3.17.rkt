#lang sicp
;;;;   3.17


(define a (list 'a))
(define m (list 'm))
(define z (list 'z))
(set-car! a m)
(set-cdr! a m)
(set-car! m z)
(set-cdr! m z)


(define count
  (let ((encountered '()))
    (lambda (x)
      (cond ((not (pair? x)) 0)
            ((memq x encountered) 0)
            (else
             (set! encountered (cons x encountered))
             (+ (count (car x))
                (count (cdr x))
                1))))))
(count a)
> 3

;;; Note: memq = (any list -> (union false list))
purpose: 
to determine whether some value is on some list
(comparing values with eq?)
my interpretation: 
so we're building up a list called 'encountered' for every new x we hit (via set! in the else statement). 
we then test to see if the next x has already been included in our 'encountered' list by invoking memq