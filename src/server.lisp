(in-package :qotdd)

;; [HOST] [PORT]
(defun server (&optional
                (host "127.0.0.1")
                (port 1117)
                (qotd-path "/usr/share/games/qotdd/qotd2018"))
  "Start the QOTD server."

  (let ((socket (usocket:socket-listen host port)))

    (unwind-protect
      (loop
        :do
        (let ((connection (connection-get socket)))
          (main connection qotd-path)
          (connection-kill connection)))

      (progn
        (format t "Dying...")
        (usocket:socket-close socket)))))



;; SOCKET --> CONNECTION_ON_SOCKET
(defun connection-get (socket)
  "Return a Connection from a Socket; until Connection recieved,
  wait patiently."

  (usocket:socket-accept socket :element-type 'character))



;; CONNECTION
(defun connection-kill (connection)
  "Close a connection."

  (usocket:socket-close connection))



(defun main (connection qotd-path)
  "Main function on a connection-- send the QOTD to them."

  (connection-msg connection
                  (get-quote qotd-path (get-universal-time))))


;; CONNECTION
(defun connection-msg (connection message)
  "Send a message to a connection."

  (format (usocket:socket-stream connection) "~A" message))
