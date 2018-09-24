(in-package :qotdd)

;; MULTI-LINE_STRING --> LIST_OF_LINES
(defun string-line-list (string)
  "Return a list of lines from a multi-line string."

  (cl-strings:split string (format nil "~%")))



;; LIST_OF_STRINGS --> MULTI-LINE_STRING
(defun line-list-string (line-list)
  "Turn a list of lines (string) into a multi-line string."

  (reduce
    (lambda (x y)
      (format nil "~A~%~A" x y))
    line-list))



;; SINGLE-LINE_STRING PREFIX_SUBSTRING --> POST-PREFIX_SUBSTRING
(defun string-after-prefix (string prefix)
  "Return substring after a `prefix` substring at the start of a string."

  (cl-strings:clean
    (cadr (cl-strings:split string prefix))))



;; MULTI-LINE_STRING QUERY --> LINE_CONTAINING_QUERY
(defun get-line (string query)
  "Return a single line that query starts from a multi-line string."

  (let ((line-number (position-line string query)))

    (if line-number
      (nth line-number (string-line-list string))
      nil)))



;; MULTI-LINE_STRING QUERY --> LINE_NUMBER
(defun position-line (string query)
  "Return the line number that the string `query` starts off--
  from a multi-line string."

  (position 'T
            (mapcar
              (lambda (line)
                (cl-strings:starts-with line query))
              (string-line-list string))))



;; NUMBER MULTI-LINE_STRING --> SINGLE-LINE_STRING
(defun nth-string (n string)
  "Return line of number `n` from a multi-line string."

  (nth n (string-line-list string)))



;; STRING COLON_VARIABLE_NAME --> COLON_VALUE
(defun get-colon-value (string variable)
  "Return a the value of a `colon variable`; I.E.,
  a line of a string starting with `:` followed by a variable
  name, a space, then the value of said `colon variable`.

  Here's an example:
      (setq *example-string*
      \"Blah blah blah
      :Date 1999
      Blah blah blah\")

  If you ran
      (get-colon-value *example-string* \"Date\")

  you would get
      \"1999\" in return.

  Mainly useful for multi-line strings, but your use-case might
  involve a `colon variable` in a single-lined string."

  (let ((variable-string (format nil ":~A " variable)))

    (values
      (ignore-errors
        (string-after-prefix
          (get-line string variable-string)
          variable-string)))))



;; STRING COLON_VARIABLE_NAME --> STRING_WITHOUT_COLON_VARIABLE
(defun remove-colon-value (string variable)
  "Remove the colon-variable declaration from a string."

  (let ((variable-string (format nil ":~A " variable)))

    (line-list-string
      (remove
        (get-line string variable-string)
        (string-line-list string)
        :test 'equal))))



;; STRING DESIRED_LENGTH [PREFIX] [SUFFIX] --> STRING_OF_DESIRED_LENGTH
(defun min-string-length (string target-length
                                &optional (prefix-substitute "0")
                                           (suffix-substitute ""))
  "If a string *must* be a certain length (formatting reasons), use
  this function.

  Returns a string of `length`, using the `prefix-substitutor` or
  `suffix-substitutor` to beef up the character-count if it's too short.

  If both `prefix` and `suffix` are defined, `prefix` is used.

  Example:
      (min-string-length \"9\" 3 \"0\")

      \"009\""

  (let* ((string (format nil "~A" string))
         (cur-length (length string)))
      
    (if (eq cur-length target-length)
      string

      (min-string-length
        (pad-string string prefix-substitute suffix-substitute)
        target-length
        prefix-substitute
        suffix-substitute))))




;; STRING PREFIX SUFFIX --> STRING_ONE_OR_TWO_CHARS_LARGER
(defun pad-string (string prefix-substitute suffix-substitute)
  "Increase the character-count of a string by 1; either by
  adding a prefix-substitutor or a suffix-substitutor.

  Set the substitutor you don't want to use to \"\".
  If you set both to a value, then the count will increase by 2."

  (format nil "~A~A~A" prefix-substitute string suffix-substitute))



;; LIST_OF_SUBLISTS STRING --> SUBLIST_WITH_STRING_AS_CAR
(defun getf-string (list string)
  "Get an item from a list by an identifying string in `car`.
  I.E., if the string is 'apple', the first sublist like this:
  ('apple' 1 2 3)
  will be returned."

  (car (getf-strings list string)))



;; LIST_OF_SUBLISTS STRING --> LIST_OF_SUBLISTS_WITH_STRING_AS_CAR
(defun getf-strings (list string &optional (stack '()))
  "Get items from list by an identifying string in `car`.
  I.E., if the string is 'apple', any sublists like this:
  ('apple' 1 2 3)
  will be returned."

  ;; just recurse through the list, adding each new matching
  ;; item to the `stack`

  (if (and (< 0 (length list)) (listp list))
    (if (ignore-errors
          ;; the item might not be a list; for our purposes, let's ignore that.
          (equal
            (car (car list))    ;; '( ( here ) )
            string))
      (getf-strings (cdr list) string (concatenate 'list stack (list (car list))))
      (getf-strings (cdr list) string stack))
    stack))
