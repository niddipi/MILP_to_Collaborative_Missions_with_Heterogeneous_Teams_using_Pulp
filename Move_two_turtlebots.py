import rospy
from nav_msgs.msg import Odometry
from tf.transformations import euler_from_quaternion
from geometry_msgs.msg import Twist
from geometry_msgs.msg import Point
from math import atan2


rospy.init_node('Move_to_point')

#Robot1 parameters
robot1_x = 0.0
robot1_y = 0.0
robot1_angle = 0.0


#Robot2 parameters
robot2_x = 0.0
robot2_y = 0.0
robot2_angle = 0.0


def R1Cur_loc(msg):
	global robot1_x
	global robot1_x
	global robot1_angle
	robot1_x = msg.pose.pose.position.x
	robot1_angle = msg.pose.pose.position.y
	robot1_orient = msg.pose.pose.orientation
	(roll,pitch,robot1_angle)=euler_from_quaternion(
		[robot1_orient.x,robot1_orient.y,robot1_orient.z,robot1_orient.w])


def R2Cur_loc(msg):
	global robot2_x
	global robot2_x
	global robot2_angle
	robot2_x = msg.pose.pose.position.x
	robot2_angle = msg.pose.pose.position.y
	robot2_orient = msg.pose.pose.orientation
	(roll,pitch,robot2_angle)=euler_from_quaternion(
		[robot2_orient.x,robot2_orient.y,robot2_orient.z,robot2_orient.w])



rospy.loginfo("Welcome")

#This is for the First robot
Odom_sub1 = rospy.Subscriber(
	'/robot1/odom',Odometry,R1Cur_loc)

cmd_vel_pub1 = rospy.Publisher(
	'/robot1/mobile_base/commands/velocity', Twist, queue_size=10)


#This is for the second robot
Odom_sub2 	= rospy.Subscriber('/robot2/odom',Odometry,R2Cur_loc)
cmd_vel_pub2  	= rospy.Publisher('/robot2/mobile_base/commands/velocity', Twist, queue_size=10)

rospy.loginfo("done")
rate = rospy.Rate(10)

R1move  = Twist()
R1Dest  = Point()

R1Dest.x = 3
R1Dest.x = 3

R2move  = Twist()
R2Dest  = Point()

R2Dest.x = -2
R2Dest.x = -3


while not rospy.is_shutdown():
        R1x_diff = R1Dest.x - robot1_x
        R1y_diff = R1Dest.y - robot1_y

        R1new_angle = atan2(R1x_diff,R1y_diff)
        if abs(R1new_angle - robot1_angle)> 0.2:
                R1move.linear.x  = 0.0
                R1move.angular.z = 0.3
        else:
                R1move.linear.x = 0.5
                R1move.linear.z = 0.0

        cmd_vel_pub1.publish(R1move)

	
	R2x_diff = R2Dest.x - robot2_x
        R2y_diff = R2Dest.y - robot2_y

	
        R2new_angle = atan2(R2x_diff,R2y_diff)
        if abs(R2new_angle - robot2_angle)> 0.2:
                R2move.linear.x  = 0.0
                R2move.angular.z = 0.3
        else:
                R2move.linear.x = 0.5
                R2move.linear.z = 0.0
	
        cmd_vel_pub2.publish(R2move)

        rate.sleep()
