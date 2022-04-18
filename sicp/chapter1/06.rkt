#lang sicp

(#%require rackunit)

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(check-equal? (new-if (= 2 3) 0 5) 5)
(check-equal? (new-if (= 1 1) 0 5) 0)

#|review: 
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                      x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

ignore|#

#| In this case I'm tried to compare 'if' and 'cond' and found out
that when you tring to evaluate 'cond' statment, all of 'cond' arguments 
should be alrady evaluated (based on the applicative-order evaluate).
So, when we add the sqrt-iter recursive procedure as the third argument, it loops.
However, statment 'if' it's a special form and to evaluate it not all argumnets 
sholud be evaluated but at least two of them. It's give us some guarantees exit from the loop.|#
