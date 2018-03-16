#!/usr/bin/env python

import rospy
from mpu6050 import mpu6050
from sensor_msgs.msg import Imu
from time import time 


class sensor:
	#class variables
	imu=None	 
	mpu = None
	pub = None
	r=None
	def __init__(self,address=0x68,rate=10):  # the default publishing frequency is 10 Hz
		self.mpu = mpu6050(0x68)
		rospy.init_node('mpu6050')
		self.pub = rospy.Publisher('imu/data_raw',Imu,queue_size=1)
		self.r=rospy.Rate(rate)
		self.imu=Imu()
		self.main()
		
		
	def main(self):
		while not rospy.is_shutdown():
			self.set_variables()
			self.publish_variables()
			self.r.sleep()
	def set_variables(self):
		#setting IMU message
		self.imu.header.stamp = rospy.Time.now()
		self.imu.header.frame_id ="quadcopter center"
		self.imu.header.seq = 0
		#covariance matrix
		self.imu.orientation_covariance[0]=-1
		self.imu.linear_acceleration_covariance[0]=-1
		self.imu.angular_velocity_covariance[0]=-1		
		#setting accl data		
		acc=self.mpu.get_accel_data(False)
		self.imu.linear_acceleration.x=acc.x
		self.imu.linear_acceleration.y=acc.y
		self.imu.linear_acceleration.z=acc.z
		#setting gyro data		
		gyro = self.mpu.get_gyro_data()
		self.imu.angular_velocity.x=gyro.x
		self.imu.angular_velocity.y=gyro.y
		self.imu.angular_velocity.z=gyro.z
	def publish_variables(self):
		self.pub.publish(self.imu)

if __name__ == '__main__':
	sensor()
		
