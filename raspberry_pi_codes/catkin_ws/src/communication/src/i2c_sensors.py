#!/usr/bin/env python
import rospy
from decision_make.msg import *
from std_msgs.msg import *
import smbus

def read_sensors(msg):
	try:
		data1=i2c.read_i2c_block_data(address_sensors_1,0x81,4)
		pass
	except Exception as e:
		rospy.logwarn(str(e)+" in uploading sensors:1")

	try:
		data2=i2c.read_i2c_block_data(address_sensors_2,0x81,5)
		publish(data1,data2)
		pass
	except Exception as e:
		rospy.logwarn(str(e)+" in uploading sensors:2")

def getbattery(v0,va,vb):

        	va=va*(5.0/255.0)
	        vb=vb*(5.0/255.0)
	        v0=v0*(5.0/255.0)


	        v1 = ((va*2)-v0)
	        v2 = ((vb*3)-v0-v1)
	        battery_cap = (100-(27.77777778*(12.6-v0-v1-v2)))
	        
	        return battery_cap

def publish(data1,data2):

	readings=diagnose_msg()
	readings.current_1=data1[0]
	readings.current_2=data1[1]
	readings.current_3=data1[2]
	readings.current_4=data1[3]
	readings.battery=getbattery(data2[0],data2[1],data2[2])

	ultra=Float32()
	ultra.data=256*data2[3]+data2[4]

	diagnose_pub.publish(readings)
	ultrasonic_pub.publish(ultra)

if __name__ == '__main__':
	address_sensors_1=0x60
	address_sensors_2=0x80
	i2c = smbus.SMBus(1)
	rospy.init_node("sensors")
	hz = rospy.Subscriber("heartbeat_hz",Empty,read_sensors)
	diagnose_pub = rospy.Publisher("communication/diagnose_data",diagnose_msg,queue_size=10)
	ultrasonic_pub = rospy.Publisher("sensors/ultrasonic",Float32,queue_size=10)
	rospy.spin()