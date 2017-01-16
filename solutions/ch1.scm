; (write "Hello world")

; 1.1

10
(+ 5 3 4) ; 12
(- 9 1) ; 8
(/ 6 2) ; 3
(+ (* 2 4) (- 4 6)) ; 6
(define a 3) ; a
(define b (+ a 1)) ; b
(+ a b (* a b)) ; 19
(= a b) ; #f
(if (and (> b a) (< b (* a b)))
    b
    a) ; 4
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25)) ; 16
(+ 2 (if (> b a) b a)) ; 6
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1)) ; 16

; 1.2

(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

; Define a procedure that takes three numbers as arguments
; and returns the sum of the squares of the two larger numbers.
; 1.3
(define (sum-square-two a b c)
  (cond ((<= a b c) (+ (square b) (square c)))
        ((<= b a c) (+ (square a) (square c)))
        ((<= c a b) (+ (square a) (square b)))))
(sum-square-two 3 2 5) ; 34
(sum-square-two 2 2 2) ; 8

; 1.4

; The operand/function to invoke is determined dynamically at runtime
; based on the input values.
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
(a-plus-abs-b 1 -1) ; 2
(a-plus-abs-b 1 1) ; 2

; 1.5

; Applicative order evaluation causes an infinite loop in p as the operands are
; evaluated before the test operator is invoked. The normal order evaluation
; evaluation model on the other hand does not have this problem as the evaluation
; of p is postponed and ends up not being needed and thus never happens in this case.

(define (p) (p))
(define (test x y)
  (if (= x 0)
    0
    y))
(test 0 (p))
