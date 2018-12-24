; write a procedure smooth that takes a stream as input and produces a stream in which each element is the average of two successive input stream elements. Then use smooth as a component to implement the zero-crossing detector in a more modular style.

(define (smooth S)
  (cons-stream (/ (+ (stream-car S) (stream-cadr S)) 2)
               (stream-cdr S)))

(define (make-zero-crossings input-stream)
  (cons-stream (sign-change-detector (smooth input-stream))
               (make-zero-crossings (stream-cdr input-stream))))
