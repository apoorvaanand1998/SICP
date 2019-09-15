#lang racket

(define (cont-frac-iter n d k count result)
  (if (= 1 count)
      result
      (cont-frac-iter n d k (- count 1)
                      (/ (n (- count 1)) (+ (d (- count 1)) result)))))

(define (tan-cf x k) 
  (cont-frac-iter (lambda (i) 
               (if (= i 1) x (- (* x x)))) 
             (lambda (i) 
               (- (* i 2) 1)) 
             k k (/ ((lambda (i) 
               (if (= i 1) x (- (* x x)))) k) ((lambda (i) 
               (- (* i 2) 1)) k))))

(tan-cf 3.14 5) ; Should be around 0. Is around 0 :)