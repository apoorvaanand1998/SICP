#lang sicp
(define (make-interval a b) (cons a b))

(define (upper-bound interval)
  (max (car interval) (cdr interval)))

(define (lower-bound interval)
  (min (car interval) (cdr interval)))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (upper-bound i) (lower-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent center percent)
  (let ((w (* center (* percent 0.01))))
    (make-interval (- center w) (+ center w))))

(define (percent i)
  (* (/ (width i) (center i)) 100.0))

(define i (make-center-percent 10 50)) 
 (lower-bound i) 
 (upper-bound i) 
 (center i) 
 (percent i)


