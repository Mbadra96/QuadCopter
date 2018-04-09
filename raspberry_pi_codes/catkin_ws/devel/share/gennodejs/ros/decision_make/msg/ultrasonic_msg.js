// Auto-generated. Do not edit!

// (in-package decision_make.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ultrasonic_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ultrasonic = null;
    }
    else {
      if (initObj.hasOwnProperty('ultrasonic')) {
        this.ultrasonic = initObj.ultrasonic
      }
      else {
        this.ultrasonic = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ultrasonic_msg
    // Serialize message field [ultrasonic]
    bufferOffset = _serializer.float32(obj.ultrasonic, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ultrasonic_msg
    let len;
    let data = new ultrasonic_msg(null);
    // Deserialize message field [ultrasonic]
    data.ultrasonic = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'decision_make/ultrasonic_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8e437e5b52cf30316ee33a4be62d1866';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 ultrasonic
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ultrasonic_msg(null);
    if (msg.ultrasonic !== undefined) {
      resolved.ultrasonic = msg.ultrasonic;
    }
    else {
      resolved.ultrasonic = 0.0
    }

    return resolved;
    }
};

module.exports = ultrasonic_msg;
