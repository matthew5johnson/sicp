; Instead of building a stream of pairs from three parts, this separates the pair (S, T) from the rest of the pairs in the first row
; Does this work? Consider what happens if we evaluate (pairs integers integers)

(define (pairs s t)
  (interleave
    (stream-map (lambda (x) (list (stream-car s) x))
                t)
    (pairs (stream-cdr s) (stream-cdr t))))
    
    
; the only change from the previous procedure is going from (stream-cdr t) to just (t) in the stream-map lambda function. 
; feeding t into the interleave causes an infinite loop as soon as the pairs procedure is called, because t is itself the result
; of the recursive call to pairs
