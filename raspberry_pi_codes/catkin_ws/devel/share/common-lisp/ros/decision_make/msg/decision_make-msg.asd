
(cl:in-package :asdf)

(defsystem "decision_make-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "diagnose_msg" :depends-on ("_package_diagnose_msg"))
    (:file "_package_diagnose_msg" :depends-on ("_package"))
    (:file "rpm_msg" :depends-on ("_package_rpm_msg"))
    (:file "_package_rpm_msg" :depends-on ("_package"))
    (:file "ultrasonic_msg" :depends-on ("_package_ultrasonic_msg"))
    (:file "_package_ultrasonic_msg" :depends-on ("_package"))
  ))