from pulp import *
import numpy as np
import math

locations = [[0, 0], [0, 1], [0, 2], [0, 3],[0,4],[0,5],[1, 0], [1, 1], [1, 2], [1, 3],[1,4],[1,5],
               [2, 0], [2, 1], [2, 2], [2, 3], [2,4], [2,5],[3, 0], [3, 1], [3, 2], [3, 3],[3,4],[3,5]]

reward = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
#efficiency = [0.3,1,0.1,0.2,0.1,0.5,0.6,0.2,0.7,0.6,0.5,0.6,0.3,0.1,0.3,0.4,0.2,1,0.2,0.5,0.2,0.6,0.6,1]
efficiency = [0.2,0.2,0.8,0.2,0.5,0.5,0.8,0.2,0.6,0.3,0.2,0.1,0.3,1,0.7,1,0.5,0.4,0.2,0.6,0.5,1,0.2,0.3]

max_distance = 0
print len(reward)
print len(efficiency)
def dist(i,j):
	global max_distance
	value = math.sqrt(((locations[i][0]-locations[j][0])**2)+((locations[i][1]-locations[j][1])**2))
	return value

prob = pulp.LpProblem('Task allocation', pulp.LpMinimize)

decision_variables = []
loc = []
x = {}

val = 0
n = len(locations)
#distances
for i in range(1,n):
	for j in range(1,n):
		lowerBound = 0
		upperBound = 1
		if i == j:
			x[i,j] = pulp.LpVariable('x' +'_' + str(i) + '_' + str(j), lowerBound, upperBound, pulp.LpBinary)
			x[i,j] = 0
		else:
			x[i,j] = pulp.LpVariable('x' +'_'+ str(i) + '_' + str(j), lowerBound, upperBound, pulp.LpBinary)
#		decision_variables.append(x[i,j])
for i in range(1, n):
	prob += pulp.lpSum([x[i,j] for j in range(1,n)]) == 1,""


for j in range(1, n):
	prob += pulp.lpSum([x[i,j] for i in range(1,n)]) == 1,""

prob += pulp.lpSum([ dist(i,j) * x[i,j] for i in range(1,n) for j in range(1,n)])	

u = []
for i in range(1, n):
    u.append(pulp.LpVariable('u_' + str(i), cat='Integer'))

print n
print len(u)
for i in range(1, n-1):
	for j in range(1, n-1):
		if i != j:
			prob += pulp.lpSum([u[i] - u[j] + n*x[i,j]]) <= n-1
#prob += sum([(decision_variables[i]) for i in range(1,len(x))]) == 5
prob.writeLP("result.lp")
optimization_result = prob.solve()

print("Status:", LpStatus[prob.status])
print("Optimal Solution to the problem: ", value(prob.objective))
print ("Individual decision_variables: ")
t = []
route = []
route_points = []
for v in prob.variables():
	if(v.varValue == 1):
		print(v.name)
		t.append(v.name) 

temp = "1"
for num in range(len(t)):
	for i in range(len(t)):
		data = t[i].split("_")
		if data[1] == temp:
			route.append(data[1])
			temp = data[2]
			break

print route
for i in range(len(route)):
	route_points.append(locations[int(route[i])])
print route_points
