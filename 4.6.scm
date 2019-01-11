; Implement a syntactic transformation let->combination that reduces evaluating let expressions to evaluating combinations of the type shown above, and add the appropriate clause to eval to handle let expressions.

(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((quoted? exp) (text-of-quotation exp))
        ((assignment? exp) (eval-assignment exp env))
        ((definition? exp) (eval-definition exp env))
        ((if? exp) (eval-if exp env))
        ((let? exp) (eval# (let->combination exp) env))
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
         
; VERY simple actually. All we're doing is moving the arguments around from the let syntax to fit the lambda syntax

(define (let->combination exp)
  (cons (make-lambda (map car (cadr expr)) (cddr exp))
        (map cadr (cadr exp))))
