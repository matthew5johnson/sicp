; 3.30

(define (ripple-carry-adder Al Bl Sl C)
  (define (A B S C1 C2)
    (if (null? A) 
        S
        (begin (full-adder (car A) (car B) C1 (car S) C2)
               (iter (cdr A) (cdr B) (cdr S) C2 (make-wire)))))
  (iter A1 B1 S1 C (make-wire)))
  
