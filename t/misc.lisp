;; ----------------------------------------
;; MISC.LISP
;; ----------------------------------------

(rt:deftest value-or_i
            (qotdd:value-or 1 2)
            1)

(rt:deftest value-or_ii
            (qotdd:value-or (eq 1 2) 2)
            2)

(rt:deftest iso8601
            (qotdd:iso8601 3747276860)
            "2018-09-30")
