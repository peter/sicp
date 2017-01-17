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

;(define (p) (p))
;(define (test x y)
;  (if (= x 0)
;    0
;    y))
;(test 0 (p))

; 1.6

; The new-if function causes an eternal loop as the else clause will always evalute

; 1.7

; For very large numbers the floating point precision capacity of the language
; will not be enough and for small numbers the precision of the result will not be enough
; "Stop when the change is a very small fraction of the guess"

(define (square-root-precise x)
  (define (good-enough? prev-guess guess x)
    (< (/ (abs (- guess prev-guess)) guess)
       0.001))
  (define (average a b)
    (/ (+ a b) 2.0))
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (try prev-guess guess x)
    (if (good-enough? prev-guess guess x)
      guess
      (try guess (improve guess x) x)))
  (try 1 (improve 1 x) x))

(square-root-precise 9) ; => 3.000000001396984
(square-root-precise 1000000) ; => 1000.0001533016629
(square-root-precise 0.001) ; => 0.03162278245070105

(define (square-root x)
  (define (good-enough? guess x)
    (< (abs (- (square guess) x))
       0.01))
  (define (average a b)
    (/ (+ a b) 2.0))
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (try guess x)
    (if (good-enough? guess x)
      guess
      (try (improve guess x) x)))
  (try 1 x))

(square-root 9) ; => 3.00009155413138
(square-root 1000000) ; => 1000.0000000000118
(square-root 0.001) ; => 0.06772532736082602


; 1.46

(define (iterative-improve improve good-enough?)
  (lambda (guess)
    (let ((improved-guess (improve guess)))
      (if (good-enough? guess improved-guess)
        guess
        ((iterative-improve improve good-enough?) improved-guess)))))

(define (good-enough? prev-guess guess)
  (define tolerance 1.e-6)
  (< (/ (abs (- prev-guess guess)) guess)
     tolerance))

(define (average a b)
  (/ (+ a b) 2.0))

(define (improve guess x)
  (average guess (/ x guess)))

(define (square-root x)
  ((iterative-improve
    (lambda (y)
      (/ (+ y (/ x y)) 2))
    good-enough?) 1.0))

(square-root 9) ; => 3.000000001396984
