; Write a version of list-of-values that evaluates operands from left to right regardless of the order of evaluation in the underlying Lisp. Also write a version of list-of-values that evaluates operands from right to left

?????????????
; R -> L
(define (list-of-values exps env) 
   (if (no-operand? exps) 
       '() 
       (let ((L (eval (rest-operands exps) env)) 
                 (R (eval (first-operand exps) env))) 
         (cons L R))))
