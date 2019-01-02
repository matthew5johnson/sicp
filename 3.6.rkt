

;;;;   3.6
(define random-seed 3)
(define (rand-new x) (* x 3))

(define rand 
   (let ((x random-seed)) 
     (define (dispatch message) 
       (cond ((eq? message 'generate) 
               (begin (set! x (rand-new x)) 
                      x)) 
             ((eq? message 'reset) 
               (lambda (new-value) (set! x new-value))))) 
     dispatch))

 (rand 'generate) 
 > 9 
 (rand 'generate) 
 > 27 
 ((rand 'reset) 3)  
 (rand 'generate) 
 > 9
