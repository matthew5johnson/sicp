(define (RC resistance capacitance dt)
  (lambda (v i)
    (add-streams (scale-stream i resistance)
                 (integral (scale-stream i (/ 1 capacitance))
                 v
                 dt))))


(define (RLC R L C dt)
  (lambda (v i)
    (define vC (integral (delay dvC) v dt))
    (define iL (integral (delay diL) i dt))
    (define diL (add-streams (scale-stream vC (/ 1 L))
                             (scale-stream iL (- (/ R L)))))
    (define dvC (scale-stream iL (/ -1 C)))
    (cons vC iL)))
