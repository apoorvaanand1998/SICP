#lang sicp

(define (square x)
  (* x x))

(define (make-segment start end)
  (cons start end))
(define (start-segment seg)
  (car seg))
(define (end-segment seg)
  (cdr seg))

(define (make-point x y)
  (cons x y))
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

(define (length-segment seg)
  (sqrt (+ (square (- (x-point (end-segment seg))
                      (x-point (start-segment seg))))
           (square (- (y-point (end-segment seg))
                      (y-point (start-segment seg)))))))
           
(define (make-rectangle-lw len-seg width-seg)
  (cons len-seg width-seg))

(define (make-rectangle-d ld rd)
  (cons ld rd))

(define (make-rectangle lw1-d2 l-ld w-rd)
  (if (= lw1-d2 1)
      (cons 1 (make-rectangle-lw l-ld w-rd))
      (cons 2 (make-rectangle-d l-ld w-rd))))

(define (find-type rect)
  (car rect))

(define (base rect)
  (if (= (find-type rect) 1)
      (length-segment (car (cdr rect)))
      (length-segment (make-segment (start-segment (cdr (cdr rect)))
                                    (end-segment (car (cdr rect)))))))

(define (height rect)
  (if (= (find-type rect) 1)
      (length-segment (cdr (cdr rect)))
      (length-segment (make-segment (start-segment (cdr (cdr rect)))
                                    (start-segment (car (cdr rect)))))))

(define (perimeter rect)
  (* 2 (+ (base rect)
          (height rect))))
(define (area rect)
  (* (base rect)
     (height rect)))

(define r1 (make-rectangle 1 (make-segment (make-point 5 0)
                                           (make-point 0 0))
                           (make-segment (make-point 0 0)
                                         (make-point 10 0))))
(perimeter r1)
(area r1)

;; same rectangle in diagnol form
(define r2 (make-rectangle 2 (make-segment (make-point 0 5)
                                           (make-point 10 0))
                           (make-segment (make-point 0 0)
                                         (make-point 5 10))))
(newline)
(perimeter r2)
(area r2)
     

