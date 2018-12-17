; write a procedure triples that takes three infinite streams, S, T, and U, and produces the stream of triples (S, T, U) such that
; i <= j <= k. Use triples to generate the stream of all Pythagorean triples of positive integers such that i <= j and
; i**2 + j**2 = k**2

(define (triples S T U)
  (cons-stream
    (list (stream-car S) (stream-car T) (stream-car U))
    (interleave
        (stream-map (lambda (x) (cons (stream-car S) x))
                  (stream-cdr (pairs T U)))
        (triples (stream-cdr S) (stream-cdr T) (stream-cdr U)))))
