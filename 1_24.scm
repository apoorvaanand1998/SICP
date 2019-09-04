#lang sicp

(define (search-for-primes from counter)
  (if (> counter 0)
      (cond ((fast-prime? from 3) (and (timed-prime-test from) (search-for-primes (+ from 1) (- counter 1))))
            (else (search-for-primes (+ from 1) counter)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (square x)
  (* x x))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))
               
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 3)
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
(search-for-primes 1000000000 3)
; Since the fermat test is O(log n) the testing of primes around 1000000 is going to require
; just 3 more tests than testing of primes around 1000, and our runtimes show this as well