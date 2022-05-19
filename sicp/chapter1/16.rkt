#lang sicp

(#%require rackunit)

; recursive process of exponentiation
; O(n) steps
; O(n) memory
(define (expt-recursion b n)
  (if (= n 0)
      1
      (* b (expt-recursion b (- n 1)))))

(check-equal? (expt-recursion 2 4) 16)
(check-equal? (expt-recursion 5 5) 3125)

; iterity process of exponentiation
; O(n) steps
; O(1) memory
(define (expt-iterity b n)
  (expt-iter b n 1))

(define (expt-iter b counter acc)
  (if (= counter 0)
      acc
      (expt-iter b
                 (- counter 1)
                 (* b acc))))

(check-equal? (expt-iterity 2 4) 16)
(check-equal? (expt-iterity 5 5) 3125)

; fast exponentiation
; O(log(n)) steps
; O(log(n)) memory
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))

(check-equal? (fast-expt 2 4) 16)
(check-equal? (fast-expt 5 5) 3125)

; iterity process of fast exponentiation
(define (fast-expt-iterity b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b n acc)
  (cond ((= n 0) acc)
        ((even? n) (fast-expt-iter (square b) (/ n 2) acc))
        (else (fast-expt-iter b (- n 1) (* b acc)))))

(check-equal? (fast-expt-iterity 2 4) 16)
(check-equal? (fast-expt-iterity 5 5) 3125)