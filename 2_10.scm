#lang sicp
(define (make-interval a b) (cons a b))

(define (upper-bound interval)
  (max (car interval) (cdr interval)))

(define (lower-bound interval)
  (min (car interval) (cdr interval)))

(define (add-interval a b)
  (make-interval (+ (lower-bound a) (lower-bound b))
                 (+ (upper-bound a) (upper-bound b))))

(define (sub-interval a b)
  (add-interval a
                (make-interval (- (upper-bound b)) (- (lower-bound b)))))

(define (mul-interval a b)
  (let ((p1 (* (lower-bound a) (lower-bound b)))
        (p2 (* (lower-bound a) (upper-bound b)))
        (p3 (* (upper-bound a) (lower-bound b)))
        (p4 (* (upper-bound a) (upper-bound b))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (spans-zero? interval)
  (if (and (or (< (lower-bound interval) 0)
               (= (lower-bound interval) 0))
           (or (> (upper-bound interval) 0)
               (= (lower-bound interval) 0)))
      #t
      #f))

(define (div-interval a b)
  (if (spans-zero? b)
      (error "Trying to divide by interval that spans zero")
      (mul-interval a
                (make-interval (/ 1 (upper-bound b)) (/ 1 (lower-bound b))))))

(define i1 (make-interval -1 3))
(define i2 (make-interval 2 9))

(div-interval i1 i2)
(div-interval i2 i1)