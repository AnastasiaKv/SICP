#lang sicp

(#%require rackunit)

(define (a-plus-abs-b a b)
        ((if (> b 0)
             +
             -) a
                b))

#| changing operator accordingly 
to the sign of the operand 'b' =>
one of the solutions to get (a + |b|) |#

(check-equal? (a-plus-abs-b 3 -4) 7)