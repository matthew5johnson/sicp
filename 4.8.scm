(define (fib n)
  (let fib-iter ((a 1)
                 (b 0)
                 (count n))
    (if (= count 0)
        b
        (fib-iter (+ a b) a (- count 1)))))
       
; Question wants us to modify the let-> combination of 4.6 to support named let. Here's 4.6's answer:
(define (let->combination exp)
  (cons (make-lambda (map car (cadr exp)) (cddr exp))
        (map cadr (cadr exp))))
        
; 1st idea with a rough outline of the idea. this is bad and doesn't work 
(define (let->combination exp)
  (define (iter exp holder)
    (if (null? (cdr exp))
        holder
        (iter 
          (cadr exp) 
          (cons (make-lambda (map car (cadr exp)) (cddr exp))
                (map cadr (cadr exp)))))))
                
; better idea, but could be done with a let? 
(define (let->combination exp)
  (if (and (let? exp) (symbol? (cadr exp)))
      (sequence->exp
        (list (list 'define
                    (cons (cadr exp) (map car (caddr exp)))
                    (cadddr exp)))
              (cons (cadr exp) (map cadr (caddr exp))))
      (cons (make-lambda (let-vars exp)
                         (list (let-body exp)))
                         (let-inits exp)))) 
