(define (serialized a1 a2)
  (let ((serializer1 'serialize-larger)
        (serializer2 'serialize-smaller)
      (cond (( > (id a1) (id a2))
             (set! serializer1 (a1 'serializer))
             (set! serializer2 (a2 'serializer)))
             (else (set! serializer1 (a2 'serializer))
                   (set! serializer2 (a1 'serializer))))
      ((serializer1 (serializer2 swap)) a1 a2)))
      
 ; Notes: the whole idea of this procedure is to prevent two processes from getting locking opposite accounts at the same time and then be waiting indefinitely for the other process to release the opposite account.
