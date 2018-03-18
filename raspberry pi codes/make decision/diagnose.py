#!/usr/bin/env python 
import rospy 
import smbus
from decision_make.msg import diagnose_msg
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



rate=rospy.Rate(1)

def getbattery(va,vb,v0):
	v1 = va*((1000+1000)/1000)-v0
	v2= vb*((2000+1000)/1000)-v0-v1
	battery_cap = (100-(27.77777778*(12.6-v0-v1-v2)))
	return battery_cap	


while not rospy.is_shutdown():
	#msg=diagnose_msg()
	msg= diagnose_msg()
	data =getdata()
	msg.current_1=getfloat(data,0)
	msg.current_2=getfloat(data,1)
	msg.current_3=getfloat(data,2)
	msg.current_4=getfloat(data,3)
	v0=getfloat(data,4) 	
	va=getfloat(data,5)
	vb=getfloat(data,6)
	msg.battery=getbattery(va,vb,v0)
	ultrasonic = getfloat(data,7)
	pub.publish(msg)
	ultra.publish(ultrasonic)		
	rate.sleep()
