; Write a procedure merge-weighted that is like merge, except that merge-weighted takes an additional argument to weight, which is a procedure that computes the weight of a pair, and is used to determine the order in which elements should appear in the resulting merged stream. Using this, generalize pairs to a procedure weighted-pairs that takes two streams, together with a procedure that computes a weighting function, and generates the stream of pairs, ordered according to weight. Use your procedure to generate a) the stream of all pairs of positive integers with i <= j ordered according to the sum i + j; and b) the stream of all pairs of positive integers with i <= j where neither i nor j is divisible by 2, 3, or 5, and the pairs are ordered according to the sum 2i + 3j + 5ij

; this looks like functional programming at its finest, passing the weight function as a parameter. The merge-weighted fxn itself looks very similar to the original merge function. the cond should probably become an if w/ <=
(define (merge-weighted s1 s2 weight)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
          (let ((s1car (stream-car s1))
               (s2car (stream-car s2)))
            (cond ((< (weight s1car) (weight s2car))
                   (cons-stream s1car (merge-weighted (stream-cdr s1) s2 weight)))
                  ((= (weight s1car) (weight s2car))
                   (cons-stream s1car (merge-weighted (stream-cdr s1) s2 weight)))
                  (else
                    (cons-stream s2car
                                 (merge-weighted s1 (stream-cdr s2) weight))))))))

; this is nearly identical to the original pairs function, with basically just the interleave subbed out for merge-weighted
(define (pairs-weighted s t weight)
  (cons-stream
    (list (stream-car s) (stream-car t))
    (merge-weighted
      (stream-map (lambda (x) (list (stream-car s) x))
                  (stream-cdr t))
      (pairs-weighted (stream-cdr s) (stream-cdr t) weight))))
