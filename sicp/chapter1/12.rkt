#lang sicp

(#%require rackunit)

; Binomial coefficient:
; С(n, k) = n! / (k! * (n - k)!)

(define (factorial n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))

(define (binomial-coef n k)
  (/ (factorial n) (* (factorial k) (factorial (- n k)))))

(check-equal? (binomial-coef 6 3) 20)
(check-equal? (binomial-coef 7 4) 35)
(check-equal? (binomial-coef 8 5) 56)
(check-equal? (binomial-coef 9 6) 84)

(define (print-pascal-line n)
  (define (iter k)
    (display (binomial-coef n k)) (display " ")
    (if (= k n)
        (newline)
        (iter (+ k 1))))
  (iter 0))

(define (print-pascal n)
  (define (iter i)
    (print-pascal-line i)
    (if (= i n)
        (newline)
        (iter (+ i 1))))
  (iter 0))

(print-pascal 10)