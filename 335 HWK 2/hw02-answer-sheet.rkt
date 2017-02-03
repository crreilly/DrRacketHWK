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
     for the problem are still present. 
   - you may use any number of helper functions you deem necessary.

When done, make sure that you do not get any errors when you hit the "Run" button. 
If you cannot come up with a correct solution then please make the answer-sheet
compile correctly and comment any partial solution you might have; if this is the case,
the default definitions will have to be present!
|#
;======================================01=======================================
(define (list-of-even-numbers? lst)
  (if (null? lst) ;base case '() will return #t for this 
      true ;an empty list is true
      (if (and (integer? (car lst)) (even? (car lst)))
          (list-of-even-numbers? (cdr lst))
          false))) 

;======================================02=======================================
;;for n > 0
;Sn = 1/1 + 1/4 + 1/9 + 1/16 + ...
(define (series-a n)
  (if (<= n 0)
      0
      (+ (/ 1 (* n n)) (series-a (- n 1))))
      
)

;====
;;for n >= 0
;Sn = 1 - 1/2 + 1/6 - 1/24 + ...
(define (series-b n)
  (if (< n 0)
      0
      (+ (/ (expt -1 n) (comp-fact (+ n 1))) (series-b (- n 1))))
)

;computes the factorial
(define (comp-fact n)
  (if (= n 1)
      1 ;base case
      (* n (comp-fact (- n 1))))) 

;======================================03=======================================
;base case is if n == 0, return a list of '(%)
;for non base cases, first check if odd, odd uses '+', even uses '%'
;1st step will be to expand on previous
;2nd step will be to add a string of (+ (* n 2) 1) characters to the top and bottom
; (which is actually the beginning and end)
(define (carpet n)
  (if (= n 0)
      '((%))
      (add-top-bottom (expand-each-line (carpet (- n 1))
                                        (find-sym n))n)))
(define (find-sym n)
  (if (odd? n)
     '+
     '%))

(define (expand-each-line carp sym) ;sym is either + or %
  (if (eq? carp '())
     '()
     (cons (append (cons sym (car carp)) (list sym)) ;first line
         (expand-each-line (cdr carp) sym))))

(define (add-top-bottom carp n)
  (append (list (build-list (+ (* n 2) 1) (const (find-sym n)))) carp
          (list (build-list (+ (* n 2) 1) (const (find-sym n))))))

;======================================04=======================================
(define (pascal n)
   (if (= n 1)
      '((1))
      (insert (create_row (last (pascal (- n 1)))) (pascal (- n 1)))))

;Meld the top and bottom to create a larger pyramid
(define (insert bottom top)
  (append top (list bottom)))

;Will append 1's to each side of the 'core'
(define (create_row last_row)
  (append '(1) (create_core last_row) '(1)))

;Will create a 'core' which is the new row without the 1's 
(define (create_core last_row) 
  (if (equal? (cdr last_row) '())
      '()
      (append (list (+ (car last_row) (cadr last_row))) (create_core (cdr last_row)))))

;======================================05=======================================
(define (balanced? in)
  (if (is-balanced? (string->list in) 0)
      "balanced"
      "unbalanced")
)

(define (is-balanced? lst cnt)
  (cond
    ((and (null? lst) (= 0 cnt)) true)
    ((and (null? lst) (> cnt 0)) false)
    (else (if (< cnt 0)
          false
          (cond
            ( (equal? #\( (car lst)) (is-balanced? (cdr lst) (+ cnt 1)))
            ( (equal? #\) (car lst)) (is-balanced? (cdr lst) (- cnt 1)))
            ( else (is-balanced? (cdr lst) cnt)))))))
          

;======================================06=======================================
(define (list-of-all? predicate lst)
  (if (null? lst)
      true
      (if (predicate (car lst))
          (list-of-all? predicate (cdr lst))
          false))
)
;======================================07=======================================
(define (create-mapping keys vals)
  (cond
    ( (not (and (list? keys) (list? vals))) "invalid list")
    ( (not (= (length keys) (length vals))) "the lists are not equal length")
    ( else
      (lambda (key)
        (if (false? (find-key-val keys vals key))
            "Could not find mapping"
            (find-key-val keys vals key)))))
      
)

(define (find-key-val keys vals key)
  (if (null? keys)
      false
      (if (equal? (car keys) key)
          (car vals)
          (find-key-val (cdr keys) (cdr vals) key))))