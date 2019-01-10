(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((quoted? exp) (text-of-quotation exp))
        ((assignment? exp) (eval-assignment exp env))
        ((definition? exp) (eval-definition exp env))
        ((if? exp) (eval-if exp env))
        ((and? exp) (eval-and (cdr exp) env))
        ((or? exp) (eval-or (cdr exp) env))
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

(define (eval-and remaining env)
  (let next (previous true)
    (if (and (null? remaining) previous)
        previous
        (next (eval (car remaining) env) (cd remaining env))))))

(define (eval-or remaining env)
  (let next (previous false)
    (if (or (null? remaining) previous)
        remaining
        (next (eval (car remaining) env) (cd remaining env))))))
  
