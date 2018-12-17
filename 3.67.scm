; Modify the pairs procedure so that (pairs integers integers) will produce the stream of all pairs of integers. Without the condition i <= j
; My note: because pairs is only producing the integers above the diagonal in that matrix of all possible pairs

(define (pairs s t)
  (cons-stream
    (list (stream-car s) (stream-car t))
    (interleave
      (interleave
        (stream-map (lambda (x) (list (stream-car s) x))
                  (stream-cdr t))
        (stream-map (lambda (x) (list (stream-car t) x))
                  (stream-cdr s)))
    (pairs (stream-cdr s) (stream-cdr t))
)))
      
      
