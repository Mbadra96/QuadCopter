#!/usr/bin/env python
import rospy
from decision_make.msg import *
from std_msgs.msg import *
import smbus

def read_sensors(msg):
	try:
		data=i2c.read_i2c_block_data(address,0x81,9)
		publish(data)
		pass
	except Exception as e:
		rospy.logwarn(str(e)+" in uploading sensors")
def getbattery(va,vb,v0):

        	va=va*(5.0/255.0)
	        vb=vb*(5.0/255.0)
	        v0=v0*(5.0/255.0)


	        v1 = va*((980+977)/977)-v0
	        v2 = vb*((1981+988)/988)-v0-v1
	        battery_cap = (100-(27.77777778*(12.6-v0-v1-v2)))
	        return battery_cap

def publish(data):

	readings=diagnose_msg()
	readings.current_1=data[0]
	readings.current_2=data[1]
	readings.current_3=data[2]
	readings.current_4=data[3]
	readings.battery=getbattery(data[4],data[5],data[6])

	ultra=Float32()
	ultra.data=256*data[7]+data[8]

	diagnose_pub.publish(readings)
	ultrasonic_pub.publish(ultra)

if __name__ == '__main__':
	address=0x60
	i2c = smbus.SMBus(1)
	rospy.init_node("sensors")
	hz = rospy.Subscriber("heartbeat_hz",Empty,read_sensors)
	diagnose_pub = rospy.Publisher("communication/diagnose_data",diagnose_msg,queue_size=10)
	ultrasonic_pub = rospy.Publisher("sensors/ultrasonic",Float32,queue_size=10)
	rospy.spin()



