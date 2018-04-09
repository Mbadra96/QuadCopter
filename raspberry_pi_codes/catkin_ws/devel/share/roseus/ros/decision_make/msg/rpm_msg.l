;; Auto-generated. Do not edit!


(when (boundp 'decision_make::rpm_msg)
  (if (not (find-package "DECISION_MAKE"))
    (make-package "DECISION_MAKE"))
  (shadow 'rpm_msg (find-package "DECISION_MAKE")))
(unless (find-package "DECISION_MAKE::RPM_MSG")
  (make-package "DECISION_MAKE::RPM_MSG"))

(in-package "ROS")
;;//! \htmlinclude rpm_msg.msg.html


(defclass decision_make::rpm_msg
  :super ros::object
  :slots (_motor_1 _motor_2 _motor_3 _motor_4 ))

(defmethod decision_make::rpm_msg
  (:init
   (&key
    ((:motor_1 __motor_1) 0.0)
    ((:motor_2 __motor_2) 0.0)
    ((:motor_3 __motor_3) 0.0)
    ((:motor_4 __motor_4) 0.0)
    )
   (send-super :init)
   (setq _motor_1 (float __motor_1))
   (setq _motor_2 (float __motor_2))
   (setq _motor_3 (float __motor_3))
   (setq _motor_4 (float __motor_4))
   self)
  (:motor_1
   (&optional __motor_1)
   (if __motor_1 (setq _motor_1 __motor_1)) _motor_1)
  (:motor_2
   (&optional __motor_2)
   (if __motor_2 (setq _motor_2 __motor_2)) _motor_2)
  (:motor_3
   (&optional __motor_3)
   (if __motor_3 (setq _motor_3 __motor_3)) _motor_3)
  (:motor_4
   (&optional __motor_4)
   (if __motor_4 (setq _motor_4 __motor_4)) _motor_4)
  (:serialization-length
   ()
   (+
    ;; float32 _motor_1
    4
    ;; float32 _motor_2
    4
    ;; float32 _motor_3
    4
    ;; float32 _motor_4
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _motor_1
       (sys::poke _motor_1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _motor_2
       (sys::poke _motor_2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _motor_3
       (sys::poke _motor_3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _motor_4
       (sys::poke _motor_4 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _motor_1
     (setq _motor_1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _motor_2
     (setq _motor_2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _motor_3
     (setq _motor_3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _motor_4
     (setq _motor_4 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get decision_make::rpm_msg :md5sum-) "af4e003e6dd1d8c2d5dfe1f94487a00d")
(setf (get decision_make::rpm_msg :datatype-) "decision_make/rpm_msg")
(setf (get decision_make::rpm_msg :definition-)
      "float32 motor_1
float32 motor_2
float32 motor_3
float32 motor_4

")



(provide :decision_make/rpm_msg "af4e003e6dd1d8c2d5dfe1f94487a00d")


