#lang sicp

(define (accumulate-rec combiner null-value term a next b) 
    (if (> a b) null-value 
        (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b) 
    (define (iter a res) 
      (if (> a b) res 
          (iter (next a) (combiner res (term a))))) 
    (iter a null-value))

(define (sum term a next b)
  (accumulate-iter + 0 term a next b))

(define (prod term a next b)
  (accumulate-iter * 1 term a next b))