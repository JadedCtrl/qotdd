(defsystem "qotdd"
           :version "0.1"
           :author "Jaidyn Ann <jadedctrl@teknik.io>"
           :license "AGPLv3"
           :depends-on ("cl-strings" "usocket")
           :components ((:module "src"
                                 :components
                                 ((:file "package")
                                  (:file "misc")
                                  (:file "string")
                                  (:file "stream")
                                  (:file "quote")
                                  (:file "server"))))

           :description
           "Question of the Day server (RFC 865-compliant)")
