#lang racket
(#%provide (all-defined))

#|
If there are any specific instructions for a problem, please read them carefully. Otherwise,
follow these general rules:
   - replace the 'UNIMPLEMENTED symbol with your solution
   - you are NOT allowed to change the names of any definition
   - you are NOT allowed to change the number of arguments of the pre-defined functions,
     but you can change the names of the arguments if you deem it necessary.
   - make sure that you submit an asnwer sheet that compiles! If you cannot write
     a correct solution at least make it compile, if you cannot make it compile then
     comment it out. In the latter case, make sure that the default definitions
     for the problem are still present. Otherwise you may be penalized up to 25%
     of the total points for the homework.
   - you may use any number of helper functions you deem necessary.

When done, make sure that you do not get any errors when you hit the "Run" button. You will
lose up to 25% of the total points for the entire homework depending on the number of errors.
If you cannot come up with a correct solution then please make the answer-sheet
compile correctly and comment any partial solution you might have; if this is the case,
the default definitions will have to be present!

|#
;======================================01=======================================
;((3 + 3) * 9)
;equal to 54
(define (p1-1)
  (* (+ 3 3) 9)
)

;((6 * 9) / ((4 + 2) + (4 * 3)))
;equal to 3
(define (p1-2)
  (/ (* 6 9) (+ (+ 4 2) (* 4 3)) )
)

;(2* ((20 - (91 / 7)) * (45 - 42)))
;equal to 42
(define (p1-3)
  (* 2 (* (- 20 (/ 91 7)) (- 45 42)))
)
;======================================02=======================================
;write your answer as a string; you do not need to write any special escape
;characters to distinguish new lines.
(define p2
  "In general, an algebraic method should be treated like a tree, with the
operation being on top and the inputs as the children, you then read from
the top down."
)
;======================================03=======================================
;;Write the definitions of x,y,z here:
(define x 2) (define y 3) (define z 4)
;======================================04=======================================
;you will need to have solved problem 3. The values x,y,z are not parameters
;of this function!
(define (p4)
  (if (= x y z)
      0
      (if (< x z)
          (if (< x y)
              (+ y z)
              (+ y z))
          (if (< y z)
              (+ x z)
              (+ x y))))
)

;======================================05=======================================
(define (p5)
  (if (= x y z)
      0
      (if (> x z)
          (if (> x y)
              (+ y z)
              (+ y z))
          (if (> y z)
              (+ x z)
              (+ x y))))  
)

;======================================06=======================================
(define (p6)
  (= x y)  
)

;======================================07=======================================
;same instructions as problem 02.
(define p7
  "In this case there is no difference symantically, but the first is usually used
to define a variable, while the second is usually used to define a function as
you can give inputs within the parentheses"
)

;======================================08=======================================
;same instructions as problem 02.
(define p8
  "the single quote tells the compiler to take everything after it at face value"
)

;======================================09=======================================
;same instructions as problem 02.
(define p9
  "The difference is that a single quote can be used for multiple purposes, while the
sole purpose of list is to create lists"
)

;======================================10=======================================
;same instructions as problem 02.
(define p10
  "It is possible to distinguish between two strings of the same name,
but it is not possible to do that with two symbols. There is a difference between
the two as a symbol is an object representing a string."
)

;======================================11=======================================
;(4 2 6 9)
(define (p11-1)
  (list 4 2 6 9)  
)

;(spaceship
;  (name(serenity))
;  (class(firefly)))
(define (p11-2)
  'UNIMPLEMENTED  
)

;(2 * ((20 - (91 / 7)) * (45 - 42)))
(define (p11-3)
  'UNIMPLEMENTED  
)

;======================================12=======================================
(define example '(a b c))

;(d a b c)
(define (p12-1 lst)
  (append '(d) lst)
)

;(a b d a b)
(define (p12-2 lst)
  (list (car lst) (cadr lst) 'd (car lst) (cadr lst)) 
)

;(b c d a)
(define (p12-3 lst)
  (append (cdr lst) (list 'd (car lst)))
)


;======================================13=======================================
(define p13
  "equal? can test for equality between lists and strings while eq? can not"
)
; write your answer as a string; you do not need to write any special escape
; characters to distinguish new lines.


;======================================14=======================================
(define (create-error-msg sym val)
   (string-append "This is a custum error message we will be using next. Symbol '"(symbol->string sym) " was not paired with value " (number->string val)) 
)
;======================================15=======================================
(define (check-correctness pair)
  (if (equal? (car pair) 'answer-to-everything)
      (if (= (cadr pair) 42) #t
          (create-error-msg (car pair) (cadr pair)))
      #f)
)

;======================================16=======================================
;No answer necessary - just experiment it as instructed in hw01.txt file

