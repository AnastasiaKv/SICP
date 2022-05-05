#lang sicp

(#%require racket/trace)

(define (cube x)
  (* x x x))

(define (p x)
  (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(trace p)
(sine 12.15)

; a) For (sine 12.15) 'p' will be called 5 times
; b) (sin a)
; a / 3^n <= 0.1
; n >= log3(10*a)
; O(log a) - the number of steps grows logarithmically with the angle
; and memory grows in proportion to the number of steps
