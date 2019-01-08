; rewrite eval so that the dispatch is done in data-directed style. Compare this with the data-directed differentiation procedure of 2.73. (use the car of a compound expression as the type of the expression, as is appropriate for the syntax implemented in this section)


(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ;;; this is where the original version parts ways with the data-directed version
        ((get (type-tag exp)) ((get (type-tag exp)) exp env))
        ((application? exp)
         (apply (eval (operator exp) env)
                 (list-of-values (operands exp) env)))
        (else
         (error "Unknown expression type -- EVAL" exp))))
 
(define table (make-table))
(define (get x) ((table 'lookup-proc) 'meta x))
(define (put y proc) ((table 'insert-proc!) 'meta y proc))
 
(define (start)
  (put 'quote quoted)
  (put 'define definition)
  (put 'set! definition)
  (put 'if if)
  (put 'lambda lambda)
  (put 'begin begin)
  (put 'cond cond)
  'done)
(start)
