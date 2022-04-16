#lang sicp

(#%require rackunit)

(define (square a)
        (* a a))

(define (sum-of-squares a b)
        (+ (square a) (square b)))

(define (solution a b c)
        (sum-of-squares (max a b c)
                        (min (max a b)
                             (max b c)
                             (max a c))))

(check-equal? (solution 1 2 3) 13)
(check-equal? (solution 0 1 -2) 1)
(check-equal? (solution 5 5 5) 50)
