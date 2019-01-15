(define (for exp)
  (sequence->exp
    (list (list 'define
                (list 'for-iter)
                  (make-if (cadr exp)
                    (sequence->exp (list (caddr exp)
                      (list 'for-iter)))
                'true))
          (list 'for-iter))))
          
          
          
