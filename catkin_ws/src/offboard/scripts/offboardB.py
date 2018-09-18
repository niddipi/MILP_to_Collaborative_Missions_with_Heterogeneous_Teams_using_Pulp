#!/usr/bin/env python

import rospy
import mavros
from geometry_msgs.msg import PoseStamped
from mavros_msgs.msg import State 
from mavros_msgs.srv import CommandBool, SetMode

# callback method for state sub
current_state = State() 
offb_set_mode = SetMode
def state_cb(state):
    global current_state
    current_state = state

local_pos_pub = rospy.Publisher('/mavros/setpoint_position/local', PoseStamped, queue_size=10)
state_sub = rospy.Subscriber('/mavros/state', State, state_cb)
arming_client = rospy.ServiceProxy('/mavros/cmd/arming', CommandBool)
set_mode_client = rospy.ServiceProxy('/mavros/set_mode', SetMode) 
print "OffboardBBBBBBBBBBBBBB" 

pose = PoseStamped()
pose.pose.position.x = 0
pose.pose.position.y = 0
pose.pose.position.z = 5

def position_control():
    rospy.init_node('offboardY', anonymous=True)
    prev_state = current_state
    rate = rospy.Rate(20.0) # MUST be more then 2Hz
    print "OffboardBBBBBBBBBBBBBB111111111" 

    # wait for FCU connection
    while not current_state.connected:
        rate.sleep()
    # send a few setpoints before starting
    for i in range(100):
        local_pos_pub.publish(pose)
        rate.sleep()
    arming_client(True)
    

    last_request = rospy.Time.now()
    while not rospy.is_shutdown():
        now = rospy.Time.now()
        if current_state.mode != "OFFBOARD" and (now - last_request > rospy.Duration(5.0)):
            if(set_mode_client(0,"OFFBOARD")):
               print "Success"
            last_request = now 
            print "This is if"
        else:
            if not current_state.armed and (now - last_request > rospy.Duration(5.0)):
               arming_client(True)
               print "This is else"
               last_request = now 
        # older versions of PX4 always return success==True, so better to check Status instead
        if prev_state.armed != current_state.armed:
            rospy.loginfo("Vehicle armed: %r" % current_state.armed)
        if prev_state.mode != current_state.mode: 
            rospy.loginfo("Current mode: %s" % current_state.mode)
        prev_state = current_state

        # Update timestamp and publish pose 
        pose.header.stamp = rospy.Time.now()
        local_pos_pub.publish(pose)
        print "This is out"
        rate.sleep()

if __name__ == '__main__':
    try:
        position_control()
    except rospy.ROSInterruptException:
        pass
