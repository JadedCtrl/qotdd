(in-package :qotdd)

;; STREAM [FOOTER-STRING] --> DATA_FROM_STREAM_UNTIL_FOOTER
(defun read-line-until (stream seperator-line)
  "Read lines from a stream until a certain line is reached."

  (let ((cur-line
          (ignore-errors (read-line stream))))

    (cond
      ((and cur-line (not (equal cur-line (string seperator-line))))
       (format nil "~A~%~A"
               cur-line 
               (value-or
                 (read-line-until stream seperator-line)
                 "")))

      ('T nil))))



;; STREAM SEPERATOR --> LIST_OF_STRINGS
(defun read-line-chunked (stream seperator-line)
  "read-line over a stream until EOF into a single string--
  but, whenver the `seperator-line` is reached, start a
  brand new string.
  Returns a list of (multi-lined) strings."

  (let ((chunk
          (read-line-until stream seperator-line)))

    (if chunk
      (concatenate 'list
                   (list chunk)
                   (read-line-chunked
                     stream
                     seperator-line)))))
