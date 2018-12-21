;your answer should be able to use RC to model an RC circuit with R = 5 ohms, C = 1 farad, and a 0.5 second time step by evaluating (define RC1 (RC 5 1 0.5)). This defines RC1 as a procedure that takes a stream representing the time sequence of currents and an initial capacitor voltage and produces the output stream of voltages.

(define (RC resistance capacitance dt)
  (lambda (v i)
    (add-streams (scale-stream i resistance)
                 (integral (scale-stream i (/ 1 capacitance))
                 v
                 dt))))
