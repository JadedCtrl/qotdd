(defsystem "qotdd"
           :version "0.2"
           :author "Jaidyn Ann <jadedctrl@teknik.io>"
           :license "AGPLv3"
           :depends-on ("nih" "usocket")
           :components ((:module "src"
                                 :components
                                 ((:file "package")
                                  (:file "stream")
                                  (:file "quote")
                                  (:file "server"))))

           :description
           "Question of the Day server (RFC 865-compliant)")
