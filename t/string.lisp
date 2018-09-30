;; ----------------------------------------
;; STRING.LISP
;; ----------------------------------------


;; DATA DECLARATIONS
;; ----------------------------------------

(defvar *single-line-string*
  "Hiya! <3<3<3")

(defvar *multi-line-string*
  "Oh, hi, how're you doing?
I hope you responded 'fine'.
Honestly, I can't hear you from here,
Hopefully your day is OK, though. <3")

(defvar *line-list*
  '("Oh, hi, how're you doing?"
   "I hope you responded 'fine'."
   "Honestly, I can't hear you from here,"
   "Hopefully your day is OK, though. <3"))

(defvar *single-line-list*
  '("Hiya! <3<3<3"))



;; TESTS
;; ----------------------------------------

(rt:deftest string-line-list-i
            (qotdd:string-line-list *multi-line-string*)
            ("Oh, hi, how're you doing?" "I hope you responded 'fine'."
             "Honestly, I can't hear you from here,"
             "Hopefully your day is OK, though. <3"))

(rt:deftest string-line-list-ii
            (qotdd:string-line-list *single-line-string*)
            ("Hiya! <3<3<3"))



(rt:deftest line-list-string-i
            (qotdd:line-list-string *line-list*)
            "Oh, hi, how're you doing?
I hope you responded 'fine'.
Honestly, I can't hear you from here,
Hopefully your day is OK, though. <3")

(rt:deftest line-list-string-ii
            (qotdd:line-list-string *single-line-list*)
            "Hiya! <3<3<3")



(rt:deftest string-after-prefix-i
            (qotdd:string-after-prefix "Doggo -- Pomeranian" "Doggo -- ")
            "Pomeranian")

(rt:deftest string-after-prefix-ii
            (qotdd:string-after-prefix "Doggo -- Pomeranian" "oggo -- ")
            nil)



(rt:deftest get-line-i
            (qotdd:get-line *multi-line-string* "I hope")
            "I hope you responded 'fine'.")
