(defpackage :qotdd
  (:use :cl)
  (:export 

    ;; PUBLIC FUNCTIONS
    ;;============================== 

    ;; server.lisp
    ;;-------------------- 
    :server


    ;; PRIVATE FUNCTIONS
    ;;============================== 

    ;; misc.lisp
    ;;-------------------- 
    :value-or
    :iso8601
    :random-item

    ;; quotes.lisp
    ;;-------------------- 
    :get-quotes
    :get-quote
    :get-quote-date
    :remove-quote-date
    
    ;; server.lisp
    ;;-------------------- 
    :connection-get
    :connection-kill
    :main
    :connection-msg

    ;; stream.lisp
    ;;-------------------- 
    :read-line-until
    :read-line-chunked

    ;; string.lisp
    ;;-------------------- 
    :string-line-list
    :line-list-string
    :string-after-prefix
    :get-line
    :position-line
    :nth-string
    :get-colon-value
    :remove-colon-value
    :min-string-length
    :pad-string
    :getf-string
    :getf-strings))

(in-package :qotdd)
