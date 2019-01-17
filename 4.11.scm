(define (make-frame variables values)
  (cons variables values))
 

(define (make-frame-4-11 variables values)
  (if (= values '())
      '()
      (list variables values (make-frame-4-11 (cdr variables) (cdr values)))))
      
(define (add-binding-to-frame! var val frame)
  (set-car! frame)
  (set-cdr! (cons (cons var val) (cdr frame))))
