
;;;;   3.1
(define (make-accumulator current-value)
  (lambda (add-amount)
    (begin (set! current-value (+ add-amount current-value))
           current-value)))
