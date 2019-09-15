#lang sicp
(define (cont-frac-rec n d k count)
  (if (= count k)
      (/ (n k) (d k))
      (/ (n count) (+ (d count) (cont-frac-rec n d k (+ count 1))))))

(define (try-rec k)
  (if (< (abs (- (cont-frac-rec (lambda (i) 1.0)
                 (lambda (i) 1.0)
                 k
                 1) 0.6180)) 0.0001)
      (display k)
      (try-rec (+ k 1))))

(define (cont-frac-iter n d k count result)
  (if (= 0 count)
      result
      (cont-frac-iter n d k (- count 1)
                      (/ (n (- count 1)) (+ (d (- count 1)) result)))))

(try-rec 1)
(newline)
(cont-frac-rec (lambda (i) 1.0)
               (lambda (i) 1.0)
               10 1)
(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                9 9
                (/ ((lambda (i) 1.0) 1.0) ((lambda (i) 1.0) 1.0)))
