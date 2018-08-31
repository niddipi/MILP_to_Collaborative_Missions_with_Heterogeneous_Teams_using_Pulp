import rospy
from nav_msgs.msg import Odometry
from tf.transformations import euler_from_quaternion
from geometry_msgs.msg import Twist
from geometry_msgs.msg import Point
import math
from math import atan2
from Single_agent_Algorithm_func import Best_tasks_for_agent  


rospy.init_node('Move_to_point')
x = 5.0
y = 5.0
angle = 0.0
Completion_map = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
def Cur_loc(msg):
	global x
	global y
	global angle
	x = msg.pose.pose.position.x
	y = msg.pose.pose.position.y
	orient = msg.pose.pose.orientation
	(roll,pitch,angle)=euler_from_quaternion([orient.x,orient.y,orient.z,orient.w])


rospy.loginfo("Welcome")
Odom_sub = rospy.Subscriber('/robot1/odom',Odometry,Cur_loc)
#cmd_vel_pub  = rospy.Publisher('/robot1/mobile_base/cmd_vel_mux/input/navi', Twist, queue_size=10)
cmd_vel_pub  = rospy.Publisher(
	'/robot1/mobile_base/commands/velocity', Twist, queue_size=10)

rospy.loginfo("done")
rospy.loginfo(angle)
rate = rospy.Rate(10)

move  = Twist()
Dest  = Point()

task_route_points = []

T = 5
task = Best_tasks_for_agent(Completion_map,T)
task_route = task["task_route"]
task_route_points = task["task_route_points"]
for p in range(0,len(task_route)):
                if task_route[p] != "24":
                	Completion_map[int(task_route[p])] = 0

i = 0
print task_route_points[0][0]
print "Init x:",x
print "Init y:",y
Dest.x = task_route_points[0][0]
Dest.y = task_route_points[0][1]
while i < len(task_route_points):
	Dest.x = task_route_points[i][0]
	Dest.y = task_route_points[i][1]
	
	while not rospy.is_shutdown():
		print "Dest.x :",Dest.x
		print "Dest.y :",Dest.y
		print "X is :",round(x)
		print "y is :",round(y)
		global x
		global y
		x_diff = Dest.x - x
		y_diff = Dest.y - y
		new_angle = atan2(y_diff,x_diff)
		if abs(new_angle - angle)> 0.1:
			move.linear.x = 0.0
			move.angular.z = 0.15
		else:
			move.linear.x = 0.3
			move.linear.z = 0.0
		
		cmd_vel_pub.publish(move)
		rate.sleep()	
		x_diff = Dest.x - x
		y_diff = Dest.y - y
		if(x_diff < 0.2 and y_diff < 0.2):
			i = i+1
			break
'''
	if sum(Completion_map) > 5:
		T = 5
	else:
		#T = sum(Completion_map) - 5
		T = 5
		 
	task = Best_tasks_for_agent(Completion_map,T)
	prev_task_route = task_route
	task_route = task["task_route"]
	task_route_points = task["task_route_points"]
	for p in range(0,len(task_route)):
			if task_route[p] != "24":
				Completion_map[int(task_route[p])] = 0
	print "This is in Single_Move_to_point.py task_route_points"
	print task_route_points
	print "This is in Single_Move_to_point.py Centralized.Completion_map"
	print Completion_map
	print sum(Completion_map)
	print Completion_map[8]
	if(len(task_route) <=2):
		if prev_task_route == task_route:
			break
	task["task_route"] = []
		if abs(new_angle - angle)> 0.2:
			move.linear.x = 0.0
			move.angular.z = 0.3
		else:
			move.linear.x = 0.5
			move.linear.z = 0.0
		
		cmd_vel_pub.publish(move)
		rate.sleep()	
'''

