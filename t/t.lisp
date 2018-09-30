(ql:quickload :rt)
(ql:quickload :cl-strings)



(defpackage :qotdd-testing
  (:use :cl)
  (:export

    :do-all))

(in-package :qotdd-testing)



(defun do-all ()
  "Execute all tests."

  (rt:do-tests))




(load "t/package.lisp")

(load "src/misc.lisp")
(load "t/misc.lisp")

(load "src/string.lisp")
(load "t/string.lisp")

(qotdd-testing:do-all)
