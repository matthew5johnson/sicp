; Numbers that can be expressed as the sum of two cubes in more than one way are sometimes called Ramanujan numbers. To find a number that can be written as the sum of two cubes in two different ways, we need only generate the stream of pairs of integers weighted according to the sum i**3 + j**3, then search the stream for two consecutive pairs with the same weight. Write a procedure to generate the Ramanujan numbers. The first is 1,729. What are the next five?

; x = i**3 + j*3

(define (cubes x) 
  (+ (** (car x) 3)
     (** (car (cdr x)) 3)))

(define (ramanujan holder) 
  (let (previous-value (stream-car holder))
       (next-value (stream-car (stream-cdr holder)))
       (test (cubes previous-value
    (if (eq? (cubes previous-value) (cubes next-value))
        (cons-stream (list (cubes previous-value) previous-value next-value)
                     (ramanujan (stream-cdr (stream-cdr holder))))
        (ramanujan (stream-cdr holder))))
  (ramanujan (weighted-pairs integers integers cubes)))
