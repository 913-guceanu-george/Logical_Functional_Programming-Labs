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










; b) Write a function to test if a linear list of integer numbers has a "valley" aspect (a list has a valley
; aspect if the items decrease to a certain point and then increase. Eg. 10 8 6 17 19 20). A list must
; have at least 3 elements to fulfill this condition.

(defun _valley (l decreasing)
	(cond
		((= (list-length l) 1) (if decreasing nil T))
		((and (> (car l) (cadr l)) (not decreasing)) nil)
		((and (< (car l) (cadr l)) decreasing) (_valley (cdr l) nil))
		(T (_valley (cdr l) decreasing))
	)
)

(defun mainValley (l)
	(if (< (list-length l) 3)
		nil
		(_valley l T)
	)
)

(print (mainValley '(5 4 3 4)))
; => true









; c) Build a function that returns the minimum numeric atom from a list, at any level.

(defun list-min (l)
	(cond
		((= (list-length l) 1) (car l))
		(T (min (car l) (list-min (cdr l))))
	)
)

(print (list-min '(1 2 3 1)))
; => 1

(defun remove-occurences (l e)
	(cond
		((null l) nil)
		((= (car l) e) (remove-occurences (cdr l) e))
		(T (cons (car l) (remove-occurences (cdr l) e)))
	)
)

(print (remove-occurences '(1 2 1 3 4 1 2) 1))
; => '(2 3 4 2)


(defun remove-min-element (l)
	(remove-occurences l (list-min l))
)

(print (remove-min-element '(1 2 1 1 4 5)))
; => '(2 4 5)











; d) Write a function that deletes from a linear list of all occurrences of the minimum element.

(defun min_nb (a b)
    (if (< a b) a b)
)


(defun min_num (l)
    (cond
        ((null l) 999999)
        ((and (null (cdr l)) (numberp (car l))) (car l))
        ((numberp (car l)) (min_nb (car l) (min_num (cdr l))))
        ((listp (car l)) (min (min_num (car l)) (min_num (cdr l))))
        (t (min_num (cdr l)))
     )
)

(print (min_num '(1 2 (3 (a) (1 3)) 4 5)))
; => 1