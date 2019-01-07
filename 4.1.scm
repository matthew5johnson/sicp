; Write a version of list-of-values that evaluates operands from left to right regardless of the order of evaluation in the underlying Lisp. Also write a version of list-of-values that evaluates operands from right to left

; original list-of-values
(define (list-of-values exps env)
  (if (no-operands? exps)
      '()
      (cons (eval (first-operand exps) env)
            (list-of-values (rest-operands exps) env))))
; R -> L
(define (list-of-values exps env) 
   (if (no-operand? exps) 
       '() 
       (let ((L (eval (rest-operands exps) env)) 
                 (R (eval (first-operand exps) env))) 
         (cons L R))))

; L -> R
(define (list-of-values exps env) 
   (if (no-operand? exps) 
       '() 
       (let ((R (eval (rest-operands exps) env)) 
                 (L (eval (first-operand exps) env))) 
         (cons R L))))
