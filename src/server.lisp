(in-package :qotdd)

(defvar *qotd-path*)

;; [HOST] [PORT] [PATH] --> NIL
(defun server (&key
                (host "0.0.0.0")
                (port 1117)
                (path "/usr/share/games/qotdd/qotd2018"))
  "Start the QOTD server."

  (setq *qotd-path* path)
  ;; (server host port connect-function disconnect-function input-handler
  ;;         :halting halt-function)
  ;; Since we don't take input, and only connect-then-disconnect, everything's
  ;; blank but the connect-function.
  (facilservil:server host port 'main 'blank 'blank :halting 'blank))



;; SOCKET NUMBER --> NIL
(defun main (socket client)
  "Main function on a connection-- send the QOTD to them."

  (facilservil:client-write client
                  (get-quote *qotd-path* (get-universal-time)) 'T)

  (facilservil:client-slaughter client))


;; SOCKET NUMBER [STRING] --> NIL
(defun blank (socket client &optional (input-string nil)))
