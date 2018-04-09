; Auto-generated. Do not edit!


(cl:in-package decision_make-msg)


;//! \htmlinclude ultrasonic_msg.msg.html

(cl:defclass <ultrasonic_msg> (roslisp-msg-protocol:ros-message)
  ((ultrasonic
    :reader ultrasonic
    :initarg :ultrasonic
    :type cl:float
    :initform 0.0))
)

(cl:defclass ultrasonic_msg (<ultrasonic_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ultrasonic_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ultrasonic_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name decision_make-msg:<ultrasonic_msg> is deprecated: use decision_make-msg:ultrasonic_msg instead.")))

(cl:ensure-generic-function 'ultrasonic-val :lambda-list '(m))
(cl:defmethod ultrasonic-val ((m <ultrasonic_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader decision_make-msg:ultrasonic-val is deprecated.  Use decision_make-msg:ultrasonic instead.")
  (ultrasonic m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ultrasonic_msg>) ostream)
  "Serializes a message object of type '<ultrasonic_msg>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ultrasonic))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ultrasonic_msg>) istream)
  "Deserializes a message object of type '<ultrasonic_msg>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ultrasonic) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ultrasonic_msg>)))
  "Returns string type for a message object of type '<ultrasonic_msg>"
  "decision_make/ultrasonic_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ultrasonic_msg)))
  "Returns string type for a message object of type 'ultrasonic_msg"
  "decision_make/ultrasonic_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ultrasonic_msg>)))
  "Returns md5sum for a message object of type '<ultrasonic_msg>"
  "8e437e5b52cf30316ee33a4be62d1866")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ultrasonic_msg)))
  "Returns md5sum for a message object of type 'ultrasonic_msg"
  "8e437e5b52cf30316ee33a4be62d1866")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ultrasonic_msg>)))
  "Returns full string definition for message of type '<ultrasonic_msg>"
  (cl:format cl:nil "float32 ultrasonic~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ultrasonic_msg)))
  "Returns full string definition for message of type 'ultrasonic_msg"
  (cl:format cl:nil "float32 ultrasonic~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ultrasonic_msg>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ultrasonic_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'ultrasonic_msg
    (cl:cons ':ultrasonic (ultrasonic msg))
))
