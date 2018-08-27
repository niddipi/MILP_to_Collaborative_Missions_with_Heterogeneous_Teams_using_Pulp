import rospy
from nav_msgs.msg import Odometry
from tf.transformations import euler_from_quaternion
from geometry_msgs.msg import Twist
from geometry_msgs.msg import Point
from math import atan2
from Single_agent_Algorithm_func import Best_tasks_for_agent  


rospy.init_node('Move_to_point')
x = 0.0
y = 0.0
angle = 0.0
Completion_map = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
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

Dest.x = 3
Dest.y = 3
task_route_points = []
if sum(Completion_map) > 5:
                T = 15
else:
	T = sum(Completion_map) - 5

task = Best_tasks_for_agent(Completion_map,T)
task_route = task["task_route"]
task_route_points = task["task_route_points"]
for p in range(0,len(task_route)):
                if task_route[p] != "24":
                	Completion_map[int(task_route[p])] = 0

while not rospy.is_shutdown():
	i = 0
	while i < len(task_route_points):
		Dest.x = task_route_points[i][0]
		Dest.y = task_route_points[i][1]

		x_diff = Dest.x - x
		y_diff = Dest.y - y
		i = i+1	
		new_angle = atan2(x_diff,y_diff)

	if sum(Completion_map) > 5:
		T = 5
	else:
		T = sum(Completion_map) - 5
		 
	task = Best_tasks_for_agent(Completion_map,T)
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
	if(len(task_route) <=2):
		break
'''
		if abs(new_angle - angle)> 0.2:
			move.linear.x = 0.0
			move.angular.z = 0.3
		else:
			move.linear.x = 0.5
			move.linear.z = 0.0
		
		cmd_vel_pub.publish(move)
		rate.sleep()	
'''

