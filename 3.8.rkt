#lang sicp

;;;;   3.8 


(define f 
   (let ((x 1)) 
     (lambda (y) 
       (if (= x 1) 
           (begin (set! x (+ x 1)) y) 
           0))))
(f 1)
> 1

(f 0)
> 0

(+ (f 0) (f 1))
> 0