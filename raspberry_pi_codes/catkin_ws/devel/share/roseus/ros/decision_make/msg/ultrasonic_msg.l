;; Auto-generated. Do not edit!


(when (boundp 'decision_make::ultrasonic_msg)
  (if (not (find-package "DECISION_MAKE"))
    (make-package "DECISION_MAKE"))
  (shadow 'ultrasonic_msg (find-package "DECISION_MAKE")))
(unless (find-package "DECISION_MAKE::ULTRASONIC_MSG")
  (make-package "DECISION_MAKE::ULTRASONIC_MSG"))

(in-package "ROS")
;;//! \htmlinclude ultrasonic_msg.msg.html


(defclass decision_make::ultrasonic_msg
  :super ros::object
  :slots (_ultrasonic ))

(defmethod decision_make::ultrasonic_msg
  (:init
   (&key
    ((:ultrasonic __ultrasonic) 0.0)
    )
   (send-super :init)
   (setq _ultrasonic (float __ultrasonic))
   self)
  (:ultrasonic
   (&optional __ultrasonic)
   (if __ultrasonic (setq _ultrasonic __ultrasonic)) _ultrasonic)
  (:serialization-length
   ()
   (+
    ;; float32 _ultrasonic
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _ultrasonic
       (sys::poke _ultrasonic (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _ultrasonic
     (setq _ultrasonic (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get decision_make::ultrasonic_msg :md5sum-) "8e437e5b52cf30316ee33a4be62d1866")
(setf (get decision_make::ultrasonic_msg :datatype-) "decision_make/ultrasonic_msg")
(setf (get decision_make::ultrasonic_msg :definition-)
      "float32 ultrasonic

")



(provide :decision_make/ultrasonic_msg "8e437e5b52cf30316ee33a4be62d1866")


