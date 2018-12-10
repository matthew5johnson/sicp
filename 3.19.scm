;;;;   3.19

(define (cycle? x) 
   (define (iter start next l u) 
     (cond 
      ((null? next) false) 
      ((eq? start next) true) 
      ((< l u) (iter start (cdr next) (+ l 1) u)) 
      (else (iter next (cdr next) 1 (* 2 u))))) 
   (if (null? x) 
       false 
       (iter x (cdr x) 1 1)))
