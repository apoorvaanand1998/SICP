#lang sicp

(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3)))))))

(f 5)

(define (fi n)
  (define (fi-helper nm1 nm2 nm3 start)
    (cond ((= start n)
           (+ nm1 (* 2 nm2) (* 3 nm3)))
          (else (fi-helper (+ nm1 (* 2 nm2) (* 3 nm3)) nm1 nm2 (+ start 1)))))
  (cond ((< n 3) n)
        (else (fi-helper 2 1 0 3))))

(fi 5)