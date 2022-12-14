; 13.a)A linear list is given. Eliminate from the list all elements from N to N steps, N-given.
; b)Write  a function to test  if a  linear  list of  integer  numbers hasa "valley" aspect (a list  has a valley aspect if the items decrease to a certain point and then increase. Eg. 10 8 6 17 19 20). A list must have at least 3 elements to fullfill this condition.
; c)Build a function that returns the minimum numeric atom froma list, at any level.
; d)Write a function that deletes from a linear list of all occurrences of the maximum element.14.


; A linear list is given. Eliminate from the list all elements from N to N steps, N-given.
(defun eliminate (l n i)
    (cond
        ((null l)nil)
        ((eq i n) (cons (car l)(eliminate (cdr l) n 1)))
        (t (eliminate (cdr l) n (+ i 1)))
        ; ((eq n 0) (cons (car l)(eliminate (cdr l) n (+ i 1))))
    )
)
(defun mainEliminate (l n)
    (eliminate l n 1)
)

(print(mainEliminate '(1 2 3 4 5 6 7 8 9 10) 2))

; b)Write  a function to test  if a  linear  list of  integer  numbers hasa "valley" aspect (a list  has a valley aspect if the items decrease to a certain point and then increase. Eg. 10 8 6 17 19 20). A list must have at least 3 elements to fullfill this condition.

(defun len(l)
    (cond
        ((null l) 0)
        (t (+ 1 (len (cdr l))))
    )
)
(defun valley (l i)
    (cond
        ((< (len l) 3) nil)
        ((> (car l) (car (cdr l))) (valley (cdr l) 1))
        ((< (car l) (car (cdr l))) (valley (cdr l) 1))
        ((and (>(car l)(car(cdr l))) (<(car(cdr l))(car(cdr(cdr l))))) (valley (cdr l) 1))
        (t (valley (cdr l) 0))
    )
)
(print (valley '(10 8 6 17 19 20) 1))