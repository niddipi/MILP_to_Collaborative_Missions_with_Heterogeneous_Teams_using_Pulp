#!/usr/bin/env python
import rospy
import mavros
import mavros.command
import mavros_msgs.msg
import mavros_msgs.srv
import time
from mavros.utils import *
from std_msgs.msg import Header
from mavros_msgs.msg import PositionTarget
from mavros_msgs.msg import State
from mavros_msgs.srv import SetMode 
from mavros_msgs.srv import CommandBool
from mavros import setpoint as SP

state = mavros_msgs.msg.State;
def state_callback(msg):
    state = msg 
    #print("CurrentMode:",state.mode)
    #print("CurrentMode:",state.armed)
    return 0

def main():
    rospy.init_node('offboardX')
    rate=rospy.Rate(20)
    mavros.set_namespace('/mavros')
    state_sub = rospy.Subscriber(mavros.get_topic('state'),mavros_msgs.msg.State,state_callback)
    arming = rospy.ServiceProxy('/mavros/cmd/arming',mavros_msgs.srv.CommandBool)
    #set_mode=rospy.ServiceProxy('/mavros/set_mode',SetMode)
    set_mode=rospy.ServiceProxy('/mavros/set_mode',mavros_msgs.srv.SetMode)
    #local_pub =  rospy.Publisher(mavros.get_topic('PositionTarget'),mavros_msgs.msg.PositionTarget,queue_size=10)
    local_pub =  rospy.Publisher(mavros.get_topic('PositionTarget'),mavros_msgs.msg.PositionTarget,queue_size=10)
    pose = PositionTarget()
    pose.header = Header()
    pose.header.frame_id="att_pose"
    pose.header.stamp=rospy.Time.now()
    pose.position.x=0
    pose.position.y=0
    pose.position.z=15
    while(not state.connected):
        rate.sleep()
    for i in range(0,50):
        local_pub.publish(pose)
    #mavros.command.arming(True)
    #set_mode(0,'OFFBOARD')
    last_request = rospy.Time.now()
    while 1:
        if(state.mode != "OFFBOARD" and (rospy.Time.now()-last_request > rospy.Duration(5.0))):
            print("inside22")
            if(set_mode(0,'OFFBOARD').success):
                print("Offboard enabled")
                last_request = rospy.Time.now()
        else:
            if(not state.armed and  (rospy.Time.now()-last_request > rospy.Duration(5.0))):
                if(mavros.command.arming(True)):
                    print("vehicle armed")                
                    last_request = rospy.Time.now()

        print("entered")
        local_pub.publish(pose)
        rospy.spin()
        rate.sleep()
    return 0


if __name__=='__main__':
    main()
