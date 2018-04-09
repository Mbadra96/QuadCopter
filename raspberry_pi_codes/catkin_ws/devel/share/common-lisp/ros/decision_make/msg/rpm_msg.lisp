; Auto-generated. Do not edit!


(cl:in-package decision_make-msg)


;//! \htmlinclude rpm_msg.msg.html

(cl:defclass <rpm_msg> (roslisp-msg-protocol:ros-message)
  ((motor_1
    :reader motor_1
    :initarg :motor_1
    :type cl:float
    :initform 0.0)
   (motor_2
    :reader motor_2
    :initarg :motor_2
    :type cl:float
    :initform 0.0)
   (motor_3
    :reader motor_3
    :initarg :motor_3
    :type cl:float
    :initform 0.0)
   (motor_4
    :reader motor_4
    :initarg :motor_4
    :type cl:float
    :initform 0.0))
)

(cl:defclass rpm_msg (<rpm_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rpm_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rpm_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name decision_make-msg:<rpm_msg> is deprecated: use decision_make-msg:rpm_msg instead.")))

(cl:ensure-generic-function 'motor_1-val :lambda-list '(m))
(cl:defmethod motor_1-val ((m <rpm_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader decision_make-msg:motor_1-val is deprecated.  Use decision_make-msg:motor_1 instead.")
  (motor_1 m))

(cl:ensure-generic-function 'motor_2-val :lambda-list '(m))
(cl:defmethod motor_2-val ((m <rpm_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader decision_make-msg:motor_2-val is deprecated.  Use decision_make-msg:motor_2 instead.")
  (motor_2 m))

(cl:ensure-generic-function 'motor_3-val :lambda-list '(m))
(cl:defmethod motor_3-val ((m <rpm_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader decision_make-msg:motor_3-val is deprecated.  Use decision_make-msg:motor_3 instead.")
  (motor_3 m))

(cl:ensure-generic-function 'motor_4-val :lambda-list '(m))
(cl:defmethod motor_4-val ((m <rpm_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader decision_make-msg:motor_4-val is deprecated.  Use decision_make-msg:motor_4 instead.")
  (motor_4 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rpm_msg>) ostream)
  "Serializes a message object of type '<rpm_msg>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'motor_1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'motor_2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'motor_3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'motor_4))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rpm_msg>) istream)
  "Deserializes a message object of type '<rpm_msg>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'motor_1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'motor_2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'motor_3) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'motor_4) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rpm_msg>)))
  "Returns string type for a message object of type '<rpm_msg>"
  "decision_make/rpm_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rpm_msg)))
  "Returns string type for a message object of type 'rpm_msg"
  "decision_make/rpm_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rpm_msg>)))
  "Returns md5sum for a message object of type '<rpm_msg>"
  "af4e003e6dd1d8c2d5dfe1f94487a00d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rpm_msg)))
  "Returns md5sum for a message object of type 'rpm_msg"
  "af4e003e6dd1d8c2d5dfe1f94487a00d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rpm_msg>)))
  "Returns full string definition for message of type '<rpm_msg>"
  (cl:format cl:nil "float32 motor_1~%float32 motor_2~%float32 motor_3~%float32 motor_4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rpm_msg)))
  "Returns full string definition for message of type 'rpm_msg"
  (cl:format cl:nil "float32 motor_1~%float32 motor_2~%float32 motor_3~%float32 motor_4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rpm_msg>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rpm_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'rpm_msg
    (cl:cons ':motor_1 (motor_1 msg))
    (cl:cons ':motor_2 (motor_2 msg))
    (cl:cons ':motor_3 (motor_3 msg))
    (cl:cons ':motor_4 (motor_4 msg))
))
