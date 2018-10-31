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
        (getf (nih:get-colon-values quote) :date)
        (nih:remove-colon-values quote)))
    (read-line-chunked (open path) "%")))



;; PATH_TO_QOTD_FILE [UNIVERSAL_TIME] --> DATED_OR_RANDOM_QUOTE
(defun get-quote (path &optional universal-time)
  "Return a quote of the day.
  If you pass `universal-time`, then it'll try to get a quote
  specific to that day.
  If a quote doesn't exist for that day (or you don't pass
  `universal-time`), it'll return a random quote."

  (let* ((quotes (get-quotes path))
        (date (ignore-errors (nih:iso-time universal-time)))
        (dated-quote (ignore-errors (cadr (nih:getf-string quotes date)))))

    (if dated-quote
      dated-quote
      (cadr (nih:random-item quotes)))))
