#lang sicp

(#%require rackunit)
;(#%require racket/trace)

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
;(trace A)

(check-equal? (A 1 10) 1024)
(check-equal? (A 2 4) 65536)
(check-equal? (A 3 3) 65536)

(define (k n) (* 5 n n)) ; k = 5*n^2

(check-equal? (k 3) (* 5 3 3))
(check-equal? (k 6) (* 5 6 6))

(define (f n) (A 0 n)) ; f = 2*n

(check-equal? (f 5) (* 2 5))
(check-equal? (f 28) (* 2 28))

(define (g n) (A 1 n)) ; g = 2^n

(check-equal? (g 3) (* 2 2 2))
(check-equal? (g 6) (* 2 2 2 2 2 2))

(define (h n) (A 2 n)) ; h = 2^h(n-1)


(check-equal? (h 3) (* (* 2 2)
                       (* 2 2)))
(check-equal? (h 4) (* (* (* (* 2 2)
                             (* 2 2))
                          (* (* 2 2)
                             (* 2 2)))
                       (* (* (* 2 2)
                             (* 2 2))
                          (* (* 2 2)
                             (* 2 2)))))


