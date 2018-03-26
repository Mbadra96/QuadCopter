#!/usr/bin/env python
import rospy
import smbus
from decision_make.msg import *
import struct 
from std_msgs.msg import Float32
import os,sys
class communication:
    def __init__(self):
        rospy.init_node('i2c_comm')
        self.motors_download = rospy.Subscriber('motors',rpm_msg,self.download)
        self.diagnose_upload = rospy.Publisher('current_battery',diagnose_msg,queue_size = 1)
        self.ultra = rospy.Publisher('ultrasonic',Float32,queue_size=1)
        self.bus = smbus.SMBus(1)
        self.address = 0x40
        self.data=[0,0,0,0]
        self.currents=[0,0,0,0]
        self.diagnose= diagnose_msg()
	self.counter=0
#Download method is for downloading the motors rpm to the arduino
    def download(self, msg):

        try:
	    self.bus.write_byte(self.address,int(msg.motor_1))
       	    self.bus.write_byte(self.address, int(msg.motor_2))
            self.bus.write_byte(self.address, int(msg.motor_3))
       	    self.bus.write_byte(self.address, int(msg.motor_4))
        except Exception as e:
            print 'error happend in downloading:',str(e)
        self.counter+=1
        if self.counter== 4:    
      	    try:
	   	    self.currents,self.data = self.getdata() #need to be separated############################################
           	    self.publish()
	    except Exception as e:
		    print "upload error ",str(e)
		    os.system("rosrun communication i2c_comm.py")
	    self.counter=0
## getdata method is for getting current, battery and ultrasonic data from arduino
    def getdata(self):
	    try:			
		    return self.bus.read_i2c_block_data(self.address,0),self.bus.read_i2c_block_data(self.address,0)
	    except Exception as e:
		    print 'error happend in uploading:',str(e)
#converting data to float
    def getfloat(self,data,index):
	bytes =data[4*index:(index+1)*4]
	return float(struct.unpack('f',"".join(map(chr, bytes)))[0])
# getting battery capacity
    def getbattery(self):

        	v0=self.getfloat(self.data,0) 	
	        va=self.getfloat(self.data,1)
	        vb=self.getfloat(self.data,2)


        	va=va*(5.0/1023.0)
	        vb=vb*(5.0/1023.0)
	        v0=v0*(5.0/1023.0)


	        v1 = va*((980+977)/977)-v0
	        v2 = vb*((1981+988)/988)-v0-v1
	        battery_cap = (100-(27.77777778*(12.6-v0-v1-v2)))
	        return battery_cap

#publishing
    def publish(self):
        self.diagnose.current_1 = self.currents[0]
        self.diagnose.current_2 = self.currents[1]
        self.diagnose.current_3 = self.currents[2]
        self.diagnose.current_4 = self.currents[3]
        self.diagnose.battery = self.getbattery()
        self.diagnose_upload.publish(self.diagnose)
        self.ultra.publish(self.getfloat(self.data,3))

    

if __name__ == '__main__':
    communication()
    rospy.spin()
        

