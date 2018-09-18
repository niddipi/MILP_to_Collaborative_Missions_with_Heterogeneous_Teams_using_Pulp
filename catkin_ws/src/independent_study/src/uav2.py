#!/usr/bin/env python
import rospy
import mavros
from nav_msgs.msg import Odometry
from geometry_msgs.msg import PoseStamped
from mavros_msgs.msg import State 
from mavros_msgs.srv import CommandBool, SetMode
from independent_study.msg import IntList
from independent_study.msg import agent4_path
from independent_study.msg import uav2
from geometry_msgs.msg import Point


# callback method for state sub
current_state = State() 
current_position = Point()
offb_set_mode = SetMode
way_points = []
def state_cb(state):
    global current_state
    current_state = state

def curpos_cb(pos):
    global current_position 
    print pos
    current_position = pos

def update_waypoints(msg):
    global way_points
    way_points = []
    for i in range(len(msg.way_points)):
	point = IntList()
	point = msg.way_points[i]
	way_points.append(point.elements)

local_pos_pub = rospy.Publisher('/B/mavros/setpoint_position/local', PoseStamped, queue_size=10)
state_sub = rospy.Subscriber('/B/mavros/state', State, state_cb)
Cur_position_sub = rospy.Subscriber('/B/mavros/local_position/odom', Odometry, curpos_cb)
arming_client = rospy.ServiceProxy('/B/mavros/cmd/arming', CommandBool)
set_mode_client = rospy.ServiceProxy('/B/mavros/set_mode', SetMode) 
uav2_waypoint_sub = rospy.Subscriber('agent4_path',agent4_path,update_waypoints)
uav2_update_pub = rospy.Publisher('uav2',uav2,queue_size=10)

pose = PoseStamped()
pose.pose.position.x = 0
pose.pose.position.y = 0
pose.pose.position.z = 5

def position_control_uav2():
    index = 0
    global way_points
    rospy.init_node('UAV2', anonymous=True)
    prev_state = current_state
    rate = rospy.Rate(20.0) # MUST be more then 2Hz
     
    # wait for FCU connection
    while (not rospy.is_shutdown()) and (not current_state.connected):
        rate.sleep()
    # send a few setpoints before starting
    for i in range(100):
        local_pos_pub.publish(pose)
        rate.sleep()
    arming_client(True)
    
    last_request = rospy.Time.now()
    print "way_points :",way_points
    while not rospy.is_shutdown():
	if len(way_points)>0 and index < len(way_points):
		pose.pose.position.x = way_points[index][0]
		pose.pose.position.y = way_points[index][1]
		pose.pose.position.z = 5
		
	else:
	        pose.pose.position.x = 0
                pose.pose.position.y = 0
                pose.pose.position.z = 5	
        now = rospy.Time.now()
        if current_state.mode != "OFFBOARD" and (now - last_request > rospy.Duration(5.0)):
            if(set_mode_client(0,"OFFBOARD")):
               print "Success"
            last_request = now 
        else:
            if not current_state.armed and (now - last_request > rospy.Duration(5.0)):
               arming_client(True)
               last_request = now 
	'''
        # older versions of PX4 always return success==True, so better to check Status instead
        if prev_state.armed != current_state.armed:
            rospy.loginfo("Vehicle armed: %r" % current_state.armed)
        if prev_state.mode != current_state.mode: 
            rospy.loginfo("Current mode: %s" % current_state.mode)
        prev_state = current_state
	'''
        # Update timestamp and publish pose 
        pose.header.stamp = rospy.Time.now()
        local_pos_pub.publish(pose)
	if (abs(current_position.pose.pose.position.x - pose.pose.position.x) <= 0.1 and 
	    abs(current_position.pose.pose.position.y - pose.pose.position.y) <= 0.1 and
	    len(way_points)>0):
		index = index+1
	if index == len(way_points) and index != 0:
		uav2_update_pub.publish("yes")
        rate.sleep()

if __name__ == '__main__':
    try:
        position_control_uav2()
    except rospy.ROSInterruptException:
        pass

