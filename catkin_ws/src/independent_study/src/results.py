import numpy as np
from matplotlib import pyplot as plt
#The below are the results obtained
#In the below listed points X is T(Mission Intervals) and Y is Area Covered in percent
centralized_T_and_area_covered = [(3,26.66),(5,50.33),(8,73.33)]
plt.figure(1)
plt.xlabel('T(Mission Intervals')
plt.ylabel('Area Covered in percent')
plt.title('  Centralized Approach  ')
data1 = np.array(centralized_T_and_area_covered)
x, y = data1.T
plt.bar(x, y, align='center', alpha=0.5)
#In the below listed points X is T(Mission Intervals) and Y is Area Covered in percent
centralized_T_and_time = [(3,3.24),(5,4.02),(8,5.82)]
plt.figure(2)
plt.xlabel('T(Mission Intervals')
plt.ylabel('Time taken to complete assigned tasks by all agents')
plt.title('  Centralized Approach  ')
data2 = np.array(centralized_T_and_time)
x, y = data2.T
plt.bar(x, y, align='center', alpha=0.5)

#In the below listed points X is T(Mission Intervals) and Y is Area Covered in percent
Decentralized_T_and_area_covered = [(3,33.33),(5,53.33),(8,73.33)]
plt.figure(3)
plt.xlabel('T(Mission Intervals')
plt.ylabel('Time taken to complete assigned tasks by all agents')
plt.title('  Decentralized Approach  ')
data3 = np.array(Decentralized_T_and_area_covered)
x, y = data3.T
plt.bar(x, y, align='center', alpha=0.5,color='g')

#In the below listed points X is T(Mission Intervals) and Y is Area Covered in percent
Decentralized_T_and_time = [(3,3.23),(5,4.21),(8,6.32)]
plt.figure(4)
plt.xlabel('T(Mission Intervals')
plt.ylabel('Time taken to complete assigned tasks by all agents')
plt.title('  Decentralized Approach  ')
data4 = np.array(Decentralized_T_and_time)
x, y = data4.T
plt.bar(x, y, align='center', alpha=0.5,color='g')

plt.show()
