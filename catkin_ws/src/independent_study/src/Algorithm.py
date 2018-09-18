from pulp import *
import numpy as np
import math

##Locations of the tasks
locations = [[0, 0], [0, 1], [0, 2], [0, 3],[0,4],[0,5],[1, 0], [1, 1], [1, 2], [1, 3],[1,4],[1,5],
               [2, 0], [2, 1], [2, 2], [2, 3], [2,4], [2,5],[3, 0], [3, 1], [3, 2], [3, 3],[3,4],[3,5]]

#Reward(R) for the task
reward = [1,2,1,1,1,1,4,1,1,1,1,3,1,1,5,1,4,1,1,1,2,1,0.1,1]

#Efficiency(psi) of the task
efficiency = [0.3,1,0.1,0.2,0.1,0.5,0.6,0.2,0.7,0.6,0.5,0.6,0.3,0.1,0.3,0.4,0.2,1,0.2,0.5,0.2,0.6,0.6,1]

##Assigned time for the task
w = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]

n = len(locations)

###Defining the problem statement
prob = pulp.LpProblem('Task allocation', pulp.LpMaximize)

x = {}

#Defining xij variables
for i in range(0,n):
	for j in range(0,n):
		lowerBound = 0
		upperBound = 1
		if i == j:
			x[i,j] = pulp.LpVariable('x' +'_' + str(i) + '_' + str(j), lowerBound, upperBound, pulp.LpBinary)
			x[i,j] = 0
		else:
			x[i,j] = pulp.LpVariable('x' +'_'+ str(i) + '_' + str(j), lowerBound, upperBound, pulp.LpBinary)

#Conditions 2,3, and 4
for i in range(0, n):
	prob += pulp.lpSum([x[i,j] for j in range(0,n)]) == 1,""#Here I considered yk =1


for j in range(0, n):
	prob += pulp.lpSum([x[i,j] for i in range(1,n)]) == 1,""#Here I considered yk =1


#Starting time of Each task how to find it??
t = []
for i in range(0, n):
    t.append(pulp.LpVariable('t_' + str(i), cat='Integer'))

T = 5
##Condition 5 where T = 5(Missions intervals assigned to the task)
for i in range(0, n):
	for j in range(0, n):
		if i != j:
			prob += pulp.lpSum([t[i] + w[i] - t[j] <= (1-x[i,j])*T])

service = [] #phi variable
for i in range(0, n):
    service.append(pulp.LpVariable('phi_' + str(i), cat='Integer'))

#condition 7 for each task service is efficiency * assigned time
for i in range(0,n):
	service[i] <= efficiency[i]*w[i]

#condition 8
Required_completion = 1
for i in range(0,n):
	0 <= service[i]<= Required_completion


#Objective Function condition 1
prob += pulp.lpSum([ reward[k] * service[k] for k in range(1,n)])	


prob.writeLP("result.lp")
optimization_result = prob.solve()

print("Status:", LpStatus[prob.status])
print("Optimal Solution to the problem: ", value(prob.objective))
print ("Individual decision_variables: ")

name = []
task_route = []
task_route_points = []

for v in prob.variables():
	if(v.varValue == 1):
		print(v.name)
		name.append(v.name) 

#Extracts task loactions from the arc
temp = "0"
for num in range(len(name)):
	for i in range(len(name)):
		data = name[i].split("_")
		if data[1] == temp:
			task_route.append(data[1])
			temp = data[2]
			break
##Indexes of the points in locations defined
print "Indexes of the points in task locations list defined"
print task_route

print "points present at Indexes or task locations"
###Prints the task locations.
for i in range(len(task_route)):
	task_route_points.append(locations[int(task_route[i])])
print task_route_points
