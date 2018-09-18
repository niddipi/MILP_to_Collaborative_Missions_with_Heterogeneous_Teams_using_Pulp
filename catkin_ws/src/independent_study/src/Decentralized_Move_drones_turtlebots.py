import rospy
from nav_msgs.msg import Odometry
from tf.transformations import euler_from_quaternion
from geometry_msgs.msg import Twist
from geometry_msgs.msg import Point
from math import atan2
from Decentralized_agent1_Algorithm_func import agent1_Best_tasks_for_agent 
from Decentralized_agent2_Algorithm_func import agent2_Best_tasks_for_agent 
from Decentralized_agent3_Algorithm_func import agent3_Best_tasks_for_agent 
from Decentralized_agent4_Algorithm_func import agent4_Best_tasks_for_agent 
from independent_study.msg import IntList
from independent_study.msg import agent3_path
from independent_study.msg import agent4_path
from independent_study.msg import uav1
from independent_study.msg import uav2
from threading import Lock
import time


import threading


rospy.init_node('Move_drones_turtlebots')
T = 3
Completion_map = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
count = 0
#Robot1 parameters
robot1_x = 0.0
robot1_y = 0.0
robot1_angle = 0.0

#UAV updates
uav1_COMPLETED=""
uav2_COMPLETED=""

#Robot2 parameters
robot2_x = 0.0
robot2_y = 0.0
robot2_angle = 0.0

#task
#task = {"agent_task_route":[],"agent_task_route_points":[]}


def R1Cur_loc(msg):
	global robot1_x
	global robot1_y
	global robot1_angle
	robot1_x = msg.pose.pose.position.x
	robot1_y = msg.pose.pose.position.y
	robot1_orient = msg.pose.pose.orientation
	(roll,pitch,robot1_angle)=euler_from_quaternion(
		[robot1_orient.x,robot1_orient.y,robot1_orient.z,robot1_orient.w])


def R2Cur_loc(msg):
	global robot2_x
	global robot2_y
	global robot2_angle
	robot2_x = msg.pose.pose.position.x
	robot2_y = msg.pose.pose.position.y
	robot2_orient = msg.pose.pose.orientation
	(roll,pitch,robot2_angle)=euler_from_quaternion(
		[robot2_orient.x,robot2_orient.y,robot2_orient.z,robot2_orient.w])

def uav1_update(msg):
	global uav1_COMPLETED
	uav1_COMPLETED = msg.COMPLETED	

def uav2_update(msg):
	global uav2_COMPLETED 
	uav2_COMPLETED = msg.COMPLETED

def update_completion_map(agent_task_route):
	for p in range(0,len(agent_task_route)):
		if agent_task_route[p] != "30":
			Completion_map[int(agent_task_route[p])] = 0

rospy.loginfo("Welcome")

#This is for the First robot
Odom_sub1 = rospy.Subscriber(
	'/robot1/odom',Odometry,R1Cur_loc)

cmd_vel_pub1 = rospy.Publisher(
	'/robot1/mobile_base/commands/velocity', Twist, queue_size=10)


#This is for the second robot
Odom_sub2 	= rospy.Subscriber('/robot2/odom',Odometry,R2Cur_loc)
cmd_vel_pub2  	= rospy.Publisher('/robot2/mobile_base/commands/velocity', Twist, queue_size=10)
uav1_path_pub = rospy.Publisher('agent3_path',agent3_path, queue_size=10)
uav2_path_pub = rospy.Publisher('agent4_path',agent4_path, queue_size=10)
uav1_sub      = rospy.Subscriber('uav1',uav1,uav1_update)
uav2_sub      = rospy.Subscriber('uav2',uav2,uav2_update)

rospy.loginfo("done")
rate = rospy.Rate(10)

R1move  = Twist()
R1_Dest  = Point()


R2move  = Twist()
R2_Dest  = Point()

lock = Lock()

