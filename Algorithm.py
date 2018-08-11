from pulp import *
import numpy as np
import math

##Locations of the tasks
locations = [[0, 0], [0, 1], [0, 2], [0, 3],[0,4],[0,5],[1, 0], [1, 1], [1, 2], [1, 3],[1,4],[1,5],[2, 0], [2, 1], [2, 2], [2, 3], [2,4], [2,5],[3, 0], [3, 1], [3, 2], [3, 3],[3,4],[3,5]]

#Reward(R) for the task
reward = {"agent1":[],"agent2":[]}
reward["agent1"] = [1,2,1,1,1,1,4,1,1,1,1,3,1,1,5,1,4,1,1,1,2,1,0.1,1]
reward["agent2"] = [1,2,1,1,1,1,4,1,1,1,1,3,1,1,5,1,4,1,1,1,2,1,0.1,1]

#Efficiency(psi) of the task
efficiency = {"agent1":[],"agent2":[]}
efficiency["agent1"] = [0.3,1,0.1,0.2,0.1,0.5,0.6,0.2,0.7,0.6,0.5,0.6,0.3,0.1,0.3,0.4,0.2,1,0.2,0.5,0.2,0.6,0.6,1]
efficiency["agent2"] = [0.3,0.1,0.4,0.2,0.1,0.5,0.6,0.2,0.9,0.6,0.5,0.6,0.3,0.9,0.3,0.4,0.2,1,0.2,0.5,1,0.6,0.6,0.1]


##Assigned time for the task
""" EF.This must be a variable 
w = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
"""
w = {"agent1":[],"agent2":[]}


n = len(locations)

""" EF. Dummy task is represented by index n"""
DUMMY = [n,25]

###Defining the problem statement
prob = pulp.LpProblem('Task allocation', pulp.LpMaximize)

x = {"agent1":{},"agent2":{}}


""" EF. add variable y """
y ={"agent1":{},"agent2":{}}

#Defining xij variables
""" need to define x for the dummy task""" 
k = 0
for key in x :
	for i in range(0,n)+[DUMMY[k]]:
		for j in range(0,n)+[DUMMY[k]]:
			lp_name = key+"x"+'_'+ str(i) + '_' + str(j)
			lowerBound = 0
			upperBound = 1
			if i == j:
				continue
			else:
				x[key][i,j] = pulp.LpVariable(lp_name, lowerBound, upperBound, pulp.LpBinary)
		""" EF. add variable y_ik """
		y[key][i] = pulp.LpVariable(key+"y_" + str(i), lowerBound, upperBound, pulp.LpBinary)
	k = k+1
#Conditions 2,3, and 4
k = 0
for key in x :
	for i in range(0, n):
		""" EF. add variable y """
		prob += pulp.lpSum([x[key][i,j] for j in range(0,n)+[DUMMY[k]] if i!=j]) == y[key][i],""
	prob += y[key][DUMMY[k]] == 1
        k = k+1

k = 0
for key in x :
	for j in range(0, n):
		""" EF. add variable y, range(1,n) should be range(0,n)""" 
		prob += pulp.lpSum([x[key][i,j] for i in range(0,n)+[DUMMY[k]] if i!=j]) == y[key][j]
	k = k+1

#Starting time of Each task how to find it??
""" EF. t is a variable, its value will be found by the solver 
"""
k=0
t = {"agent1":[],"agent2":[]}
for key in x:
	for i in range(0, n)+[DUMMY[k]]:
	    t[key].append(pulp.LpVariable(key+'t_' + str(i), cat='Integer'))
	    """ EF. add variables w """
	    w[key].append(pulp.LpVariable(key+'w_' + str(i), cat='Integer'))
	k = k+1

T = 3
for key in x:
	prob += pulp.lpSum([w[key][i] for i in range(0,n)]) <= T#Here I considered yk =1   

##Condition 5 where T = 5(Missions intervals assigned to the task)
""" EF. range(0,n) should be range(0,n+1) to include the dummy """
for key in x:
	for i in range(0, n):
		for j in range(0, n):
			if i != j:
				prob += ((t[key][i] + w[key][i] - t[key][j]) <= (1-x[key][i,j])*(T+1))


""" EF. constraints (3) and (4) must be specified """
k =0
for key in x:
	prob += pulp.lpSum([x[key][i,DUMMY[k]] for i in range(0,n)]) == 1,""
	prob += pulp.lpSum([x[key][DUMMY[k],i] for i in range(0,n)]) == 1,""
	k = k+1

service = {"agent1":[],"agent2":[]} #phi variable
""" EF. service should be continuous """
for key in x:
	for i in range(0, n):
	    service[key].append(pulp.LpVariable(key+'phi_' + str(i), cat='Continuous'))

#condition 7 for each task service is efficiency * assigned time
for key in x:
	for i in range(0,n):
		""" EF. this must be a constraint """
		prob += service[key][i] <= pulp.lpSum([efficiency[ag][i]*w[ag][i] for ag in x])
		""" and you are missing some other constraints (see Eq. (7) ) """
		prob += y[key][i] <= t[key][i]
		prob += y[key][i] <= w[key][i]
		prob += t[key][i] <= y[key][i]*(T+1)
		prob += w[key][i] <= y[key][i]*(T+1)


#condition 8
Required_completion = 1

""" EF. what do you mean by required completion? """
for key in x:
	for i in range(0,n):
		prob += service[key][i]<= Required_completion
		""" EF. some other constraint. You could also set it as bound """
		prob += 0 <= service[key][i]



#Objective Function condition 1
prob += pulp.lpSum([ reward[key][k] * service[key][k] for key in x for k in range(0,n)])	


prob.writeLP("result.lp")
optimization_result = prob.solve()

print("Status:", LpStatus[prob.status])
print("Optimal Solution to the problem: ", value(prob.objective))
print ("Individual decision_variables: ")

name = []
task_route = []
task_route_points = []

for v in prob.variables():
	if(v.varValue > 0):
		print(v.name + "= " + str(v.varValue))
		name.append(v.name) 
'''
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
'''
