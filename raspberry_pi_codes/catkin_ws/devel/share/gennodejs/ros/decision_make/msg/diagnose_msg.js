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

class diagnose_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.current_1 = null;
      this.current_2 = null;
      this.current_3 = null;
      this.current_4 = null;
      this.battery = null;
    }
    else {
      if (initObj.hasOwnProperty('current_1')) {
        this.current_1 = initObj.current_1
      }
      else {
        this.current_1 = 0.0;
      }
      if (initObj.hasOwnProperty('current_2')) {
        this.current_2 = initObj.current_2
      }
      else {
        this.current_2 = 0.0;
      }
      if (initObj.hasOwnProperty('current_3')) {
        this.current_3 = initObj.current_3
      }
      else {
        this.current_3 = 0.0;
      }
      if (initObj.hasOwnProperty('current_4')) {
        this.current_4 = initObj.current_4
      }
      else {
        this.current_4 = 0.0;
      }
      if (initObj.hasOwnProperty('battery')) {
        this.battery = initObj.battery
      }
      else {
        this.battery = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type diagnose_msg
    // Serialize message field [current_1]
    bufferOffset = _serializer.float32(obj.current_1, buffer, bufferOffset);
    // Serialize message field [current_2]
    bufferOffset = _serializer.float32(obj.current_2, buffer, bufferOffset);
    // Serialize message field [current_3]
    bufferOffset = _serializer.float32(obj.current_3, buffer, bufferOffset);
    // Serialize message field [current_4]
    bufferOffset = _serializer.float32(obj.current_4, buffer, bufferOffset);
    // Serialize message field [battery]
    bufferOffset = _serializer.float32(obj.battery, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type diagnose_msg
    let len;
    let data = new diagnose_msg(null);
    // Deserialize message field [current_1]
    data.current_1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [current_2]
    data.current_2 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [current_3]
    data.current_3 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [current_4]
    data.current_4 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [battery]
    data.battery = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'decision_make/diagnose_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f4677b8ef50602202d6d4f5957669124';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 current_1
    float32 current_2
    float32 current_3
    float32 current_4
    float32 battery
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new diagnose_msg(null);
    if (msg.current_1 !== undefined) {
      resolved.current_1 = msg.current_1;
    }
    else {
      resolved.current_1 = 0.0
    }

    if (msg.current_2 !== undefined) {
      resolved.current_2 = msg.current_2;
    }
    else {
      resolved.current_2 = 0.0
    }

    if (msg.current_3 !== undefined) {
      resolved.current_3 = msg.current_3;
    }
    else {
      resolved.current_3 = 0.0
    }

    if (msg.current_4 !== undefined) {
      resolved.current_4 = msg.current_4;
    }
    else {
      resolved.current_4 = 0.0
    }

    if (msg.battery !== undefined) {
      resolved.battery = msg.battery;
    }
    else {
      resolved.battery = 0.0
    }

    return resolved;
    }
};

module.exports = diagnose_msg;
