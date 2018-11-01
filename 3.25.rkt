#lang sicp

; 3.3.3 Representing Tables

(define (lookup key-list)
    (define (iter keys table) 
        (cond ((null? keys) false) 
              ((null? (cdr keys)) 
                  (let ((record (assoc (car keys) (cdr table)))) 
                      (if record 
                          (cdr record) 
                          false))) 
                      (else     
                  (let ((subtable (assoc (car keys) (cdr table)))) 
                      (if subtable 
                          (iter (cdr keys) subtable) 
                          false))))) 
    (iter key-list local-table))

(define (lookup key-list)
  (let ((record (assoc key (cdr table))))
    (if record
        (cdr record)
        false)))

(define (assoc key records)
  (cond ((null? records) false)
        ((same-key? key (caar records)) (car records))
        (else (assoc key (cdr records)))))

(define (same-key? key counterpart tolerance)
  (if (=< (abs(- key counterpart)) tolerance)
      True
      False))

(define (insert! key value table)
  (let ((record (assoc key (cdr table))))
    (if record
        (set-cdr! record value)
        (set-cdr! table
                  (cons (cons key value) (cdr table)))))
  'ok)

(define (make-table same-key?)
  (define local-table (list '*table*)))