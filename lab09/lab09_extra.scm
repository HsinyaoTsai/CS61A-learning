;; Extra Scheme Questions ;;

(define (filter f lst)
  (if (eq? nil lst) 
  	  nil 
  	  (if (f (car lst)) 
  	  	 (cons (car lst) (filter f (cdr lst)))
  	  	 (filter f (cdr lst))))
)
; Q5
(define lst
  ;CAN NOT LOAD THE ILLUSTRATION IMAGE ON CS61A WEBSITE
)

; Q6
(define (composed f g)
  (lambda (x) (f (g x)))
)

; Q7
(define (remove item lst)
  (define test (lambda (a) (not(eq? a item))))
  (filter test lst)
)


;;; Tests
(remove 3 nil)
; expect ()
(remove 3 '(1 3 5))
; expect (1 5)
(remove 5 '(5 3 5 5 1 4 5 4))
; expect (3 1 4 4)

; Q8
(define (max a b) (if (> a b) a b))
(define (min a b) (if (> a b) b a))
(define (gcd a b)
  'YOUR-CODE-HERE
)

;;; Tests
(gcd 24 60)
; expect 12
(gcd 1071 462)
; expect 21

; Q9
(define (no-repeats s)
  'YOUR-CODE-HERE
)

; Q10
(define (substitute s old new)
  'YOUR-CODE-HERE
)

; Q11
(define (sub-all s olds news)
  'YOUR-CODE-HERE
)