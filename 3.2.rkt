#lang sicp

;;;;   3.2
(define (make-monitored procedure)
  (let ((calls 0))
    (lambda (arg)
      (cond ((eq? arg 'how-many-calls) calls)
            ((eq? arg 'reset-count) (set! calls 0) calls)
            (else (set! calls (increment calls))
                  (procedure arg))))))
(define (increment x) (+ 1 x))

(define (squared x) (* x x))

(define s (make-monitored squared))
(s 10)
> 100
(s 'how-many-calls)
> 1
(s 5)
> 25
(s 'how-many-calls)
> 2