#lang sicp

(#%require rackunit)

(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

(check-equal? (* 2 4) 8)
(check-equal? (* 5 9) 45)

(define (double a)
  (* a 2))

(check-equal? (double 4) 8)
(check-equal? (double 55) 110)

(define (halve a)
  (/ a 2))

(check-equal? (halve 24) 12)
(check-equal? (halve 42) 21)

(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-mult a (halve b))))
        (else (+ a (fast-mult a (- b 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(check-equal? (fast-mult 6 8) 48)
(check-equal? (fast-mult 20 9) 180)
