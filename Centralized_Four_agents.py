import networkx as nx
import matplotlib.pyplot as plt
from pulp import *
import numpy as np
import math

##Locations of the tasks
locations = [[0, 0], [0, 1], [0, 2], [0, 3],[0,4],[0,5],[1, 0], [1, 1], [1, 2], [1, 3],[1,4],[1,5],[2, 0], [2, 1], [2, 2], [2, 3], [2,4], [2,5],[3, 0], [3, 1], [3, 2], [3, 3],[3,4],[3,5],[4, 0], [4, 1], [4, 2], [4, 3],[4,4],[4,5]]
#Task names to be added as nodes in graph
tasks = [0 ,1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23,24,25,26,27,28,29]

n = len(locations)
#Reward(R) for the task
reward = {"agent1":[],"agent2":[],"agent3":[],"agent4":[]}
reward["agent1"] = [1,2,1,1,1,1,4,1,1,1,1,3,1,1,5,1,4,1,1,1,2,1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1]
reward["agent2"] = [1,1,2,1,2,1,1,1,1,1,1,0.2,1,1,0.5,1,4,1,1,1,2,1,1,0.1,0.1,0.1,0.1,0.1,0.1,0.1]
reward["agent3"] = [0.1,0.1,0.1,0.1,0.1,0.1,0.1,1,1,1,1,0.5,1,4,1,1,1,2,2,2,2,2,2,2,2,2,4,4,4,4]
reward["agent4"] = [0.1,0.1,0.1,0.1,0.1,0.1,0.1,1,2,2,2,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,3,3,3,3]


