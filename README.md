# SICP Study Notes

Solutions to exercises and notes accompanying the [SICP course](https://mitpress.mit.edu/sicp).

## Installing and Running Scheme

On a mac you can install Scheme with:

```
brew install rlwrap
brew install mit-schema
```

To start the REPL:

```
rlwrap mit-scheme
```

To load a file:

```
rlwrap mit-scheme --load solutions/ch1.scm
```

Hello World:

```scheme
(write "Hello world")
```

## 1.1 The Elements of Programming

Every powerful programming language has three fundamental mechanisms:

* Primitives
* Combinations
* Abstractions

In programming we deal with procedures and data.

### 1.1.7  Example: Square Roots by Newton's Method

```scheme
(define (square-root x)
  (define (good-enough? guess x)
    (< (abs (- (square guess) x))
       0.01))
  (define (average a b)
    (/ (+ a b) 2))
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (try guess x)
    (if (good-enough? guess x)
      guess
      (try (improve guess x) x)))
  (try 1 x))

(square-root 9) ; => 3.00009155413138
```

### 1.2.1 Linear Recursion and Iteration

* Linear recursive processes are linear in time and space
* Iterative processes are linear in time and constant in space

The recursive process builds up a chain of deferred operations.
The contraction occurs as the operations are actually performed.

Scheme tail-recursive, i.e. has tail-call optimization so that
iteration can programmed as a recursive procedure.

Recursive factorial:

```scheme
(define (factorial-rec n)
  (if (= n 1)
    1
    (* n (factorial-rec (- n 1)))))
(factorial-rec 5) ; => 120
```

Iterative factorial:

```scheme
(define (factorial-iter n)
  (define (iter counter product)
    (if (> counter n)
      product
      (iter (+ counter 1) (* product counter))))
  (iter 1 1))
(factorial-iter 5) ; => 120
```

Recursive addition:

```scheme
(define (add a b)
  (if (= a 0)
    b
    (+ 1 (add (- a 1) b))))
(add 3 5) ; => 8
```

Iterative addition:

```scheme
(define (add a b)
  (if (= a 0)
    b
    (add (- a 1) (+ b 1))))
(add 3 5) ; => 8
```

### 1.2.2 Tree Recursion

Tree recursive fibonacci implementation:

```scheme
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))
(fib 10) ; => 55
; 0 1 2 3 5 8 13 21 34 55
```

### 1.2.5 Greatest Common Divisors

The GCD of integers a and b is the largest integer that divides
both a and b with no remainder.

GCD(a, b) = GCD(b, r)

```scheme
(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))
(gcd 40 206) ; => 2
```


## Resources

* [SICP Book in HTML](https://mitpress.mit.edu/sicp/full-text/book/book-Z-H-4.html#%_toc_start)
* [MIT Scheme User Manual](https://www.gnu.org/software/mit-scheme/documentation/mit-scheme-user.pdf)
* [Why SICP Matters](https://people.eecs.berkeley.edu/~bh/sicp.html)
* [SICP Solutions](http://community.schemewiki.org/?SICP-Solutions)
* [SICP Solutions in Clojure](https://github.com/gregsexton/SICP-Clojure)
