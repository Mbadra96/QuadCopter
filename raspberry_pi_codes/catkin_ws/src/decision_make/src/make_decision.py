#!/usr/bin/env python
import rospy 
from decision_make.msg import *
from std_msgs.msg import String,Bool,Empty

class make_decision:
    def __init__(self):
        #initializing the attributes
        self.rpm =rpm_msg()
        self.rpm.motor_1 = 0
        self.rpm.motor_2 = 0
        self.rpm.motor_3 = 0
        self.rpm.motor_4 = 0
        self.emergency_mode=False
        #initializing the node
        rospy.init_node('make_decision')
        self.diagnose_sub = rospy.Subscriber('decision_make/diagnose_state', Bool, self.diagnose)
        self.matlab_sub = rospy.Subscriber('matlab/rpm', rpm_msg, self.matlab_assign)
        self.motors_pub = rospy.Publisher('decision_make/motors',rpm_msg,queue_size = 1)
        self.hz = rospy.Subscriber("heartbeat_hz",Empty,self.loop) #this is the heartbeat of the whole code


    def diagnose(self,msg):
        self.emergency_mode= not msg.data
	    rospy.logdebug('emergency_mode is: %r'%emergency_mode)
        if self.emergency_mode:
            self.emergency()
		

    def matlab_assign(self,msg):
        if not self.emergency_mode:
            self.rpm=msg
	    


    def emergency(self):
        rospy.logdebug('emergency_mode has been entered')
        self.rpm.motor_1 = 0
        self.rpm.motor_2 = 0
        self.rpm.motor_3 = 0
        self.rpm.motor_4 = 0
        

    def loop(self,msg):
        self.motors_pub.publish(self.rpm)


if __name__ == '__main__':
	
    dec_node = make_decision()
    rospy.spin()
		
	
