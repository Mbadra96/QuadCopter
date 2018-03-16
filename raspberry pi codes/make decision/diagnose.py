#!/usr/bin/env python 
import rospy 
import smbus
from make_decision.msg import diagnose_msg


def readNumber():
	return bus.read_byte(address)


bus=smbus.SMBus(1)
address=0x04

rospy.init_node('diagnose')
pub = rospy.Publisher('current_battery',diagnose_msg,queue_size=1)

rate=rospy.Rate(10)
while not rospy.is_shutdown():
	msg=diagnose_msg()
	msg.current_1=readNumber()
	msg.current_2=readNumber()
	msg.current_3=readNumber()
	msg.current_4=readNumber()
	msg.battery=readNumber()
	pub.publish(msg)		
	rate.sleep()
