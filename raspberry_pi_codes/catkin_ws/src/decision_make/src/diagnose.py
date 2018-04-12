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
		rospy.logerror('Connection Lost with the HeadUnit')
	if msg.battery <25:
		f=False
		rospy.logwarn('Battery less than : %f'%float(msg.battery))
	if msg.current_1 > 16:
		f=False
		rospy.logfatal('current of rotor 1 more than : %f'%float(msg.current_1))
	if msg.current_2 > 16:
		f=False
		rospy.logfatal('current of rotor 2 more than : %f'%float(msg.current_2))
	if msg.current_3 > 16:
		f=False
		rospy.logfatal('current of rotor 3 more than : %f'%float(msg.current_3))
	if msg.current_4 > 16:
		f=False
		rospy.logfatal('current of rotor 4 more than : %f'%float(msg.current_4))	
	pub.publish(f)
	

rospy.init_node('diagnose')
pub = rospy.Publisher('decision_make/diagnose_state',Bool,queue_size=1)
sub = rospy.Subscriber('communication/diagnose_data',diagnose_msg,callback)
rospy.spin()
