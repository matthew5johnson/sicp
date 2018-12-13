; write a prcoedure stream-limit that takes as arguments a stream and a number (the tolerance). 
;It should examine the stream until it finds two successive elements that differ in absolute value by less than the tolerance, 
;and return the second of the two elements. Using this, we could compute square roots up to a given tolerance by:

(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

(define (stream-limit s1 tolerance)
  (if (< (abs (- stream-car stream-cdr)) tolerance)
      stream-cdr
      (stream-limit (stream-cdr s1) tolerance)))
  
