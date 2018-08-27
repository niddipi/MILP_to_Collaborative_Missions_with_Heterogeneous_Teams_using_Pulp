import networkx as nx
import matplotlib.pyplot as plt
from pulp import *
import math

##Locations of the tasks
locations = [[0, 0], [0, 1], [0, 2], [0, 3],[0,4],[0,5],[1, 0], [1, 1], [1, 2], [1, 3],[1,4],[1,5],[2, 0], [2, 1], [2, 2], [2, 3], [2,4], [2,5],[3, 0], [3, 1], [3, 2], [3, 3],[3,4],[3,5]]

#Reward(R) for the task
reward = [1,2,1,1,1,1,4,1,1,1,1,3,1,1,5,1,4,1,1,1,2,1,0.1,1]

#Efficiency(psi) of the task
#efficiency = [0.3,1,0.1,0.2,0.1,0.5,0.6,0.2,0.7,0.6,0.5,0.6,0.3,0.1,0.3,0.4,0.2,1,0.2,0.5,0.2,0.6,0.6,1]
efficiency=[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]

#Task names to be added as nodes in graph
tasks = [0 ,1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23]

##Assigned time for the task
w = []
#Length of the locations
n = len(locations)
""" EF. Dummy task is represented by index n"""
DUMMY = n
Dtask = [0,-1]

##Distance calculation function
def dist(i,j):
	if j < len(locations):
        	value = math.sqrt(((locations[i][0]-locations[j][0])**2)+((locations[i][1]-locations[j][1])**2))
	else:
		value = math.sqrt(((locations[i][0]-Dtask[0])**2)+((locations[i][1]-Dtask[1])**2))
        return value

##Directed Graph Creation for what sequence of tasks are valid
G=nx.DiGraph()
G.add_nodes_from(tasks)
#Edges of the graph
Edges = [(0, 1),(1, 7),(0,6),(6,12),(12,13),(7, 13),(13, 19),(19, 20),(20, 21),(21,15),(15,14),(14,8),(8,2),(2,1)]
#Edges = [(0, 1),(1, 7),(7, 13),(13, 19),(19, 20),(20, 21),(21,15),(15,14),(14,8),(8,2),(2,3)]

G.add_nodes_from(tasks)
G.add_edges_from(Edges)

G.add_edge(DUMMY,0)
G.add_edge(DUMMY,1)

#Addition of Dummy edges to graph
for i in range(0,len(tasks)):
	#if len(G.in_edges(i)) != 0 or len(G.out_edges(i)) != 0:
	G.add_edge(i,DUMMY)
	G.add_edge(DUMMY,i)

print len(G.edges)

