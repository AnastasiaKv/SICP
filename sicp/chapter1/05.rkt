#lang sicp

(#%require rackunit)

(define (p) (p))

(define (test a b)
        (if ( = a 0)
            0
            b))

;(test 0 (p))

#| (p) it's a resursive procedure.
For applicative-order evaluate of (p) never return, because it never stop recursing.
For normal-order evaluate (test 0 (p)) return 0,
because in conditional statment second argument (p) never need to be evalueted |#