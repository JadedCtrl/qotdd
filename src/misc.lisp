(in-package :qotdd)

;; EXPRESSION BACKUP --> EXPRESSION_OR_BACKUP
(defun value-or (expression backup)
  "If an expression is non-NIL, return it. Otherwise,
  return a backup."

  (if expression
    expression
    backup))



;; UNIVERSAL_TIME --> ISO8601-FORMATTED_STRING
(defun iso8601 (universal-time)
  "Return `universal-time` in ISO 8601 format. :)"

  (multiple-value-bind
    (second minute hour date month year)
    (decode-universal-time universal-time)

    (format nil "~A-~A-~A"
            year
            (min-string-length month 2 "0")
            (min-string-length date 2 "0"))))



;; LIST --> RANDOM_ITEM
(defun random-item (list)
  "Get a random item from a list."

  (let* ((length (length list))
         (n (random length)))

    (nth n list)))
