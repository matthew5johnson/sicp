; (let ((<var> <exp>) ... (<var> <exp>)) body)
; in the original let, all of the vars are applied to their assigned exps simultaneously 

(let* ((x 3)
       (y (+ x 2))
       (z (+ x y 5)))
  (* x z))
; this new let expression is a rewrite of the original that allows each subsequent expression to be folded into the next, and then be evalauted in sequence from first to last (left to right by the evaluator)
(define (let*? expr) (tagged-list? exp 'let*))
; Is it sufficient to add a clause to eval whose action is the below? Or must we explicitly expand let* in terms of non-derived expressions?
(define (let*->nested-lets exp) 
  (let ((inits (cadr exp))
    (body (caddr exp)))
  (define (make-lets exp)
    (if (null? exp)
        body
        (list 'let (list (car exps)) (make-lets (cdr exps)))))
 (env)))
