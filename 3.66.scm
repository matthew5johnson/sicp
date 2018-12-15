(define (interleave s1 s2)
  (if (stream-null? s1)
    s2
    (cons-stream (stream-car s1)
                 (interleave s2 (stream-cdr s1)))))
                 
(define (pairs s t)
  (cons-stream
    (list (stream-car s) (stream-car t))
    (interleave
      (stream-map (lambda (x) (list (stream-car s) x))
                  (stream-cdr t))
      (pairs (stream-cdr s) (stream-cdr t)))))
      
      
; Examine the stream (pairs integers integers). Can you make any general comments about the order in which the pairs are placed into the stream?

; The interleave function replaces s1 with s2 on every new call. So it's giving us stream-car of whatever stream wasn't called from on the previous run.
; Putting our recursive pairs call within the interleave function means that we're cycling between s and t.
; Everything in interleave is happening behind the scenes of each call to pairs, since the output only sees the result of (list (stream-car s) (stream-car t))
