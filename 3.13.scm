;;;;   3.13
(define (cycle x)
  (set-cdr! (last-pair x) x)
  x)
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define z (cycle (list 'a 'b 'c)))
(cdr z)
;#0=(mcons 'b (mcons 'c (mcons 'a #0#)))
