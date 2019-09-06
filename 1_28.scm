#lang sicp

(define (ntsr n m)
  (if (and (not (or (= n 1)
                    (= n (- m 1))))
           (= (remainder (* n n) m) 1))
      0
      (remainder (* n n) m)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (ntsr (expmod base (/ exp 2) m) m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(miller-rabin-test 561) ; Should return false
(miller-rabin-test 17) 