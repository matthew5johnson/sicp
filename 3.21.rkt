What you're seeing when the interpreter prints the result of modifying the queue are the first-level contents of the
queue data structure = the pointers.

(define (print-queue q)
  (display (front-ptr q))
  (newline)) 