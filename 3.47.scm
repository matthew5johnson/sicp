(define (make-sempahore n)
  (let ((count n)
       (mutex (make-mutex)))
    (define (sempahore m)
      (cond ((eq? m 'acquire)
             (mutex 'acquire)
             (if (zero? count)
                 (begin
                   (mutex 'release)
                   (semaphore 'acquire))
                 (begin
                   (set! count (- count 1))
                   (mutex 'release))))
            ((eq? m 'release)
             (mutex 'acquire)
             (if (= count n)
                 (mutex 'release)
                 (begin
                   (set! count (+ count 1))
                   (mutex 'release))))))
    sempahore))
