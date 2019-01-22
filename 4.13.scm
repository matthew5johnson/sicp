; 4.13

; define it as '()
(define (make-unbound! var env) 
   (let* ((frame (first-frame env)) 
          (vars (frame-variables frame)) 
          (vals (frame-values frame))) 
     (define (scan pre-vars pre-vals vars vals) 
       (if (not (null? vars)) 
           (if (eq? var (car vars)) 
               ; reset to unbind
               (begin (set-cdr! pre-vars (cdr vars)) 
                      (set-cdr! pre-vals (cdr vals))) 
               (scan vars vals (cdr vars) (cdr vals))))) 
     (if (not (null? vars)) 
         (if (eq? var (car vars))
             ; reset to unbind
             (begin (set-car! frame (cdr vars)) 
                    (set-cdr! frame (cdr vals))) 
             (scan vars vals (cdr vars) (cdr vals))))))
