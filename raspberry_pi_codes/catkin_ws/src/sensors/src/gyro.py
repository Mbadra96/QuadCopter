#!/usr/bin/python

from time import sleep
#import smbus to access i2c port
import smbus
import string
from geometry_msgs.msg import Vector3
from std_msgs.msg import Empty
import rospy

#converts 16 bit two's compliment reading to signed int
def getSignedNumber(number):
    if number & (1 << 15):
        return number | ~65535
    else:
        return number & 65535


def loop(msg):
    i2c_bus.write_byte(i2c_address,0x28)
    X_L = i2c_bus.read_byte(i2c_address)
    i2c_bus.write_byte(i2c_address,0x29)
    X_H = i2c_bus.read_byte(i2c_address)
    X = X_H << 8 | X_L

    i2c_bus.write_byte(i2c_address,0x2A)
    Y_L = i2c_bus.read_byte(i2c_address)
    i2c_bus.write_byte(i2c_address,0x2B)
    Y_H = i2c_bus.read_byte(i2c_address)
    Y = Y_H << 8 | Y_L

    i2c_bus.write_byte(i2c_address,0x2C)
    Z_L = i2c_bus.read_byte(i2c_address)
    i2c_bus.write_byte(i2c_address,0x2D)
    Z_H = i2c_bus.read_byte(i2c_address)
    Z = Z_H << 8 | Z_L

    X = getSignedNumber(X)
    Y = getSignedNumber(Y)
    Z = getSignedNumber(Z)
    msg.x=X
    msg.y=Y
    msg.z=Z 
    pub.publish(msg)

#open /dev/i2c-1
i2c_bus=smbus.SMBus(1)
#i2c slave address of the L3G4200D
i2c_address=0x69

#initialise the L3G4200D

#normal mode and all axes on to control reg1
i2c_bus.write_byte_data(i2c_address,0x20,0x0F)
#full 2000dps to control reg4
i2c_bus.write_byte_data(i2c_address,0x23,0x20)
rospy.init_node('gyroscope')
msg=Vector3()
pub=rospy.Publisher('gyro',Vector3,queue_size=1)
hz = rospy.Subscriber("heartbeat_hz",Empty,loop)

