;;;;   3.7

(define (make-account-37 balance pass-origin) 
   (define (withdraw amount) 
     (if (>= balance amount) 
         (begin (set! balance (- balance amount)) 
                balance) 
         "Insufficient funds")) 
  
   (define (deposit amount) 
     (set! balance (+ balance amount)) 
     balance) 
  
   (define (make-joint another-pass) 
     (dispatch another-pass)) 
  
   (define (dispatch password) 
     (lambda (pass m) 
       (if (eq? pass password) 
         (cond ((eq? m 'withdraw) withdraw) 
               ((eq? m 'deposit) deposit) 
               ((eq? m 'make-joint) make-joint) 
               (else (error "Unknown request -- MAKE-ACCOUNT" 
                            m))) 
         (lambda (x) 
           "Incorrect password")))) 
            
   (dispatch pass-origin))

(define (make-joint account password new-password)
  (define (grant-access p m)
    (if (eq? p new-password)
        (account password m)
        (lambda (amount) "___Incorrect password___")))
  grant-access)

(define peter-acc (make-account-37 800 'rosebud))

((peter-acc 'rosebud 'withdraw) 20)
> 780

(define paul-acc (make-joint peter-acc 'rosebud 'open-sesame))

((paul-acc 'open-sesame 'withdraw) 90)
> 690
