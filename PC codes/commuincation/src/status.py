#!/usr/bin/env python

import rospy
from std_msgs.msg import String

def callback(msg):
    print msg.data
    print '-------'

rospy.init_node('status')
sub = rospy.Subscriber('state',String,callback)
rospy.spin()
