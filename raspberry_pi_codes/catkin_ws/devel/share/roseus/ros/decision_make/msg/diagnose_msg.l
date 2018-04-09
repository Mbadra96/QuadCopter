;; Auto-generated. Do not edit!


(when (boundp 'decision_make::diagnose_msg)
  (if (not (find-package "DECISION_MAKE"))
    (make-package "DECISION_MAKE"))
  (shadow 'diagnose_msg (find-package "DECISION_MAKE")))
(unless (find-package "DECISION_MAKE::DIAGNOSE_MSG")
  (make-package "DECISION_MAKE::DIAGNOSE_MSG"))

(in-package "ROS")
;;//! \htmlinclude diagnose_msg.msg.html


(defclass decision_make::diagnose_msg
  :super ros::object
  :slots (_current_1 _current_2 _current_3 _current_4 _battery ))

(defmethod decision_make::diagnose_msg
  (:init
   (&key
    ((:current_1 __current_1) 0.0)
    ((:current_2 __current_2) 0.0)
    ((:current_3 __current_3) 0.0)
    ((:current_4 __current_4) 0.0)
    ((:battery __battery) 0.0)
    )
   (send-super :init)
   (setq _current_1 (float __current_1))
   (setq _current_2 (float __current_2))
   (setq _current_3 (float __current_3))
   (setq _current_4 (float __current_4))
   (setq _battery (float __battery))
   self)
  (:current_1
   (&optional __current_1)
   (if __current_1 (setq _current_1 __current_1)) _current_1)
  (:current_2
   (&optional __current_2)
   (if __current_2 (setq _current_2 __current_2)) _current_2)
  (:current_3
   (&optional __current_3)
   (if __current_3 (setq _current_3 __current_3)) _current_3)
  (:current_4
   (&optional __current_4)
   (if __current_4 (setq _current_4 __current_4)) _current_4)
  (:battery
   (&optional __battery)
   (if __battery (setq _battery __battery)) _battery)
  (:serialization-length
   ()
   (+
    ;; float32 _current_1
    4
    ;; float32 _current_2
    4
    ;; float32 _current_3
    4
    ;; float32 _current_4
    4
    ;; float32 _battery
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _current_1
       (sys::poke _current_1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _current_2
       (sys::poke _current_2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _current_3
       (sys::poke _current_3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _current_4
       (sys::poke _current_4 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _battery
       (sys::poke _battery (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _current_1
     (setq _current_1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _current_2
     (setq _current_2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _current_3
     (setq _current_3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _current_4
     (setq _current_4 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _battery
     (setq _battery (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get decision_make::diagnose_msg :md5sum-) "f4677b8ef50602202d6d4f5957669124")
(setf (get decision_make::diagnose_msg :datatype-) "decision_make/diagnose_msg")
(setf (get decision_make::diagnose_msg :definition-)
      "float32 current_1
float32 current_2
float32 current_3
float32 current_4
float32 battery

")



(provide :decision_make/diagnose_msg "f4677b8ef50602202d6d4f5957669124")


