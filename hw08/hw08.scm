(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s))
)

(define (caddr s)
  (car (cdr (cdr s)))
)

(define (sign x)
  (cond
    ((< x 0) -1)
    ((= x 0) 0)
    ((> x 0) 1))
)

(define (square x) (* x x))

(define (pow b n)
  (cond 
    ((= n 0) 1)
    ((= n 1) b)
    (else 
      (if (even? n) 
        (* (pow b (/ n 2)) (pow b (/ n 2))) 
        (* b (pow b (/ (- n 1) 2)) (pow b (/ (- n 1) 2))))))
)

(define (ordered? s)
  (cond
    ((or 
      (null? s) 
      (null? cdr(s)))
      True)
    ((> 
      (car s) 
      (cadr s)) 
      False)
    (else (ordered? (cdr s))))
)


(define (nodots s)
  (cond 
    ((null? s) s)
    ((null? (cdr s)) s)
    ((pair?(car s))(cons(nodots(car s))(nodots(cdr s))))
    ((not (pair? (cdr s)))(cons(car s)(cons(cdr s)nil)))
    (else(cons(car s)(nodots(cdr s)))))
)

; Sets as sorted lists

(define (empty? s) (null? s))

(define (contains? s v)
    (cond ((empty? s) #f)
          ((> (car s) v) #f)
          ((= (car s) v) #t)
          (else (contains? (cdr s) v)) ; replace this line
          ))

; Equivalent Python code, for your reference:
;
; def empty(s):
;     return s is Link.empty
;
; def contains(s, v):
;     if empty(s):
;         return False
;     elif s.first > v:
;         return False
;     elif s.first == v:
;         return True
;     else:
;         return contains(s.rest, v)

(define (add s v)
    (cond ((empty? s) (list v))
          ((> (car s) v) (list v s))
          (else (list (car s) (add (cdr s) v))) ; replace this line
          ))

(define (intersect s t)
    (cond ((or (empty? s) (empty? t)) nil)
          ((< (car s) (car t)) (intersect (cdr s) t))
          ((> (car s) (car t)) (intersect s (cdr t)))
          (else (list (car s) (intersect (cdr s) (cdr t)))) ; replace this line
          ))

; Equivalent Python code, for your reference:
;
; def intersect(set1, set2):
;     if empty(set1) or empty(set2):
;         return Link.empty
;     else:
;         e1, e2 = set1.first, set2.first
;         if e1 == e2:
;             return Link(e1, intersect(set1.rest, set2.rest))
;         elif e1 < e2:
;             return intersect(set1.rest, set2)
;         elif e2 < e1:
;             return intersect(set1, set2.rest)

(define (union s t)
    (cond ((empty? s) t)
          ((empty? t) s)
          ((< (car s) (car t)) (list (car s) (union (cdr s) t)))
          ((> (car s) (car t)) (list (car t) (union (cdr t) s)))
          (else (list (car s) (union (cdr s) (cdr t)))) ; replace this line
          ))