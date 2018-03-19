#!/usr/bin/env python 
import rospy 
import smbus
import ctypes
from decision_make.msg import diagnose_msg
import struct
from std_msgs.msg import Float32
import sys,os
bus=smbus.SMBus(1)
address=0x40

rospy.init_node('diagnose')
pub = rospy.Publisher('current_battery',diagnose_msg,queue_size=1)
ultra = rospy.Publisher('ultrasonic',Float32,queue_size=1)



def getdata():
	try:			
		return bus.read_i2c_block_data(address,0), bus.read_i2c_block_data(address,0)
	except:
		print "error happened in i2c bus, reconnecting ... "
		
		os.system('rosrun decision_make diagnose.py')
def getfloat(data,index):
	bytes =data[4*index:(index+1)*4]
	return float(struct.unpack('f',"".join(map(chr, bytes)))[0])


rate=rospy.Rate(0.5)

def getbattery(va,vb,v0):
	va=va*(5.0/1023.0)
	vb=vb*(5.0/1023.0)
	v0=v0*(5.0/1023.0)

	v1 = va*((980+977)/977)-v0
	v2 = vb*((1981+988)/988)-v0-v1
	battery_cap = (100-(27.77777778*(12.6-v0-v1-v2)))
	return battery_cap	


while not rospy.is_shutdown():
	msg= diagnose_msg()
	currents,data = getdata()
	msg.current_1=currents[0]
	msg.current_2=currents[1] 
	msg.current_3=currents[2] 
	msg.current_4=currents[3] 
	v0=getfloat(data,0) 	
	va=getfloat(data,1)
	vb=getfloat(data,2)
	msg.battery=getbattery(va,vb,v0)
	ultrasonic = getfloat(data,3)
	try:
		pub.publish(msg)
		ultra.publish(ultrasonic)		
	except Exception as e:
		print str(e)
	rate.sleep()
