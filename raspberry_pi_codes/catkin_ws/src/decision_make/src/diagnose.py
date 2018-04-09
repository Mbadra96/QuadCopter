#!/usr/bin/env python 
import rospy 
from decision_make.msg import *
from std_msgs.msg import Float32,Bool,String
from multimaster_msgs_fkie.srv import DiscoverMasters,DiscoverMastersResponse
from multimaster_msgs_fkie.msg import MasterState,ROSMaster

def callback(msg):
	rospy.wait_for_service('/master_discovery/list_masters')
	masters_service=rospy.ServiceProxy('/master_discovery/list_masters',DiscoverMasters)
	masters = masters_service().masters
	names=[]
	f =True
	for i in masters:
		names.append(i.name)

	if 'badra-mrslab' not in names:
		f=False
		state.publish('WARNING:Connection Lost with the HeadUnit')
	if msg.battery <25:
		f=False
		state.publish( 'battery less than 25%')
	if msg.current_1 > 16:
		f=False
		state.publish('current 1 more than 16A')
	if msg.current_2 > 16:
		f=False
		state.publish( 'current 2 more than 16A')
	if msg.current_3 > 16:
		f=False
		state.publish( 'current 3 more than 16A')
	if msg.current_4 > 16:
		f=False
		state.publish( 'current 4 more than 16A')	
	pub.publish(f)
	

rospy.init_node('diagnose')
pub = rospy.Publisher('diagnose_state',Bool,queue_size=1)
sub = rospy.Subscriber('current_battery',diagnose_msg,callback)
state = rospy.Publisher('status',String,queue_size=1)
rospy.spin()
