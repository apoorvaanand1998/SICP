#lang sicp

(define (sq x) (* x x))

(define (filtered-accumulate combiner null-value term a next b predicate)
  (define (iter a res)
    (if (> a b) res
        (if (predicate a)
            (iter (next a) (combiner res (term a)))
            (iter (next a) res))))
  (iter a null-value))

(define (smallest-div n) 
    (define (divides? a b) 
      (= 0 (remainder b a))) 
    (define (find-div n test) 
       (cond ((> (sq test) n) n) ((divides? test n) test) 
             (else (find-div n (+ test 1))))) 
    (find-div n 2)) 
  
(define (prime? n) 
     (if (= n 1) false (= n (smallest-div n)))) 
(define (gcd m n) 
   (cond ((< m n) (gcd n m)) 
         ((= n 0) m) 
         (else (gcd n (remainder m n)))))
(define (relative-prime? m n) 
 (= (gcd m n) 1))

(define (sum-of-prime-squares a b) (filtered-accumulate + 0 sq a inc b prime?))

(define (product-of-relative-primes n) 
   (define (filter x) 
     (relative-prime? x n)) 
 (filtered-accumulate * 1 identity 1 inc n filter))

(sum-of-prime-squares 1 10)
(product-of-relative-primes 10)

