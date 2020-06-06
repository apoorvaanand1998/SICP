#lang sicp
(define (first-denomination cl) (car cl))
(define (except-first-denomination cl) (cdr cl))
(define (no-more? cl) (null? cl))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0)
            (no-more? coin-values)) 0)
        (else
         (+ (cc amount (except-first-denomination coin-values))
            (cc (- amount (first-denomination coin-values)) coin-values)))))

(define us-coins (list 50 25 10 5 1))
(cc 100 us-coins)

; The order of the coins does not affect the FINAL ANSWER
; but it does affect the speed of the computation
; Descending order is the most efficient
; This can be seen by drawing the recursion tree