#Efficiency(psi) of the task
efficiency = {"agent1":[],"agent2":[],"agent3":[],"agent4":[]}
efficiency["agent1"]= [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
efficiency["agent2"]=[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
efficiency["agent3"]=[4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4]
efficiency["agent4"]=[4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4]


""" Dummy task is represented by index n"""
DUMMY = n

G = {"agent1":nx.DiGraph(),"agent2":nx.DiGraph(),"agent3":nx.DiGraph(),"agent4":nx.DiGraph()}
G_Sel = {"agent1":nx.DiGraph(),"agent2":nx.DiGraph(),"agent3":nx.DiGraph(),"agent4":nx.DiGraph()}

G["agent1"].add_nodes_from(tasks)
G["agent2"].add_nodes_from(tasks)
G["agent3"].add_nodes_from(tasks)
G["agent4"].add_nodes_from(tasks)

#Edges of the graph
Edges1 = [(0, 1),(1, 7),(0,6),(6,12),(12,13),(7, 13),(13, 19),(19, 20),(20, 21),(21,15),(15,14),(14,8),(8,2),(2,1)]
Edges2 = [(5, 11),(11, 17),(17,16),(16,10),(16,15),(10,4),(4,3),(9, 15),(15, 21),(21, 22),(22,23),(23,17)]
Edges3 = [(11, 17),(11,10),(10,16),(16,17),(17,23),(23,22),(22,21),(21,20),(20, 19),(19, 18),(18, 12),(12,13),(13,7),(7,1)]
Edges4 = [(11,17),(17,23),(23,29),(29,28),(28,22),(22,21),(21,27),(27,26),(26,25),(25,24),(24,18),(18,12),(12,13),(13,14)]


G["agent1"].add_edges_from(Edges1)
G["agent2"].add_edges_from(Edges2)
G["agent3"].add_edges_from(Edges3)
G["agent4"].add_edges_from(Edges4)

##Assigned time for the task
w = {"agent1":[],"agent2":[],"agent3":[],"agent4":[]}

x = {"agent1":{},"agent2":{},"agent3":{},"agent4":{}}

"""  add variable y """
y ={"agent1":{},"agent2":{},"agent3":{},"agent4":{}}

G["agent1"].add_edge(DUMMY,0)
G["agent1"].add_edge(DUMMY,6)
G["agent2"].add_edge(DUMMY,5)
G["agent3"].add_edge(DUMMY,11)
G["agent4"].add_edge(DUMMY,17)
G["agent4"].add_edge(DUMMY,11)

#Addition of Dummy edges to graph
for key in x:
	for i in range(0,len(tasks)):
		if len(G[key].in_edges(i)) != 0 or len(G[key].out_edges(i)) != 0:
			G[key].add_edge(i,DUMMY)


def plot_the_graphs():
	i = 0
	temp = 30
	for key in G:
		i = i+1
		p = 211
		plt.figure(i)
		plt.subplot(p)
		G[key].remove_node(temp)
		pos1 = nx.spring_layout(G[key],k=0.7,iterations=20)
		nx.draw(G[key],pos1,with_labels=True)
		plt.title('Traversability graph given for '+key)
		p = p +1
		plt.subplot(p)
		pos2 = nx.spring_layout(G_Sel[key],k=0.7,iterations=20)
		nx.draw(G_Sel[key],pos2,with_labels=True)
		#plt.subplots_adjust(bottom=0.01,right=None, top=0.99)
		plt.title('Selected path for '+key+' using centralized algorithm')
	plt.show()

#Defining the problem statement
def Best_tasks_for_agent(Completion_map,T):
	prob = pulp.LpProblem('Task allocation', pulp.LpMaximize)

	#Defining xij variables
	for key in x :
		for i in range(0,n)+[DUMMY]:
			for j in range(0,n)+[DUMMY]:
				lp_name = key+"x"+'_'+ str(i) + '_' + str(j)
				lowerBound = 0
				upperBound = 1
				if i != j and G[key].has_edge(i,j):
					x[key][i,j] = pulp.LpVariable(
								lp_name, lowerBound,upperBound,pulp.LpBinary)
				""" EF. add variable y_ik """
			if len(G[key].in_edges(i)) != 0 or len(G[key].out_edges(i)) != 0 or i == DUMMY:
				y[key][i] = pulp.LpVariable(
						key+"y_" + str(i), lowerBound, upperBound,pulp.LpBinary)

	#Conditions 2,3, and 4
	for key in x :
		for i in range(0, n):
			""" EF. add variable y """
			if len(G[key].in_edges(i)) != 0 or len(G[key].out_edges(i)) != 0:
				prob += pulp.lpSum([x[key][i,j] for j in range(0,n)+[DUMMY] 
							if i!=j and G[key].has_edge(i,j)]) == y[key][i],""
		prob += y[key][DUMMY] == 1

	for key in x :
		for j in range(0, n):
			""" EF. add variable y, range(1,n) should be range(0,n)""" 
			if len(G[key].in_edges(j)) != 0 or len(G[key].out_edges(j)) != 0:
				prob += pulp.lpSum([x[key][i,j] for i in range(0,n)+[DUMMY] 
							if i!=j and G[key].has_edge(i,j)]) == y[key][j]

	t = {"agent1":[],"agent2":[],"agent3":[],"agent4":[]}
	for key in x:
		for i in range(0, n)+[DUMMY]:
			t[key].append(pulp.LpVariable(key+'t_' + str(i), cat='Integer'))
			w[key].append(pulp.LpVariable(key+'w_' + str(i), cat='Integer'))
	print "No of Mission intervals T is :",T
	for key in x:
		prob += pulp.lpSum([w[key][i] for i in range(0,n)+[DUMMY]]) <= T
	##Condition 5 where T = 5(Missions intervals assigned to the task)
	for key in x:
		for i in range(0, n)+[DUMMY]:
			for j in range(0, n)+[DUMMY]:
				if i != j and G[key].has_edge(i,j):
					prob += ((t[key][i] + w[key][i] - t[key][j]) <= (1-x[key][i,j])*(T+1))


	""" constraints (3) and (4) must be specified """
	for key in x:
		prob += pulp.lpSum([x[key][i,DUMMY] for i in range(0,n) 
							if G[key].has_edge(i,DUMMY)]) == 1,""
		prob += pulp.lpSum([x[key][DUMMY,i] for i in range(0,n) 
							if G[key].has_edge(DUMMY,i)]) == 1,""

	service = {"agent1":[],"agent2":[],"agent3":[],"agent4":[]} #phi variable
	"""  service should be continuous """
	for key in x:
		for i in range(0, n):
		    service[key].append(pulp.LpVariable(key+'phi_' + str(i), cat='Continuous'))

	#condition 7 for each task service is efficiency * assigned time
	for key in x:
		for i in range(0,n):
			if len(G[key].in_edges(i)) != 0 or len(G[key].out_edges(i)) != 0:
					#prob += service[key][i] <= pulp.lpSum(
					#	[efficiency[ag][i]*w[ag][i] for ag in x])
					prob += service[key][i] <= efficiency[key][i]*w[key][i]
					prob += y[key][i] <= t[key][i]
					prob += y[key][i] <= w[key][i]
					prob += t[key][i] <= y[key][i]*(T+1)
					prob += w[key][i] <= y[key][i]*(T+1)

	#condition 8
	Required_completion = 1

	##I meant Required completion as Cm 
	for key in x:
		for i in range(0,n):
			prob += service[key][i]<= 1 
			""" EF. some other constraint. You could also set it as bound """
			prob += 0 <= service[key][i]



	#Objective Function condition 1
	prob += pulp.lpSum([reward[key][k] * service[key][k] for key in x for k in range(0,n)])	


	prob.writeLP("result.lp")
	optimization_result = prob.solve()

	print("Status:", LpStatus[prob.status])
	print("Optimal Solution to the problem: ", value(prob.objective))
	print ("Individual decision_variables: ")
	prob.writeLP("result.lp")

	variable_name = []
        task = {"agent1_task_route":[],"agent1_task_route_points":[],
		"agent2_task_route":[],"agent2_task_route_points":[],
		"agent3_task_route":[],"agent3_task_route_points":[],
		"agent4_task_route":[],"agent4_task_route_points":[],}
	agent1_task_route = []
	agent2_task_route = []
	agent3_task_route = []
	agent4_task_route = []
	agent1_task_route_points = []
	agent2_task_route_points = []
	agent3_task_route_points = []
	agent4_task_route_points = []

	for v in prob.variables():
		if(v.varValue > 0):
			print(v.name + "= " + str(v.varValue))
			variable_name.append(v.name) 

	#Extracts task loactions from the arc
        temp = "30"
        for num in range(len(variable_name)):
                data = variable_name[num].split("_")
                if data[0] == "agent1x":
                        for i in range(len(variable_name)):
                                data = variable_name[i].split("_")
                                if data[1] == temp and data[0] == "agent1x":
                                        agent1_task_route.append(data[1])
                                        temp = data[2]
					G_Sel["agent1"].add_edge(data[1],data[2])
                                        break
	  ##Indexes of the points in locations defined
        print "Indexes of the points in task locations list defined"
        ###Prints the task locations.
        for i in range(0,len(agent1_task_route)):
                if agent1_task_route[i] != "30":
                        agent1_task_route_points.append(locations[int(agent1_task_route[i])])
        task["agent1_task_route"] = agent1_task_route
        task["agent1_task_route_points"]= agent1_task_route_points


	#Extracts task loactions from the arc
        temp = "30"
        for num in range(len(variable_name)):
                data = variable_name[num].split("_")
                if data[0] == "agent2x":
                        for i in range(len(variable_name)):
                                data = variable_name[i].split("_")
                                if data[1] == temp and data[0] == "agent2x":
                                        agent2_task_route.append(data[1])
					G_Sel["agent2"].add_edge(data[1],data[2])
                                        temp = data[2]
                                        break
	  ##Indexes of the points in locations defined
        print "Indexes of the points in task locations list defined"
        ###Prints the task locations.
        for i in range(0,len(agent2_task_route)):
                if agent2_task_route[i] != "30":
                        agent2_task_route_points.append(locations[int(agent2_task_route[i])])
        task["agent2_task_route"] = agent2_task_route
        task["agent2_task_route_points"]= agent2_task_route_points
	
	#Extracts task loactions from the arc
        temp = "30"
        for num in range(len(variable_name)):
                data = variable_name[num].split("_")
                if data[0] == "agent3x":
                        for i in range(len(variable_name)):
                                data = variable_name[i].split("_")
                                if data[1] == temp and data[0] == "agent3x":
                                        agent3_task_route.append(data[1])
					G_Sel["agent3"].add_edge(data[1],data[2])
                                        temp = data[2]
                                        break
	  ##Indexes of the points in locations defined
        print "Indexes of the points in task locations list defined"
        ###Prints the task locations.
        for i in range(0,len(agent3_task_route)):
                if agent3_task_route[i] != "30":
                        agent3_task_route_points.append(locations[int(agent3_task_route[i])])
        task["agent3_task_route"] = agent3_task_route
        task["agent3_task_route_points"]= agent3_task_route_points
	
	#Extracts task loactions from the arc
        temp = "30"
        for num in range(len(variable_name)):
                data = variable_name[num].split("_")
                if data[0] == "agent4x":
                        for i in range(len(variable_name)):
                                data = variable_name[i].split("_")
                                if data[1] == temp and data[0] == "agent4x":
                                        agent4_task_route.append(data[1])
					G_Sel["agent4"].add_edge(data[1],data[2])
                                        temp = data[2]
                                        break
	  ##Indexes of the points in locations defined
        print "Indexes of the points in task locations list defined"
        ###Prints the task locations.
        for i in range(0,len(agent4_task_route)):
                if agent4_task_route[i] != "30":
                        agent4_task_route_points.append(locations[int(agent4_task_route[i])])
        task["agent4_task_route"] = agent4_task_route
        task["agent4_task_route_points"]= agent4_task_route_points
	plot_the_graphs()
        return task
'''
#For testing algorithm purpose
Completion_map = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
T = 5
task = Best_tasks_for_agent(Completion_map,T)
'''