def Myturtlebot1():
	global R1_Dest
	global R1_move
	global robot1_x
        global robot1_y
        global robot1_angle
	global count
	i =0
	if count == 0:
		count =1
		#print agent1_task_route_points
		count = 0
	
	task    = agent1_Best_tasks_for_agent(Completion_map,T)
	agent_task_route        = task["task_route"]
	agent_task_route_points = task["task_route_points"]
	lock.acquire()
	update_completion_map(agent_task_route)
	print "agent1 :",task
	lock.release()
	while i < len(agent_task_route_points):
		R1_Dest.x = agent_task_route_points[i][0]
	        R1_Dest.y = agent_task_route_points[i][1]
		while not rospy.is_shutdown():
			R1x_diff = R1_Dest.x - robot1_x
			R1y_diff = R1_Dest.y - robot1_y
			R1new_angle = atan2(R1y_diff,R1x_diff)
			if abs(R1new_angle - robot1_angle)> 0.2:
				R1move.linear.x  = 0.0
				R1move.angular.z = 0.3
			else:
				R1move.linear.x = 0.5
				R1move.linear.z = 0.0

			cmd_vel_pub1.publish(R1move)
			rate.sleep()
			R1x_diff = abs(R1_Dest.x - robot1_x)
			R1y_diff = abs(R1_Dest.y - robot1_y)
			if(R1x_diff < 0.2 and R1y_diff < 0.2):
				i = i+1
                        	break

def Myturtlebot2():
	i =0
	global R2_Dest
	global R2_move
	global robot2_x
        global robot2_y
        global robot2_angle
	global count
	if count == 0:
		count =1
		count = 0
	
	task    = agent2_Best_tasks_for_agent(Completion_map,T)
	agent_task_route        = task["task_route"]
	agent_task_route_points = task["task_route_points"]
	lock.acquire()
	update_completion_map(agent_task_route)
	lock.release()
	while i < len(agent_task_route_points):
		R2_Dest.x = agent_task_route_points[i][0]
		R2_Dest.y = agent_task_route_points[i][1]
		while not rospy.is_shutdown():
			R2x_diff = R2_Dest.x - robot2_x
			R2y_diff = R2_Dest.y - robot2_y
			R2new_angle = atan2(R2y_diff,R2x_diff)
			if abs(R2new_angle - robot2_angle)> 0.2:
				R2move.linear.x  = 0.0
				R2move.angular.z = 0.2
			else:
				R2move.linear.x = 0.5
				R2move.linear.z = 0.0
			
			cmd_vel_pub2.publish(R2move)
			rate.sleep()
			R2x_diff = abs(R2_Dest.x - robot2_x)
			R2y_diff = abs(R2_Dest.y - robot2_y)
			'''
			print "R2_Dest :",R2_Dest.x
			print "R2_Dest :",R2_Dest.y
			print "X :",robot2_x
			print "Y :",robot2_y
			print "R2_xdiff :",R2x_diff
			print "R2_ydiff :",R2y_diff
			'''
			if(R2x_diff < 0.2 and R2y_diff < 0.2):
				i = i+1
                        	break

def publish_waypoints_uav1():
	global uav1_COMPLETED
	task    = agent3_Best_tasks_for_agent(Completion_map,T)
	agent_task_route        = task["task_route"]
	agent_task_route_points = task["task_route_points"]
	lock.acquire()
	update_completion_map(agent_task_route)
	lock.release()
	msg = agent3_path()
	for i in range(len(agent_task_route_points)):
		point = IntList()
		point.elements = agent_task_route_points[i]
		msg.way_points.append(point)
	while(True):
		uav1_path_pub.publish(msg)
		if(uav1_COMPLETED == 'yes'):
			break
	print "Uav1 Completed its task"

def publish_waypoints_uav2():
	global uav2_COMPLETED
	task    = agent4_Best_tasks_for_agent(Completion_map,T)
	agent_task_route        = task["task_route"]
	agent_task_route_points = task["task_route_points"]
	lock.acquire()
	update_completion_map(agent_task_route)
	lock.release()
	msg = agent4_path()
	for i in range(len(agent_task_route_points)):
		point = IntList()
		point.elements = agent_task_route_points[i]
		msg.way_points.append(point)
	while(True):
		uav2_path_pub.publish(msg)
		if(uav2_COMPLETED == 'yes'):
			break
	print "Uav2 Completed its task"

start = time.time()
thread1 = threading.Thread(target=Myturtlebot1, args=[])
thread2 = threading.Thread(target=Myturtlebot2, args=[])
thread3 = threading.Thread(target=publish_waypoints_uav1, args=[])
thread4 = threading.Thread(target=publish_waypoints_uav2, args=[])

thread1.start()
thread2.start()
thread3.start()
thread4.start()

thread1.join()
thread2.join()
thread3.join()
thread4.join()
end = time.time()
Time_taken_to_complete_assigned_tasks = end - start

No_of_serviced_tasks = float(len(Completion_map)-sum(Completion_map))
print "Area covered by Decentralized : ",(No_of_serviced_tasks/len(Completion_map))*100
print "Time taken to complete assigned tasks in minutes : %.2f"%(Time_taken_to_complete_assigned_tasks/60)
