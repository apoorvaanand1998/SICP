#lang sicp

(define (smallest-divisor n)
  (define (sdi n c)
    (cond ((> (* c c) n) n)
          ((= 0 (remainder n c)) c)
          (else (sdi n (+ c 1)))))
  (sdi n 2))

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)
