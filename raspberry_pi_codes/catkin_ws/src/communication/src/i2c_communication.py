#!/usr/bin/env python
import rospy
import smbus
from decision_make.msg import * 
from std_msgs.msg import *
import os,sys
import struct
import time
class communication:
    def __init__(self):
        rospy.init_node('i2c_communication')
        self.motors_download = rospy.Subscriber('motors',rpm_msg,self.download)
        self.diagnose_upload = rospy.Publisher('current_battery',diagnose_msg,queue_size = 1)
        self.ultra = rospy.Publisher('ultrasonic',Int32,queue_size=1)
        self.bus = smbus.SMBus(1)
        self.data=list()
	self.battery=[0,0,0]
	self.address = 0x40
	self.ultrasonic=0
        self.diagnose= diagnose_msg()
	self.counter=0
#Download method is for downloading the motors rpm to the arduino
    def download(self, msg):

        try:
	    self.motors=[int(msg.motor_1),int(msg.motor_2),int(msg.motor_3),int(msg.motor_4)]
	    print msg.motor_1
	    print self.motors
	    self.bus.write_byte(self.address,self.motors[0])
	    rospy.sleep(0.001)
	    self.bus.write_byte(self.address,self.motors[1])
	    rospy.sleep(0.001)
	    self.bus.write_byte(self.address,self.motors[2])
	    rospy.sleep(0.001)
            self.bus.write_byte(self.address,self.motors[3])
	    rospy.sleep(0.001)
        except Exception as e:
            print 'error happend in downloading:',str(e)    
#	try:
	self.getdata()
	self.publish()
#	except Exception as e:
#	    print "error in publishing data ",str(e)
## getdata method is for getting current, battery and ultrasonic data from arduino
    def getdata(self):
	#    try:			
	 self.diagnose.current_1 =int(self.bus.read_byte(self.address))
	 self.diagnose.current_2 =int(self.bus.read_byte(self.address))
	 self.diagnose.current_3 =int(self.bus.read_byte(self.address))
	 self.diagnose.current_4 =int(self.bus.read_byte(self.address))
	 self.battery[0]=int(self.bus.read_byte(self.address))
	 self.battery[1]=int(self.bus.read_byte(self.address))
	 self.battery[2]=int(self.bus.read_byte(self.address))
	 self.ultrasonic=256*int(self.bus.read_byte(self.address))+int(self.bus.read_byte(self.address)) 
	 #   except Exception as e:
	#	    print 'error happend in getting data:',str(e)
# getting battery capacity
    def getbattery(self):

        	va=self.battery[1]*(5.0/255.0)
	        vb=self.battery[2]*(5.0/255.0)
	        v0=self.battery[0]*(5.0/255.0)


	        v1 = va*((980+977)/977)-v0
	        v2 = vb*((1981+988)/988)-v0-v1
	        battery_cap = (100-(27.77777778*(12.6-v0-v1-v2)))
	        return battery_cap

#publishing
    def publish(self):
        self.diagnose.battery = self.getbattery()
        self.diagnose_upload.publish(self.diagnose)
        self.ultra.publish(int(self.ultrasonic))

    

if __name__ == '__main__':
    communication()
    rospy.spin()
        