def Best_tasks_for_agent(Completion_map,T): 
	###Defining the problem statement
	prob = pulp.LpProblem('Task allocation', pulp.LpMaximize)
	print "no of nodes in traversability graph",G.number_of_nodes()

	x = {}

	y={}
	#Defining xij variables
	""" need to define x for the dummy task""" 
	for i in range(0,n)+[DUMMY]:
		for j in range(0,n)+[DUMMY]:
			lowerBound = 0
			upperBound = 1
	#Creates variable xij only if the i-->j sequence is valid
			if i != j and G.has_edge(i,j):
				x[i,j] = pulp.LpVariable('x' +'_'+ str(i) + '_' + str(j), lowerBound, upperBound, pulp.LpBinary)

	#Creates task y lp variable only if there is "i" node in the graph
		if len(G.in_edges(i)) != 0 or len(G.out_edges(i)) != 0 or i == DUMMY:
			y[i] = pulp.LpVariable("y_" + str(i), lowerBound, upperBound, pulp.LpBinary)

	#Conditions 2,3, and 4
	for i in range(0, n):
		if len(G.in_edges(i)) != 0 or len(G.out_edges(i)) != 0:
			prob += pulp.lpSum([x[i,j] for j in range(0,n)+[DUMMY] if i!=j and G.has_edge(i,j)]) == y[i]
		
	prob += y[DUMMY] == 1

	for j in range(0, n):
		if len(G.in_edges(j)) != 0 or len(G.out_edges(j)) != 0:
			prob += pulp.lpSum([x[i,j] for i in range(0,n)+[DUMMY] if i!=j and G.has_edge(i,j)]) == y[j]


	#Starting time of Each task
	t = []
	for i in range(0, n)+[DUMMY]:
	    t.append(pulp.LpVariable('t_' + str(i), cat='Integer'))
	    """ EF. add variables w """
	    w.append(pulp.LpVariable('w_' + str(i), cat='Integer'))



	#T = 5
	prob += pulp.lpSum([w[i] for i in range(0,n)]) <= T#Here I considered yk =1   
	##Condition 5 where T = 5(Missions intervals assigned to the task)
	""" EF. range(0,n) should be range(0,n+1) to include the dummy """
	for i in range(0, n)+[DUMMY]:
		for j in range(0, n)+[DUMMY]:
			if i != j and G.has_edge(i,j):
				prob += ((t[i] + w[i] - t[j]) <= (1-x[i,j])*(T+1))


	###Condition 3 and 4
	prob += pulp.lpSum([x[i,DUMMY] for i in range(0,n) if  G.has_edge(i,DUMMY)]) == 1,""
	prob += pulp.lpSum([x[DUMMY,i] for i in range(0,n) if  G.has_edge(DUMMY,i)]) == 1,""

	service = [] #phi variable
	""" Creation of service variable for every task will that help for sharing of completion map"""
	for i in range(0,n):
	    service.append(pulp.LpVariable('phi_' + str(i), cat='Continuous'))

	#condition 7 for each task service is efficiency * assigned time
	for i in range(0,n):
		if len(G.in_edges(i)) != 0 or len(G.out_edges(i)) != 0 or i == DUMMY:
			""" EF. this must be a constraint """
			prob += service[i] <= efficiency[i]*w[i]
			""" and you are missing some other constraints (see Eq. (7) ) """
			prob += y[i] <= t[i]
			prob += y[i] <= w[i]
			prob += t[i] <= y[i]*(T+1)
			prob += w[i] <= y[i]*(T+1)


	#condition 8
	Required_completion = 1
	""" EF. what do you mean by required completion? """
#	print len(Centralized.Completion_map)
	for i in range(0,n):
		prob += service[i]<= Completion_map[i] 
		""" EF. some other constraint. You could also set it as bound """
		prob += 0 <= service[i]



	#Objective Function condition 1
	prob += pulp.lpSum([ reward[k] * service[k] for k in range(0,n)])	


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

	#Extracts task loactions from the arc
	temp = "24"
	G_sel = nx.DiGraph()
	for num in range(len(name)):
		data = name[num].split("_")
		if data[0] == "x":
			for i in range(len(name)):
				data = name[i].split("_")
				if data[1] == temp and data[0] == "x":
					print "temp is",temp
					task_route.append(data[1])
					temp = data[2]
					G_sel.add_edge(data[1],data[2])
					break
	##Indexes of the points in locations defined
	print "Indexes of the points in task locations list defined"
	###Prints the task locations.
	for i in range(0,len(task_route)):
		if task_route[i] != "24":
			task_route_points.append(locations[int(task_route[i])])
	task = {"task_route":[],"task_route_points":[]}
	task["task_route"] = task_route
	task["task_route_points"]=task_route_points
	return task
'''
print task_route_points
#nx.draw(G,with_labels=True)
plt.figure(1)
plt.title('Sequence of tasks selected by Algorithm')
pos = nx.spring_layout(G_sel,k=0.7,iterations=20)
#nx.draw(G,pos,with_labels=True) 
nx.draw(G_sel,pos,with_labels=True) 
print "selected Sequence of tasks"
print G_sel.edges

plt.figure(2)
pos1 = nx.spring_layout(G,k=0.7,iterations=20)
nx.draw(G,pos1,with_labels=True)
plt.title('Traversability graph given')

plt.show()
'''
#task_route_points = []
#task_route_points = Best_tasks_for_agent() 
#print task_route_points
