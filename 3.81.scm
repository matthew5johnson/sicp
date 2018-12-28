;;;;  The old solution to 3.6
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
 
 ;; Exercise 3.6 discussed generalizing the random number generator to allow one to reset the random number sequence so as to produce repeatable sequences of "random" numbers.
 ;; Produce a stream formulation of this same generator that operates on an input stream of requests to generate a new random number
 ;; or to reset the sequence to a specified value and that produces the desired stream of random numbers. Don't use assignment
 
(define (random-stream rand)
  (cons-stream rand
               (stream-map (lambda (x) (rand-update)) random-from)))  
 random-from)
 
(define (rand command)
  (define (rand-iter randoms task)
    (if (stream-null? task) 
        null
        (let ((request (stream-car task)))
          (cond ((eq? 'generate command)
                 (cons-stream (stream-car randoms)
                              (rand-iter (stream-cdr randoms) 
                                         (stream-cdr task))))
                ((eq? 'reset command)
                 (let ((new-randoms (random-stream ((rand) seed))))) 
                   (cons-stream (stream-car new-randoms)
                                (rand-iter (stream-cdr new-randoms) 
                                           (stream-cdr (stream-cdr task))))))
                (else (error "bad" command))))))
  (rand-iter (random-stream (random-seed x)) 
             command))
 
;; return to this question for a refresher
