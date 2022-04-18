#lang sicp

(#%require rackunit)

(define tolerance 1e-8)

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (good-enough? guess previuos-guess)
  (< (abs (/ (- guess previuos-guess) guess )) tolerance))

(define (cbrt-iter guess previous-guess x)
  (if (good-enough? guess previous-guess)
      guess
      (cbrt-iter (improve guess x) guess x)))

(define (cbrt x)
  (cbrt-iter 0.1 1.0 x))

(define-simple-check (check-approx? actual expected)
    (< (abs (- actual expected)) 1e-8))

(check-approx? (cbrt 27) 3.0)
(check-approx? (cbrt 1000) 10.0)
(check-approx? (cbrt 0.343) 0.7)
(check-approx? (cbrt 0.000512) 0.08)
(check-approx? (cbrt 0.000000125) 0.005)