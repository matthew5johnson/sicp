(define (steam-map proc . argstreams)
  (if (stream-empty? (car argstreams))
      the-empty-stream
      (cons stream
       (apply proc (map car-s argstreams))
       (apply stream-map
              (cons proc (map cdr-s argstreams))))))
