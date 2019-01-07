; a. Sending the eval loop into application? before assignment? would basically skip this first step:

(define (eval-assignment exp env)
  (set-variable-value! (assignment-variable exp)
                       (eval (assignment-value exp) env)
                       env)
  'ok)

; which means that you'd completely miss out on the assignment of the exp variable. Doing this with the given example of (define x 3) would initially ignore the 3 since it wouldn't go into the assignment procedure, and would preferentially apply the "define" operator to x, and wouldn't return anything when called.

; b. here's the original version

(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((quoted? exp) (text-of-quotation exp))
        ((assignment? exp) (eval-assignment exp env))
        ((definition? exp) (eval-definition exp env))
        ((if? exp) (eval-if exp env))
        ((lambda? exp)
         (make-procedure (lambda-parameters exp)
                         (lambda-body exp)
                         env))
        ((begin? exp)
         (eval-sequence (begin-actions exp) env))
        ((cond? exp) (eval (cond->if exp) env))
        ((application? exp)
         (apply (eval (operator exp) env)
                (list-of-values (operands exp) env)))
        (else
         (error "Unknown expression type -- EVAL" exp))))
 
(define (application? exp) 
  (pair? exp))

;;; ^^^ Needs to be changed to:

(define (application? exp)
  (tagged-list? exp 'call)
(define (operator exp) (cadr exp))
(define (operand exp) (cddr exp))
