#lang sicp

(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))

(define (expmod base exp m)
  (define (check-ntsr? x)
    (if (and (not (= x 1))
             (not (= x (- m 1)))
             (= (remainder (square x) m) 1)) ;"whose square is equal to 1 modulo n"
        ; and initially, (= (square x) 1) was tried. Book should say CONGRUENT TO 1 modulo n instead
        0
        (square x)))
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (check-ntsr? (expmod base (/ exp 2) m))
                    m))
        (else (remainder (* base
                            (expmod base (- exp 1) m))
                         m))))

(define (miller-rabin n)
  (define (try-it a)
    (not (= (expmod a (- n 1) n) 0)))
  (try-it (+ 1 (random (- n 1)))))

(define (miller-rabin-test n)
  (define (run-x-times x)
    (cond ((= x 0) true)
          ((miller-rabin n)
           (run-x-times (- x 1)))
          (else false)))
  (run-x-times (+ 2 (quotient n 2))))

(miller-rabin-test 3) ;should return t
(miller-rabin-test 5)
(miller-rabin-test 15) ;should return f for all below
(miller-rabin-test 27)
(miller-rabin-test 561)
(miller-rabin-test 1729)
(miller-rabin-test 6601)
