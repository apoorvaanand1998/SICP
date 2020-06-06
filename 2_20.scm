#lang sicp

(define (reverse l)
  (define (reverse-help l a)
    (if (null? l)
        a
        (reverse-help (cdr l) (cons (car l) a))))
  (reverse-help l (list)))

(define (same-parity first . rest)
  (define (same-parity-help parity ans rest)
    (cond ((null? rest)
           (reverse ans))
          (else 
           (if (= parity (remainder (car rest) 2))
                     (same-parity-help parity (cons (car rest) ans) (cdr rest))
                     (same-parity-help parity ans (cdr rest))))))
  (same-parity-help (remainder first 2) (list first) rest))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)        