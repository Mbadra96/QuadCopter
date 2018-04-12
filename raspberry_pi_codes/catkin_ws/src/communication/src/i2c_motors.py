#!/usr/bin/env python
import rospy
from decision_make.msg import *
from std_msgs.msg import *
import smbus

def callback(msg):
	data=[int(msg.motor_1),int(msg.motor_2),int(msg.motor_3),int(msg.motor_4)]
	try:
		i2c.write_i2c_block_data(address,0x0A,data)
		pass
	except Exception as e:
		rospy.logwarn(str(e)+" in downloading motors")
	

if __name__ == '__main__':
	i2c=smbus.SMBus(1)
	address=0x20
	rospy.init_node("motors_downloader")
	sub = rospy.Subscriber("decision_make/motors",rpm_msg,callback)
	rospy.spin()

