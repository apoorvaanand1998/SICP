#lang sicp

(define (pte r c)
  (cond ((or (= c 1)
            (= r c))
        1)
        (else (+ (pte (- r 1) (- c 1))
                 (pte (- r 1) c)))))

(pte 5 2)
(pte 5 3)
(pte 5 4)