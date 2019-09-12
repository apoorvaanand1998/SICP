#lang sicp

(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpsons-rule f a b n)
  (define h (/ (- b a) n))
  (define (yk k) (f (+ a (* k h))))
  (define (inc2 x) (+ x 2))
  (define (4-terms)
    (* 4 (sum yk 1 inc2 (- n 1))))
  (define (2-terms)
    (* 2 (sum yk 2 inc2 (- n 2))))
  (* (/ h 3) (+ (f a) (f b) (4-terms) (2-terms))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(simpsons-rule cube 0 1 100)
(simpsons-rule cube 0 1 1000)
(integral cube 0 1 0.001)
