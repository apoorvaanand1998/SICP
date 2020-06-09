#lang sicp
(define (for-each proc l)
  (if (null? l)
      #t
      (and (proc (car l)) (for-each proc (cdr l)))))

(for-each (lambda (x)
            (display x)
            (newline))
          (list 35 352 253))
