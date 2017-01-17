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

## Resources

* [SICP Book in HTML](https://mitpress.mit.edu/sicp/full-text/book/book-Z-H-4.html#%_toc_start)
* [MIT Scheme User Manual](https://www.gnu.org/software/mit-scheme/documentation/mit-scheme-user.pdf)
* [Why SICP Matters](https://people.eecs.berkeley.edu/~bh/sicp.html)
* [SICP Solutions in Clojure](https://github.com/gregsexton/SICP-Clojure)
