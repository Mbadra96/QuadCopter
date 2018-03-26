#!/usr/bin/env python
import rospy 
from decision_make.msg import *
from std_msgs.msg import String,Bool

class make_decision:
    def __init__(self):
        #initializing the attributes
        self.motor_1=0
        self.motor_2=0
        self.motor_3=0
        self.motor_4=0
	self.emergency_mode=False
        #initializing the node
        rospy.init_node('make_decision')
        self.diagnose_sub = rospy.Subscriber('diagnose_state', Bool, self.diagnose)
        self.matlab_sub = rospy.Subscriber('rpm', rpm_msg, self.matlab_assign)
        self.motors_pub = rospy.Publisher('motors',rpm_msg,queue_size = 1)


    def diagnose(self,msg):
	    self.emergency_mode= not msg.data
	    if self.emergency_mode:
		self.emergency()
		self.motor_control()

    def matlab_assign(self,msg):
	if not self.emergency_mode:
            self.motor_1=msg.motor_1
            self.motor_2=msg.motor_2
            self.motor_3=msg.motor_3
            self.motor_4=msg.motor_4
	    self.motor_control()

        

    def emergency(self):
	#os.sys("rosrun control stabilization.py")
        self.motor_1 = 0
        self.motor_2 = 0
        self.motor_3 = 0
        self.motor_4 = 0
    

    def motor_control(self):
        rpm =rpm_msg()
        rpm.motor_1 = self.motor_1
        rpm.motor_2 = self.motor_2
        rpm.motor_3 = self.motor_3
        rpm.motor_4 = self.motor_4
        self.motors_pub.publish(rpm)





if __name__ == '__main__':
	
	dec_node = make_decision()
	r=rospy.Rate(4)
	while not rospy.is_shutdown():
		dec_node.motor_control()
		r.sleep()
