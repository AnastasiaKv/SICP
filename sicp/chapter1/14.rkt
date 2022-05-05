#lang sicp

(#%require racket/trace)

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
  ((= kinds-of-coins 2) 5)
  ((= kinds-of-coins 3) 10)
  ((= kinds-of-coins 4) 25)
  ((= kinds-of-coins 5) 50)
  (else 0)))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (count-change amount)
  (cc amount 5))

(trace cc)
(count-change 11)

; The order of growth of space for cc will be O(n).
; Since the maximum height of the tree grows linearly with the amount to be exchanged,
; the order of growth of the memory is also linear.

; The orders of growth of number of steps is O(n^5)

