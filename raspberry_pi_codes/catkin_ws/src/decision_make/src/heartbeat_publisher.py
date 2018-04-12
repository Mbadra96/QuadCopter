#!/usr/bin/env python 
import rospy 
from std_msgs.msg import Empty

rospy.init_node("heartbeat")

rospy.set_param('heartbeat','10' )
pub = rospy.Publisher('heartbeat_hz',Empty,queue_size=1)
while not rospy.is_shutdown():
	r= rospy.Rate(rospy.get_param('heartbeat'))
	pub.publish(Empty())
	r.sleep()