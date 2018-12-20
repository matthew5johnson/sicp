; In a similar way to the previous exercise, generate a stream of all numbers that can be written as the sum of two squares in three different ways

(define (squares x) 
  (+ (** (car x) 3)
     (** (car (cdr x)) 3)))

(define (three-squares holder1 holder2) 
  (let (oldest-value (stream-car holder1))
       (old-value (stream-car holder2))
       (current-value (stream-car (stream-cdr holder2))))
       (test (squares current-value))
    (if (and (eq? (squares old-value) (squares oldest-value)) (eq? test (squares old-value))
        (cons-stream (list (test old-value oldest-value))
                     (three-squares (stream-cdr (stream-cdr holder2))))
        (three-squares (stream-cdr holder2))))
  (three-squares (weighted-pairs integers integers squares)))
  
  ; it's not giving the correct outputs. return to this question later
