#lang sicp

(define (search-for-primes from counter)
  (if (> counter 0)
      (cond ((prime? from) (and (timed-prime-test from) (search-for-primes (+ from 1) (- counter 1))))
            ((prime? from) (search-for-primes (+ from 1) (- counter 1)))
            (not (prime? from) (search-for-primes (+ from 1) counter)))))
               
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (smallest-divisor n)
  (define (sdi n c)
    (cond ((> (* c c) n) n)
          ((= 0 (remainder n c)) c)
          (else (sdi n (+ c 1)))))
  (sdi n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(search-for-primes 1000 3)
(search-for-primes 10000 3)
(search-for-primes 100000 3)
(search-for-primes 1000000 3)
; Yes, the algorithm takes around 3 times more time when input is doubled, as predicted