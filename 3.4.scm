
;;;;   3.4
(define (make-account-error-enabled balance password)
  (define bad-passwords 0)
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
           (set! bad-passwords (+ bad-passwords 1))
           (if (> bad-passwords 7)
               (lambda (v) (call-the-cops))
               (lambda (v) "Incorrect Password")))
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- Make-Account"
                       m))))
  dispatch)
(define (call-the-cops) (error "We're calling the cops"))

(define account1 (make-account-error-enabled 100 'tencent))

((account1 'deposit 'wrongpass) 50)
((account1 'deposit 'wrongpass) 50)
((account1 'deposit 'wrongpass) 50)
((account1 'deposit 'wrongpass) 50)
((account1 'deposit 'wrongpass) 50)
((account1 'deposit 'wrongpass) 50)
((account1 'deposit 'wrongpass) 50)
((account1 'deposit 'wrongpass) 50)

>ERROR: We're calling the cops
