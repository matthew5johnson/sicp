;;;;   3.3
(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient Funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m key) 
    (cond ((not (eq? key password))
           (error "Incorrect Password")
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- Make-Account"
                       m))))
  dispatch)

(define acc (make-account 100 'viola))

((acc 'deposit 'wrongpass) 50)
> "Incorrect Password"

((acc 'withdraw 'viola) 25)
> 75
