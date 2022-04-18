#lang sicp

(#%require rackunit)

(define tolerance 1e-8)

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess previuos-guess)
  (< (abs (/ (- guess previuos-guess) guess )) tolerance))

(define (sqrt-iter guess previous-guess x)
  (if (good-enough? guess previous-guess)
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (sqrt x)
  (sqrt-iter 0.1 1.0 x))


(define-simple-check (check-approx? actual expected)
    (< (abs (- actual expected)) tolerance))

(check-approx? (sqrt 9) 3.0)
(check-approx? (sqrt 100) 10.0)
(check-approx? (sqrt 0.49) 0.7)
(check-approx? (sqrt 0.0064) 0.08)
(check-approx? (sqrt 0.000025) 0.005)