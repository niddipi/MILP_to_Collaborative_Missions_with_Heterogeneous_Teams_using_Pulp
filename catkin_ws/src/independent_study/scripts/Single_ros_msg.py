import rospy
from nav_msgs.msg import Odometry
from tf.transformations import euler_from_quaternion
from geometry_msgs.msg import Twist
from geometry_msgs.msg import Point
from independent_study.msg import IntList
from independent_study.msg import agent1_path
from math import atan2


rospy.init_node('Move_to_point')
x = 0.0
y = 0.0
angle = 0.0
tasks = [0 ,1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23]
#locations = [[0.0, 0.0], [0.0, 1.0], [0.0, 2.0], [0.0, 3.0],[0.0,4.0],[0.0,5.0],[1.0, 0.0]]
locations = [[0, 0], [0, 1], [0, 2], [0, 3],[0,4],[0,5],[1, 0]]

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
pub = rospy.Publisher('agent1_path',agent1_path, queue_size=10)


rospy.loginfo("done")
rospy.loginfo(angle)
rate = rospy.Rate(10)

move  = Twist()
Dest  = Point()

Dest.x = 3
Dest.y = 3
msg = agent1_path()
for i in range(len(locations)):
	point = IntList() 
	point.elements = locations[i]
	msg.way_points.append(point)

while not rospy.is_shutdown():
	x_diff = Dest.x - x
	y_diff = Dest.y - y
	
	new_angle = atan2(x_diff,y_diff)
	if abs(new_angle - angle)> 0.2:
		move.linear.x = 0.0
		move.angular.z = 0.3
	else:
		move.linear.x = 0.5
		move.linear.z = 0.0
	
	cmd_vel_pub.publish(move)
	pub.publish(msg)
	
	rate.sleep()	
