(in-package :qotdd)

;; QUOTE_FILE_PATH --> LIST_OF_LISTS
(defun get-quotes (path)
  "Read quotes into a list of quotes by path.
  The list'll look like this:

      ((DATE QUOTE)
       (DATE QUOTE)
       (DATE QUOTE))"

  (mapcar
    (lambda (quote)
      (list
        (get-quote-date quote)
        (remove-quote-date quote)))
    (read-line-chunked (open path) "%")))



;; QUOTE_STRING --> DATE_IN_STRING
(defun get-quote-date (quote)
  "Get the date of a set quote."

  (let ((date (get-colon-value quote "Date")))
    (if date
      date
      nil)))



;; QUOTE_STRING --> QUOTE_STRING_WITHOUT_DATE
(defun remove-quote-date (quote)
  "Remove the date from a set quote."

  (if (get-quote-date quote)
    (remove-colon-value quote "Date")
    quote))



;; PATH_TO_QOTD_FILE [UNIVERSAL_TIME] --> DATED_OR_RANDOM_QUOTE
(defun get-quote (path &optional universal-time)
  "Return a quote of the day.
  If you pass `universal-time`, then it'll try to get a quote
  specific to that day.
  If a quote doesn't exist for that day (or you don't pass
  `universal-time`), it'll return a random quote."

  (let* ((quotes (get-quotes path))
        (date (ignore-errors (iso8601 universal-time)))
        (dated-quote (ignore-errors (cadr (getf-string quotes date)))))

    (if dated-quote
      dated-quote
      (random-item quotes))))
