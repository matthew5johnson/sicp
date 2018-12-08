; This function produces a string of numbers that are evenly divisible by 60. As an example, 60**2 = 3600 = 48 × 75, so both 48 and 75 are divisors of a power of 60. Thus, they are regular numbers. Equivalently, they are the numbers whose only prime divisors are 2, 3, and 5.
; So these are "hamming numbers" or "regular numbers"


(define S 
  (cons-stream 1
               (merge (scale-stream S 2)
                      (merge (scale-stream S 3)
                             (scale-stream S 5)))))
              
