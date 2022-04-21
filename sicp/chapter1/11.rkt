#lang sicp

(#%require rackunit)

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (f (- n 2)) (f (- n 3)))))

(check-equal? (f 2) 2)
(check-equal? (f 7) 37)
(check-equal? (f 10) 230)

(define (g n)
  (define (iter a b c count)
    (if (= count 3)
        (+ a b c)
        (iter (+ a b c) a b (- count 1))))
  (if (< n 3)
      n
      (iter 2 1 0 n)))

(check-equal? (g 2) 2)
(check-equal? (g 7) 37)
(check-equal? (g 10) 230)

