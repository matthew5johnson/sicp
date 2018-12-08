(define (partial-sums S)
  (cons-stream (car-stream S)
               (add-streams (cdr-stream S)
                            (partial-sums S))))
  
  
; where S is a stream. This function will sum all of the seen numbers as it goes
; should return: S0, S0 + S1, S0 + S1 + S2, etc

; This is an implementation of the following python code, but in stream form:
; holder = 0
; for i in range(0,10):
;       holder += i
