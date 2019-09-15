#lang sicp

(define (cont-frac-iter n d k count result)
  (if (= 1 count)
      result
      (cont-frac-iter n d k (- count 1)
                      (/ (n (- count 1)) (+ (d (- count 1)) result)))))

(define (d i)
  (cond ((or (= (remainder i 3) 1) (= (remainder i 3) 0)) 1.0)
        (else (/ (+ i 1) 1.5))))

(cont-frac-iter (lambda (x) 1.0) d 100 100 (/ 1.0 (d 100)))
