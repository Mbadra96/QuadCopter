; Auto-generated. Do not edit!


(cl:in-package decision_make-msg)


;//! \htmlinclude diagnose_msg.msg.html

(cl:defclass <diagnose_msg> (roslisp-msg-protocol:ros-message)
  ((current_1
    :reader current_1
    :initarg :current_1
    :type cl:float
    :initform 0.0)
   (current_2
    :reader current_2
    :initarg :current_2
    :type cl:float
    :initform 0.0)
   (current_3
    :reader current_3
    :initarg :current_3
    :type cl:float
    :initform 0.0)
   (current_4
    :reader current_4
    :initarg :current_4
    :type cl:float
    :initform 0.0)
   (battery
    :reader battery
    :initarg :battery
    :type cl:float
    :initform 0.0))
)

(cl:defclass diagnose_msg (<diagnose_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <diagnose_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'diagnose_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name decision_make-msg:<diagnose_msg> is deprecated: use decision_make-msg:diagnose_msg instead.")))

(cl:ensure-generic-function 'current_1-val :lambda-list '(m))
(cl:defmethod current_1-val ((m <diagnose_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader decision_make-msg:current_1-val is deprecated.  Use decision_make-msg:current_1 instead.")
  (current_1 m))

(cl:ensure-generic-function 'current_2-val :lambda-list '(m))
(cl:defmethod current_2-val ((m <diagnose_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader decision_make-msg:current_2-val is deprecated.  Use decision_make-msg:current_2 instead.")
  (current_2 m))

(cl:ensure-generic-function 'current_3-val :lambda-list '(m))
(cl:defmethod current_3-val ((m <diagnose_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader decision_make-msg:current_3-val is deprecated.  Use decision_make-msg:current_3 instead.")
  (current_3 m))

(cl:ensure-generic-function 'current_4-val :lambda-list '(m))
(cl:defmethod current_4-val ((m <diagnose_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader decision_make-msg:current_4-val is deprecated.  Use decision_make-msg:current_4 instead.")
  (current_4 m))

(cl:ensure-generic-function 'battery-val :lambda-list '(m))
(cl:defmethod battery-val ((m <diagnose_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader decision_make-msg:battery-val is deprecated.  Use decision_make-msg:battery instead.")
  (battery m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <diagnose_msg>) ostream)
  "Serializes a message object of type '<diagnose_msg>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'current_1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'current_2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'current_3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'current_4))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'battery))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <diagnose_msg>) istream)
  "Deserializes a message object of type '<diagnose_msg>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'current_1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'current_2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'current_3) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'current_4) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'battery) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<diagnose_msg>)))
  "Returns string type for a message object of type '<diagnose_msg>"
  "decision_make/diagnose_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'diagnose_msg)))
  "Returns string type for a message object of type 'diagnose_msg"
  "decision_make/diagnose_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<diagnose_msg>)))
  "Returns md5sum for a message object of type '<diagnose_msg>"
  "f4677b8ef50602202d6d4f5957669124")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'diagnose_msg)))
  "Returns md5sum for a message object of type 'diagnose_msg"
  "f4677b8ef50602202d6d4f5957669124")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<diagnose_msg>)))
  "Returns full string definition for message of type '<diagnose_msg>"
  (cl:format cl:nil "float32 current_1~%float32 current_2~%float32 current_3~%float32 current_4~%float32 battery~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'diagnose_msg)))
  "Returns full string definition for message of type 'diagnose_msg"
  (cl:format cl:nil "float32 current_1~%float32 current_2~%float32 current_3~%float32 current_4~%float32 battery~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <diagnose_msg>))
  (cl:+ 0
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <diagnose_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'diagnose_msg
    (cl:cons ':current_1 (current_1 msg))
    (cl:cons ':current_2 (current_2 msg))
    (cl:cons ':current_3 (current_3 msg))
    (cl:cons ':current_4 (current_4 msg))
    (cl:cons ':battery (battery msg))
))
