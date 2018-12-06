; Consider the sequence of expressions

(define sum 0)
; 0

(define (accum x)
  (set! sum (+ x sum))
  sum)
; 0

(define seq (stream-map accum (stream-enumerate-interval 1 20)))
; sum = 1

(define y (stream-filter even? seq))
; sum = 6

(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
                         seq))
; sum = 10

(stream-ref y 7)

(display-stream z)

; What is the value of sum after each of the above expressions is evaluated? What is the printed response to evaluating the stream-ref and display-stream expressions? Would these responses differ if we had implemented (delay <exp>) simply as (lambda () <exp>) without using the optimization provided by memo-proc? Explain
; A lambda here change our underlying evaluations, so we would have to redo anything that was created by stream-ref and beyond. The reason for this is because streams only reveal the stream-car over time, so that's all that we've got as underlying data to work with. We can't see the entire list, which is the nature of streams in the first place. 

(accum x)
; 210

(stream-ref y 7)
; 56, although the correct answer seems to be 136. Come back to this later

(display-stream z)
; sum = 210
; 10
; 15
; 45
; 55 
; 105
; 120
; 190
; 210
