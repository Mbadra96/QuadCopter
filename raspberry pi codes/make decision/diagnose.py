#!/usr/bin/env python 
import rospy 
import smbus
from make_decision.msg import diagnose_msg
import struct
from std_msgs.msg import Float32

bus=smbus.SMBus(1)
address=0x40

rospy.init_node('diagnose')
pub = rospy.Publisher('current_battery',diagnose_msg,queue_size=1)
ultra = rospy.Publisher('ultrasonic',Float32,queue_size=1)



def getdata():
	return bus.read_i2c_block_data(address,0)

def getfloat(data,index):
	bytes =data[4*index:(index+1)*4]
	return struct.unpack('f',"".join(map(chr, bytes)))[0]



rate=rospy.Rate(10)
while not rospy.is_shutdown():
	msg=diagnose_msg()
	data =getdata()
	msg.current_1=getfloat(data,0)
	msg.current_2=getfloat(data,1)
	msg.current_3=getfloat(data,2)
	msg.current_4=getfloat(data,3)
	msg.battery=getfloat(data,4)
	ultrasonic = getfloat(data,5)
	pub.publish(msg)
	ultra.publish(ultrasonic)		
	rate.sleep()
