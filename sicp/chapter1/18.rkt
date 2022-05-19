#lang sicp

(#%require rackunit)

(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

(define (double a)
  (* a 2))

(define (halve a)
  (/ a 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-mult a b)
  (fast-mult-iter a b 0))

(define (fast-mult-iter a b acc)
  (cond ((= b 0) acc)
        ((even? b) (fast-mult-iter (double a) (halve b) acc))
        (else (fast-mult-iter a (- b 1) (+ a acc)))))

(check-equal? (fast-mult 5 8) 40)
(check-equal? (fast-mult 17 5) 85)