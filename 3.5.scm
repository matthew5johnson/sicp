

;;;;   3.5
(define (square x) (* x x))

(define (estimate-integral P x1 x2 y1 y2 trials) 
   (* (monte-carlo trials P)
      4.0)) 
  
(define (within-circle-test) 
   (>= 1 (+ (square (- (random-in-range 0 2.0) 1.0)) 
            (square (- (random-in-range 0 2.0) 1.0))))) 
; Supplied by the exercise 
(define (random-in-range low high) 
   (let ((range (- high low))) 
     (+ low (random range))))
   
; Monte carlo procedure from book
(define (monte-carlo trials experiment) 
   (define (iter trials-remaining trials-passed) 
     (cond ((= trials-remaining 0) 
            (/ trials-passed trials)) 
           ((experiment) 
            (iter (- trials-remaining 1) (+ trials-passed 1))) 
           (else 
            (iter (- trials-remaining 1) trials-passed)))) 
   (iter trials 0))

(estimate-integral within-circle-test 0.0 2.0 0.0 2.0 10000)
> 3.1496 ;; due to the random function, this output will change slightly with each time the program is run 
