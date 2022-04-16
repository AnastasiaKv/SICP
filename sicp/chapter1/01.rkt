#lang sicp

(#%require rackunit)

(define epression1 10)
(check-equal? epression1 10)

(define epression2 (+ 5 3 4))
(check-equal? epression2 12)

(define epression3 (- 9 1))
(check-equal? epression3 8)

(define epression4 (/ 6 2))
(check-equal? epression4 3)

(define epression5 (+ (* 2 4) (- 4 6)))
(check-equal? epression5 6)

(define a 3)
(check-equal? a 3)

(define b (+ a 1))
(check-equal? b 4)

(define epression6 (+ a b (* a b)))
(check-equal? epression6 19)

(define epression7 (= a b))
(check-equal? epression7 #f)

(define epression8 (if (and (> b a)
                            (< b (* a b)))
                            b 
                            a))
(check-equal? epression8 4)

(define epression9 (cond ((= a 4) 6)
                         ((= b 4) (+ 6 7 a))
                         (else 25)))
(check-equal? epression9 16)

(define epression10 (+ 2 (if (> b a) b a)))
(check-equal? epression10 6)

(define epression11 (* (cond ((> a b) a)
                             ((< a b) b)
                             (else -1))
                        (+ a 1)))
(check-equal? epression11 16)

