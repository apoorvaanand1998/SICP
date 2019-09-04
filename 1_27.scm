#lang sicp

(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (fti counter)
    (if (= counter n)
        true
        (if (= (expmod counter n n) counter)
            (fti (+ counter 1))
            false)))
  (fti 1))

(fermat-test 561) ; returns true but is actually not prime
(fermat-test 1105) ; same as above
  