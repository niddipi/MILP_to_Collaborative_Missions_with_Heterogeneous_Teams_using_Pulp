\* Task allocation *\
Maximize
OBJ: agent1phi_0 + 2 agent1phi_1 + agent1phi_10 + 3 agent1phi_11
 + agent1phi_12 + agent1phi_13 + 5 agent1phi_14 + agent1phi_15
 + 4 agent1phi_16 + agent1phi_17 + agent1phi_18 + agent1phi_19 + agent1phi_2
 + 2 agent1phi_20 + agent1phi_21 + 0.1 agent1phi_22 + 0.1 agent1phi_23
 + 0.1 agent1phi_24 + 0.1 agent1phi_25 + 0.1 agent1phi_26 + 0.1 agent1phi_27
 + 0.1 agent1phi_28 + 0.1 agent1phi_29 + agent1phi_3 + agent1phi_4
 + agent1phi_5 + 4 agent1phi_6 + agent1phi_7 + agent1phi_8 + agent1phi_9
 + agent2phi_0 + agent2phi_1 + agent2phi_10 + 0.2 agent2phi_11 + agent2phi_12
 + agent2phi_13 + 0.5 agent2phi_14 + agent2phi_15 + 4 agent2phi_16
 + agent2phi_17 + agent2phi_18 + agent2phi_19 + 2 agent2phi_2 + 2 agent2phi_20
 + agent2phi_21 + agent2phi_22 + 0.1 agent2phi_23 + 0.1 agent2phi_24
 + 0.1 agent2phi_25 + 0.1 agent2phi_26 + 0.1 agent2phi_27 + 0.1 agent2phi_28
 + 0.1 agent2phi_29 + agent2phi_3 + 2 agent2phi_4 + agent2phi_5 + agent2phi_6
 + agent2phi_7 + agent2phi_8 + agent2phi_9 + 0.1 agent3phi_0 + 0.1 agent3phi_1
 + agent3phi_10 + 0.5 agent3phi_11 + agent3phi_12 + 4 agent3phi_13
 + agent3phi_14 + agent3phi_15 + agent3phi_16 + 2 agent3phi_17
 + 2 agent3phi_18 + 2 agent3phi_19 + 0.1 agent3phi_2 + 2 agent3phi_20
 + 2 agent3phi_21 + 2 agent3phi_22 + 2 agent3phi_23 + 2 agent3phi_24
 + 2 agent3phi_25 + 4 agent3phi_26 + 4 agent3phi_27 + 4 agent3phi_28
 + 4 agent3phi_29 + 0.1 agent3phi_3 + 0.1 agent3phi_4 + 0.1 agent3phi_5
 + 0.1 agent3phi_6 + agent3phi_7 + agent3phi_8 + agent3phi_9 + 0.1 agent4phi_0
 + 0.1 agent4phi_1 + 2 agent4phi_10 + agent4phi_11 + agent4phi_12
 + agent4phi_13 + agent4phi_14 + agent4phi_15 + agent4phi_16 + 2 agent4phi_17
 + 2 agent4phi_18 + 2 agent4phi_19 + 0.1 agent4phi_2 + 2 agent4phi_20
 + 2 agent4phi_21 + 2 agent4phi_22 + 2 agent4phi_23 + 2 agent4phi_24
 + 2 agent4phi_25 + 3 agent4phi_26 + 3 agent4phi_27 + 3 agent4phi_28
 + 3 agent4phi_29 + 0.1 agent4phi_3 + 0.1 agent4phi_4 + 0.1 agent4phi_5
 + 0.1 agent4phi_6 + agent4phi_7 + 2 agent4phi_8 + 2 agent4phi_9
Subject To
_C1: agent4x_11_17 + agent4x_11_30 - agent4y_11 = 0
_C10: agent4x_24_18 + agent4x_24_30 - agent4y_24 = 0
_C100: agent1x_30_0 - agent1y_0 = 0
_C101: agent1x_0_1 + agent1x_2_1 - agent1y_1 = 0
_C102: agent1x_8_2 - agent1y_2 = 0
_C103: agent1x_0_6 + agent1x_30_6 - agent1y_6 = 0
_C104: agent1x_1_7 - agent1y_7 = 0
_C105: agent1x_14_8 - agent1y_8 = 0
_C106: agent1x_6_12 - agent1y_12 = 0
_C107: agent1x_12_13 + agent1x_7_13 - agent1y_13 = 0
_C108: agent1x_15_14 - agent1y_14 = 0
_C109: agent1x_21_15 - agent1y_15 = 0
_C11: agent4x_25_24 + agent4x_25_30 - agent4y_25 = 0
_C110: agent1x_13_19 - agent1y_19 = 0
_C111: agent1x_19_20 - agent1y_20 = 0
_C112: agent1x_20_21 - agent1y_21 = 0
_C113: agent4w_0 + agent4w_1 + agent4w_10 + agent4w_11 + agent4w_12
 + agent4w_13 + agent4w_14 + agent4w_15 + agent4w_16 + agent4w_17 + agent4w_18
 + agent4w_19 + agent4w_2 + agent4w_20 + agent4w_21 + agent4w_22 + agent4w_23
 + agent4w_24 + agent4w_25 + agent4w_26 + agent4w_27 + agent4w_28 + agent4w_29
 + agent4w_3 + agent4w_30 + agent4w_4 + agent4w_5 + agent4w_6 + agent4w_7
 + agent4w_8 + agent4w_9 <= 5
_C114: agent3w_0 + agent3w_1 + agent3w_10 + agent3w_11 + agent3w_12
 + agent3w_13 + agent3w_14 + agent3w_15 + agent3w_16 + agent3w_17 + agent3w_18
 + agent3w_19 + agent3w_2 + agent3w_20 + agent3w_21 + agent3w_22 + agent3w_23
 + agent3w_24 + agent3w_25 + agent3w_26 + agent3w_27 + agent3w_28 + agent3w_29
 + agent3w_3 + agent3w_30 + agent3w_4 + agent3w_5 + agent3w_6 + agent3w_7
 + agent3w_8 + agent3w_9 <= 5
_C115: agent2w_0 + agent2w_1 + agent2w_10 + agent2w_11 + agent2w_12
 + agent2w_13 + agent2w_14 + agent2w_15 + agent2w_16 + agent2w_17 + agent2w_18
 + agent2w_19 + agent2w_2 + agent2w_20 + agent2w_21 + agent2w_22 + agent2w_23
 + agent2w_24 + agent2w_25 + agent2w_26 + agent2w_27 + agent2w_28 + agent2w_29
 + agent2w_3 + agent2w_30 + agent2w_4 + agent2w_5 + agent2w_6 + agent2w_7
 + agent2w_8 + agent2w_9 <= 5
_C116: agent1w_0 + agent1w_1 + agent1w_10 + agent1w_11 + agent1w_12
 + agent1w_13 + agent1w_14 + agent1w_15 + agent1w_16 + agent1w_17 + agent1w_18
 + agent1w_19 + agent1w_2 + agent1w_20 + agent1w_21 + agent1w_22 + agent1w_23
 + agent1w_24 + agent1w_25 + agent1w_26 + agent1w_27 + agent1w_28 + agent1w_29
 + agent1w_3 + agent1w_30 + agent1w_4 + agent1w_5 + agent1w_6 + agent1w_7
 + agent1w_8 + agent1w_9 <= 5
_C117: agent4t_11 - agent4t_17 + agent4w_11 + 6 agent4x_11_17 <= 6
_C118: agent4t_11 - agent4t_30 + agent4w_11 + 6 agent4x_11_30 <= 6
_C119: agent4t_12 - agent4t_13 + agent4w_12 + 6 agent4x_12_13 <= 6
_C12: agent4x_26_25 + agent4x_26_30 - agent4y_26 = 0
_C120: agent4t_12 - agent4t_30 + agent4w_12 + 6 agent4x_12_30 <= 6
_C121: agent4t_13 - agent4t_14 + agent4w_13 + 6 agent4x_13_14 <= 6
_C122: agent4t_13 - agent4t_30 + agent4w_13 + 6 agent4x_13_30 <= 6
_C123: agent4t_14 - agent4t_30 + agent4w_14 + 6 agent4x_14_30 <= 6
_C124: agent4t_17 - agent4t_23 + agent4w_17 + 6 agent4x_17_23 <= 6
_C125: agent4t_17 - agent4t_30 + agent4w_17 + 6 agent4x_17_30 <= 6
_C126: - agent4t_12 + agent4t_18 + agent4w_18 + 6 agent4x_18_12 <= 6
_C127: agent4t_18 - agent4t_30 + agent4w_18 + 6 agent4x_18_30 <= 6
_C128: agent4t_21 - agent4t_27 + agent4w_21 + 6 agent4x_21_27 <= 6
_C129: agent4t_21 - agent4t_30 + agent4w_21 + 6 agent4x_21_30 <= 6
_C13: agent4x_27_26 + agent4x_27_30 - agent4y_27 = 0
_C130: - agent4t_21 + agent4t_22 + agent4w_22 + 6 agent4x_22_21 <= 6
_C131: agent4t_22 - agent4t_30 + agent4w_22 + 6 agent4x_22_30 <= 6
_C132: agent4t_23 - agent4t_29 + agent4w_23 + 6 agent4x_23_29 <= 6
_C133: agent4t_23 - agent4t_30 + agent4w_23 + 6 agent4x_23_30 <= 6
_C134: - agent4t_18 + agent4t_24 + agent4w_24 + 6 agent4x_24_18 <= 6
_C135: agent4t_24 - agent4t_30 + agent4w_24 + 6 agent4x_24_30 <= 6
_C136: - agent4t_24 + agent4t_25 + agent4w_25 + 6 agent4x_25_24 <= 6
_C137: agent4t_25 - agent4t_30 + agent4w_25 + 6 agent4x_25_30 <= 6
_C138: - agent4t_25 + agent4t_26 + agent4w_26 + 6 agent4x_26_25 <= 6
_C139: agent4t_26 - agent4t_30 + agent4w_26 + 6 agent4x_26_30 <= 6
_C14: agent4x_28_22 + agent4x_28_30 - agent4y_28 = 0
_C140: - agent4t_26 + agent4t_27 + agent4w_27 + 6 agent4x_27_26 <= 6
_C141: agent4t_27 - agent4t_30 + agent4w_27 + 6 agent4x_27_30 <= 6
_C142: - agent4t_22 + agent4t_28 + agent4w_28 + 6 agent4x_28_22 <= 6
_C143: agent4t_28 - agent4t_30 + agent4w_28 + 6 agent4x_28_30 <= 6
_C144: - agent4t_28 + agent4t_29 + agent4w_29 + 6 agent4x_29_28 <= 6
_C145: agent4t_29 - agent4t_30 + agent4w_29 + 6 agent4x_29_30 <= 6
_C146: - agent4t_11 + agent4t_30 + agent4w_30 + 6 agent4x_30_11 <= 6
_C147: - agent4t_17 + agent4t_30 + agent4w_30 + 6 agent4x_30_17 <= 6
_C148: agent3t_1 - agent3t_30 + agent3w_1 + 6 agent3x_1_30 <= 6
_C149: - agent3t_1 + agent3t_7 + agent3w_7 + 6 agent3x_7_1 <= 6
_C15: agent4x_29_28 + agent4x_29_30 - agent4y_29 = 0
_C150: - agent3t_30 + agent3t_7 + agent3w_7 + 6 agent3x_7_30 <= 6
_C151: agent3t_10 - agent3t_16 + agent3w_10 + 6 agent3x_10_16 <= 6
_C152: agent3t_10 - agent3t_30 + agent3w_10 + 6 agent3x_10_30 <= 6
_C153: - agent3t_10 + agent3t_11 + agent3w_11 + 6 agent3x_11_10 <= 6
_C154: agent3t_11 - agent3t_17 + agent3w_11 + 6 agent3x_11_17 <= 6
_C155: agent3t_11 - agent3t_30 + agent3w_11 + 6 agent3x_11_30 <= 6
_C156: agent3t_12 - agent3t_13 + agent3w_12 + 6 agent3x_12_13 <= 6
_C157: agent3t_12 - agent3t_30 + agent3w_12 + 6 agent3x_12_30 <= 6
_C158: agent3t_13 - agent3t_7 + agent3w_13 + 6 agent3x_13_7 <= 6
_C159: agent3t_13 - agent3t_30 + agent3w_13 + 6 agent3x_13_30 <= 6
_C16: agent4y_30 = 1
_C160: agent3t_16 - agent3t_17 + agent3w_16 + 6 agent3x_16_17 <= 6
_C161: agent3t_16 - agent3t_30 + agent3w_16 + 6 agent3x_16_30 <= 6
_C162: agent3t_17 - agent3t_23 + agent3w_17 + 6 agent3x_17_23 <= 6
_C163: agent3t_17 - agent3t_30 + agent3w_17 + 6 agent3x_17_30 <= 6
_C164: - agent3t_12 + agent3t_18 + agent3w_18 + 6 agent3x_18_12 <= 6
_C165: agent3t_18 - agent3t_30 + agent3w_18 + 6 agent3x_18_30 <= 6
_C166: - agent3t_18 + agent3t_19 + agent3w_19 + 6 agent3x_19_18 <= 6
_C167: agent3t_19 - agent3t_30 + agent3w_19 + 6 agent3x_19_30 <= 6
_C168: - agent3t_19 + agent3t_20 + agent3w_20 + 6 agent3x_20_19 <= 6
_C169: agent3t_20 - agent3t_30 + agent3w_20 + 6 agent3x_20_30 <= 6
_C17: agent3x_1_30 - agent3y_1 = 0
_C170: - agent3t_20 + agent3t_21 + agent3w_21 + 6 agent3x_21_20 <= 6
_C171: agent3t_21 - agent3t_30 + agent3w_21 + 6 agent3x_21_30 <= 6
_C172: - agent3t_21 + agent3t_22 + agent3w_22 + 6 agent3x_22_21 <= 6
_C173: agent3t_22 - agent3t_30 + agent3w_22 + 6 agent3x_22_30 <= 6
_C174: - agent3t_22 + agent3t_23 + agent3w_23 + 6 agent3x_23_22 <= 6
_C175: agent3t_23 - agent3t_30 + agent3w_23 + 6 agent3x_23_30 <= 6
_C176: - agent3t_11 + agent3t_30 + agent3w_30 + 6 agent3x_30_11 <= 6
_C177: agent2t_3 - agent2t_30 + agent2w_3 + 6 agent2x_3_30 <= 6
_C178: - agent2t_3 + agent2t_4 + agent2w_4 + 6 agent2x_4_3 <= 6
_C179: - agent2t_30 + agent2t_4 + agent2w_4 + 6 agent2x_4_30 <= 6
_C18: agent3x_7_1 + agent3x_7_30 - agent3y_7 = 0
_C180: - agent2t_11 + agent2t_5 + agent2w_5 + 6 agent2x_5_11 <= 6
_C181: - agent2t_30 + agent2t_5 + agent2w_5 + 6 agent2x_5_30 <= 6
_C182: - agent2t_15 + agent2t_9 + agent2w_9 + 6 agent2x_9_15 <= 6
_C183: - agent2t_30 + agent2t_9 + agent2w_9 + 6 agent2x_9_30 <= 6
_C184: agent2t_10 - agent2t_4 + agent2w_10 + 6 agent2x_10_4 <= 6
_C185: agent2t_10 - agent2t_30 + agent2w_10 + 6 agent2x_10_30 <= 6
_C186: agent2t_11 - agent2t_17 + agent2w_11 + 6 agent2x_11_17 <= 6
_C187: agent2t_11 - agent2t_30 + agent2w_11 + 6 agent2x_11_30 <= 6
_C188: agent2t_15 - agent2t_21 + agent2w_15 + 6 agent2x_15_21 <= 6
_C189: agent2t_15 - agent2t_30 + agent2w_15 + 6 agent2x_15_30 <= 6
_C19: agent3x_10_16 + agent3x_10_30 - agent3y_10 = 0
_C190: - agent2t_10 + agent2t_16 + agent2w_16 + 6 agent2x_16_10 <= 6
_C191: - agent2t_15 + agent2t_16 + agent2w_16 + 6 agent2x_16_15 <= 6
_C192: agent2t_16 - agent2t_30 + agent2w_16 + 6 agent2x_16_30 <= 6
_C193: - agent2t_16 + agent2t_17 + agent2w_17 + 6 agent2x_17_16 <= 6
_C194: agent2t_17 - agent2t_30 + agent2w_17 + 6 agent2x_17_30 <= 6
_C195: agent2t_21 - agent2t_22 + agent2w_21 + 6 agent2x_21_22 <= 6
_C196: agent2t_21 - agent2t_30 + agent2w_21 + 6 agent2x_21_30 <= 6
_C197: agent2t_22 - agent2t_23 + agent2w_22 + 6 agent2x_22_23 <= 6
_C198: agent2t_22 - agent2t_30 + agent2w_22 + 6 agent2x_22_30 <= 6
_C199: - agent2t_17 + agent2t_23 + agent2w_23 + 6 agent2x_23_17 <= 6
_C2: agent4x_12_13 + agent4x_12_30 - agent4y_12 = 0
_C20: agent3x_11_10 + agent3x_11_17 + agent3x_11_30 - agent3y_11 = 0
_C200: agent2t_23 - agent2t_30 + agent2w_23 + 6 agent2x_23_30 <= 6
_C201: agent2t_30 - agent2t_5 + agent2w_30 + 6 agent2x_30_5 <= 6
_C202: agent1t_0 - agent1t_1 + agent1w_0 + 6 agent1x_0_1 <= 6
_C203: agent1t_0 - agent1t_6 + agent1w_0 + 6 agent1x_0_6 <= 6
_C204: agent1t_0 - agent1t_30 + agent1w_0 + 6 agent1x_0_30 <= 6
_C205: agent1t_1 - agent1t_7 + agent1w_1 + 6 agent1x_1_7 <= 6
_C206: agent1t_1 - agent1t_30 + agent1w_1 + 6 agent1x_1_30 <= 6
_C207: - agent1t_1 + agent1t_2 + agent1w_2 + 6 agent1x_2_1 <= 6
_C208: agent1t_2 - agent1t_30 + agent1w_2 + 6 agent1x_2_30 <= 6
_C209: - agent1t_12 + agent1t_6 + agent1w_6 + 6 agent1x_6_12 <= 6
_C21: agent3x_12_13 + agent3x_12_30 - agent3y_12 = 0
_C210: - agent1t_30 + agent1t_6 + agent1w_6 + 6 agent1x_6_30 <= 6
_C211: - agent1t_13 + agent1t_7 + agent1w_7 + 6 agent1x_7_13 <= 6
_C212: - agent1t_30 + agent1t_7 + agent1w_7 + 6 agent1x_7_30 <= 6
_C213: - agent1t_2 + agent1t_8 + agent1w_8 + 6 agent1x_8_2 <= 6
_C214: - agent1t_30 + agent1t_8 + agent1w_8 + 6 agent1x_8_30 <= 6
_C215: agent1t_12 - agent1t_13 + agent1w_12 + 6 agent1x_12_13 <= 6
_C216: agent1t_12 - agent1t_30 + agent1w_12 + 6 agent1x_12_30 <= 6
_C217: agent1t_13 - agent1t_19 + agent1w_13 + 6 agent1x_13_19 <= 6
_C218: agent1t_13 - agent1t_30 + agent1w_13 + 6 agent1x_13_30 <= 6
_C219: agent1t_14 - agent1t_8 + agent1w_14 + 6 agent1x_14_8 <= 6
_C22: agent3x_13_30 + agent3x_13_7 - agent3y_13 = 0
_C220: agent1t_14 - agent1t_30 + agent1w_14 + 6 agent1x_14_30 <= 6
_C221: - agent1t_14 + agent1t_15 + agent1w_15 + 6 agent1x_15_14 <= 6
_C222: agent1t_15 - agent1t_30 + agent1w_15 + 6 agent1x_15_30 <= 6
_C223: agent1t_19 - agent1t_20 + agent1w_19 + 6 agent1x_19_20 <= 6
_C224: agent1t_19 - agent1t_30 + agent1w_19 + 6 agent1x_19_30 <= 6
_C225: agent1t_20 - agent1t_21 + agent1w_20 + 6 agent1x_20_21 <= 6
_C226: agent1t_20 - agent1t_30 + agent1w_20 + 6 agent1x_20_30 <= 6
_C227: - agent1t_15 + agent1t_21 + agent1w_21 + 6 agent1x_21_15 <= 6
_C228: agent1t_21 - agent1t_30 + agent1w_21 + 6 agent1x_21_30 <= 6
_C229: - agent1t_0 + agent1t_30 + agent1w_30 + 6 agent1x_30_0 <= 6
_C23: agent3x_16_17 + agent3x_16_30 - agent3y_16 = 0
_C230: agent1t_30 - agent1t_6 + agent1w_30 + 6 agent1x_30_6 <= 6
_C231: agent4x_11_30 + agent4x_12_30 + agent4x_13_30 + agent4x_14_30
 + agent4x_17_30 + agent4x_18_30 + agent4x_21_30 + agent4x_22_30
 + agent4x_23_30 + agent4x_24_30 + agent4x_25_30 + agent4x_26_30
 + agent4x_27_30 + agent4x_28_30 + agent4x_29_30 = 1
_C232: agent4x_30_11 + agent4x_30_17 = 1
_C233: agent3x_10_30 + agent3x_11_30 + agent3x_12_30 + agent3x_13_30
 + agent3x_16_30 + agent3x_17_30 + agent3x_18_30 + agent3x_19_30
 + agent3x_1_30 + agent3x_20_30 + agent3x_21_30 + agent3x_22_30
 + agent3x_23_30 + agent3x_7_30 = 1
_C234: agent3x_30_11 = 1
_C235: agent2x_10_30 + agent2x_11_30 + agent2x_15_30 + agent2x_16_30
 + agent2x_17_30 + agent2x_21_30 + agent2x_22_30 + agent2x_23_30
 + agent2x_3_30 + agent2x_4_30 + agent2x_5_30 + agent2x_9_30 = 1
_C236: agent2x_30_5 = 1
_C237: agent1x_0_30 + agent1x_12_30 + agent1x_13_30 + agent1x_14_30
 + agent1x_15_30 + agent1x_19_30 + agent1x_1_30 + agent1x_20_30
 + agent1x_21_30 + agent1x_2_30 + agent1x_6_30 + agent1x_7_30 + agent1x_8_30
 = 1
_C238: agent1x_30_0 + agent1x_30_6 = 1
_C239: agent4phi_11 - 4 agent4w_11 <= 0
_C24: agent3x_17_23 + agent3x_17_30 - agent3y_17 = 0
_C240: - agent4t_11 + agent4y_11 <= 0
_C241: - agent4w_11 + agent4y_11 <= 0
_C242: agent4t_11 - 6 agent4y_11 <= 0
_C243: agent4w_11 - 6 agent4y_11 <= 0
_C244: agent4phi_12 - 4 agent4w_12 <= 0
_C245: - agent4t_12 + agent4y_12 <= 0
_C246: - agent4w_12 + agent4y_12 <= 0
_C247: agent4t_12 - 6 agent4y_12 <= 0
_C248: agent4w_12 - 6 agent4y_12 <= 0
_C249: agent4phi_13 - 4 agent4w_13 <= 0
_C25: agent3x_18_12 + agent3x_18_30 - agent3y_18 = 0
_C250: - agent4t_13 + agent4y_13 <= 0
_C251: - agent4w_13 + agent4y_13 <= 0
_C252: agent4t_13 - 6 agent4y_13 <= 0
_C253: agent4w_13 - 6 agent4y_13 <= 0
_C254: agent4phi_14 - 4 agent4w_14 <= 0
_C255: - agent4t_14 + agent4y_14 <= 0
_C256: - agent4w_14 + agent4y_14 <= 0
_C257: agent4t_14 - 6 agent4y_14 <= 0
_C258: agent4w_14 - 6 agent4y_14 <= 0
_C259: agent4phi_17 - 4 agent4w_17 <= 0
_C26: agent3x_19_18 + agent3x_19_30 - agent3y_19 = 0
_C260: - agent4t_17 + agent4y_17 <= 0
_C261: - agent4w_17 + agent4y_17 <= 0
_C262: agent4t_17 - 6 agent4y_17 <= 0
_C263: agent4w_17 - 6 agent4y_17 <= 0
_C264: agent4phi_18 - 4 agent4w_18 <= 0
_C265: - agent4t_18 + agent4y_18 <= 0
_C266: - agent4w_18 + agent4y_18 <= 0
_C267: agent4t_18 - 6 agent4y_18 <= 0
_C268: agent4w_18 - 6 agent4y_18 <= 0
_C269: agent4phi_21 - 4 agent4w_21 <= 0
_C27: agent3x_20_19 + agent3x_20_30 - agent3y_20 = 0
_C270: - agent4t_21 + agent4y_21 <= 0
_C271: - agent4w_21 + agent4y_21 <= 0
_C272: agent4t_21 - 6 agent4y_21 <= 0
_C273: agent4w_21 - 6 agent4y_21 <= 0
_C274: agent4phi_22 - 4 agent4w_22 <= 0
_C275: - agent4t_22 + agent4y_22 <= 0
_C276: - agent4w_22 + agent4y_22 <= 0
_C277: agent4t_22 - 6 agent4y_22 <= 0
_C278: agent4w_22 - 6 agent4y_22 <= 0
_C279: agent4phi_23 - 4 agent4w_23 <= 0
_C28: agent3x_21_20 + agent3x_21_30 - agent3y_21 = 0
_C280: - agent4t_23 + agent4y_23 <= 0
_C281: - agent4w_23 + agent4y_23 <= 0
_C282: agent4t_23 - 6 agent4y_23 <= 0
_C283: agent4w_23 - 6 agent4y_23 <= 0
_C284: agent4phi_24 - 4 agent4w_24 <= 0
_C285: - agent4t_24 + agent4y_24 <= 0
_C286: - agent4w_24 + agent4y_24 <= 0
_C287: agent4t_24 - 6 agent4y_24 <= 0
_C288: agent4w_24 - 6 agent4y_24 <= 0
_C289: agent4phi_25 - 4 agent4w_25 <= 0
_C29: agent3x_22_21 + agent3x_22_30 - agent3y_22 = 0
_C290: - agent4t_25 + agent4y_25 <= 0
_C291: - agent4w_25 + agent4y_25 <= 0
_C292: agent4t_25 - 6 agent4y_25 <= 0
_C293: agent4w_25 - 6 agent4y_25 <= 0
_C294: agent4phi_26 - 4 agent4w_26 <= 0
_C295: - agent4t_26 + agent4y_26 <= 0
_C296: - agent4w_26 + agent4y_26 <= 0
_C297: agent4t_26 - 6 agent4y_26 <= 0
_C298: agent4w_26 - 6 agent4y_26 <= 0
_C299: agent4phi_27 - 4 agent4w_27 <= 0
_C3: agent4x_13_14 + agent4x_13_30 - agent4y_13 = 0
_C30: agent3x_23_22 + agent3x_23_30 - agent3y_23 = 0
_C300: - agent4t_27 + agent4y_27 <= 0
_C301: - agent4w_27 + agent4y_27 <= 0
_C302: agent4t_27 - 6 agent4y_27 <= 0
_C303: agent4w_27 - 6 agent4y_27 <= 0
_C304: agent4phi_28 - 4 agent4w_28 <= 0
_C305: - agent4t_28 + agent4y_28 <= 0
_C306: - agent4w_28 + agent4y_28 <= 0
_C307: agent4t_28 - 6 agent4y_28 <= 0
_C308: agent4w_28 - 6 agent4y_28 <= 0
_C309: agent4phi_29 - 4 agent4w_29 <= 0
_C31: agent3y_30 = 1
_C310: - agent4t_29 + agent4y_29 <= 0
_C311: - agent4w_29 + agent4y_29 <= 0
_C312: agent4t_29 - 6 agent4y_29 <= 0
_C313: agent4w_29 - 6 agent4y_29 <= 0
_C314: agent3phi_1 - 4 agent3w_1 <= 0
_C315: - agent3t_1 + agent3y_1 <= 0
_C316: - agent3w_1 + agent3y_1 <= 0
_C317: agent3t_1 - 6 agent3y_1 <= 0
_C318: agent3w_1 - 6 agent3y_1 <= 0
_C319: agent3phi_7 - 4 agent3w_7 <= 0
_C32: agent2x_3_30 - agent2y_3 = 0
_C320: - agent3t_7 + agent3y_7 <= 0
_C321: - agent3w_7 + agent3y_7 <= 0
_C322: agent3t_7 - 6 agent3y_7 <= 0
_C323: agent3w_7 - 6 agent3y_7 <= 0
_C324: agent3phi_10 - 4 agent3w_10 <= 0
_C325: - agent3t_10 + agent3y_10 <= 0
_C326: - agent3w_10 + agent3y_10 <= 0
_C327: agent3t_10 - 6 agent3y_10 <= 0
_C328: agent3w_10 - 6 agent3y_10 <= 0
_C329: agent3phi_11 - 4 agent3w_11 <= 0
_C33: agent2x_4_3 + agent2x_4_30 - agent2y_4 = 0
_C330: - agent3t_11 + agent3y_11 <= 0
_C331: - agent3w_11 + agent3y_11 <= 0
_C332: agent3t_11 - 6 agent3y_11 <= 0
_C333: agent3w_11 - 6 agent3y_11 <= 0
_C334: agent3phi_12 - 4 agent3w_12 <= 0
_C335: - agent3t_12 + agent3y_12 <= 0
_C336: - agent3w_12 + agent3y_12 <= 0
_C337: agent3t_12 - 6 agent3y_12 <= 0
_C338: agent3w_12 - 6 agent3y_12 <= 0
_C339: agent3phi_13 - 4 agent3w_13 <= 0
_C34: agent2x_5_11 + agent2x_5_30 - agent2y_5 = 0
_C340: - agent3t_13 + agent3y_13 <= 0
_C341: - agent3w_13 + agent3y_13 <= 0
_C342: agent3t_13 - 6 agent3y_13 <= 0
_C343: agent3w_13 - 6 agent3y_13 <= 0
_C344: agent3phi_16 - 4 agent3w_16 <= 0
_C345: - agent3t_16 + agent3y_16 <= 0
_C346: - agent3w_16 + agent3y_16 <= 0
_C347: agent3t_16 - 6 agent3y_16 <= 0
_C348: agent3w_16 - 6 agent3y_16 <= 0
_C349: agent3phi_17 - 4 agent3w_17 <= 0
_C35: agent2x_9_15 + agent2x_9_30 - agent2y_9 = 0
_C350: - agent3t_17 + agent3y_17 <= 0
_C351: - agent3w_17 + agent3y_17 <= 0
_C352: agent3t_17 - 6 agent3y_17 <= 0
_C353: agent3w_17 - 6 agent3y_17 <= 0
_C354: agent3phi_18 - 4 agent3w_18 <= 0
_C355: - agent3t_18 + agent3y_18 <= 0
_C356: - agent3w_18 + agent3y_18 <= 0
_C357: agent3t_18 - 6 agent3y_18 <= 0
_C358: agent3w_18 - 6 agent3y_18 <= 0
_C359: agent3phi_19 - 4 agent3w_19 <= 0
_C36: agent2x_10_30 + agent2x_10_4 - agent2y_10 = 0
_C360: - agent3t_19 + agent3y_19 <= 0
_C361: - agent3w_19 + agent3y_19 <= 0
_C362: agent3t_19 - 6 agent3y_19 <= 0
_C363: agent3w_19 - 6 agent3y_19 <= 0
_C364: agent3phi_20 - 4 agent3w_20 <= 0
_C365: - agent3t_20 + agent3y_20 <= 0
_C366: - agent3w_20 + agent3y_20 <= 0
_C367: agent3t_20 - 6 agent3y_20 <= 0
_C368: agent3w_20 - 6 agent3y_20 <= 0
_C369: agent3phi_21 - 4 agent3w_21 <= 0
_C37: agent2x_11_17 + agent2x_11_30 - agent2y_11 = 0
_C370: - agent3t_21 + agent3y_21 <= 0
_C371: - agent3w_21 + agent3y_21 <= 0
_C372: agent3t_21 - 6 agent3y_21 <= 0
_C373: agent3w_21 - 6 agent3y_21 <= 0
_C374: agent3phi_22 - 4 agent3w_22 <= 0
_C375: - agent3t_22 + agent3y_22 <= 0
_C376: - agent3w_22 + agent3y_22 <= 0
_C377: agent3t_22 - 6 agent3y_22 <= 0
_C378: agent3w_22 - 6 agent3y_22 <= 0
_C379: agent3phi_23 - 4 agent3w_23 <= 0
_C38: agent2x_15_21 + agent2x_15_30 - agent2y_15 = 0
_C380: - agent3t_23 + agent3y_23 <= 0
_C381: - agent3w_23 + agent3y_23 <= 0
_C382: agent3t_23 - 6 agent3y_23 <= 0
_C383: agent3w_23 - 6 agent3y_23 <= 0
_C384: agent2phi_3 - agent2w_3 <= 0
_C385: - agent2t_3 + agent2y_3 <= 0
_C386: - agent2w_3 + agent2y_3 <= 0
_C387: agent2t_3 - 6 agent2y_3 <= 0
_C388: agent2w_3 - 6 agent2y_3 <= 0
_C389: agent2phi_4 - agent2w_4 <= 0
_C39: agent2x_16_10 + agent2x_16_15 + agent2x_16_30 - agent2y_16 = 0
_C390: - agent2t_4 + agent2y_4 <= 0
_C391: - agent2w_4 + agent2y_4 <= 0
_C392: agent2t_4 - 6 agent2y_4 <= 0
_C393: agent2w_4 - 6 agent2y_4 <= 0
_C394: agent2phi_5 - agent2w_5 <= 0
_C395: - agent2t_5 + agent2y_5 <= 0
_C396: - agent2w_5 + agent2y_5 <= 0
_C397: agent2t_5 - 6 agent2y_5 <= 0
_C398: agent2w_5 - 6 agent2y_5 <= 0
_C399: agent2phi_9 - agent2w_9 <= 0
_C4: agent4x_14_30 - agent4y_14 = 0
_C40: agent2x_17_16 + agent2x_17_30 - agent2y_17 = 0
_C400: - agent2t_9 + agent2y_9 <= 0
_C401: - agent2w_9 + agent2y_9 <= 0
_C402: agent2t_9 - 6 agent2y_9 <= 0
_C403: agent2w_9 - 6 agent2y_9 <= 0
_C404: agent2phi_10 - agent2w_10 <= 0
_C405: - agent2t_10 + agent2y_10 <= 0
_C406: - agent2w_10 + agent2y_10 <= 0
_C407: agent2t_10 - 6 agent2y_10 <= 0
_C408: agent2w_10 - 6 agent2y_10 <= 0
_C409: agent2phi_11 - agent2w_11 <= 0
_C41: agent2x_21_22 + agent2x_21_30 - agent2y_21 = 0
_C410: - agent2t_11 + agent2y_11 <= 0
_C411: - agent2w_11 + agent2y_11 <= 0
_C412: agent2t_11 - 6 agent2y_11 <= 0
_C413: agent2w_11 - 6 agent2y_11 <= 0
_C414: agent2phi_15 - agent2w_15 <= 0
_C415: - agent2t_15 + agent2y_15 <= 0
_C416: - agent2w_15 + agent2y_15 <= 0
_C417: agent2t_15 - 6 agent2y_15 <= 0
_C418: agent2w_15 - 6 agent2y_15 <= 0
_C419: agent2phi_16 - agent2w_16 <= 0
_C42: agent2x_22_23 + agent2x_22_30 - agent2y_22 = 0
_C420: - agent2t_16 + agent2y_16 <= 0
_C421: - agent2w_16 + agent2y_16 <= 0
_C422: agent2t_16 - 6 agent2y_16 <= 0
_C423: agent2w_16 - 6 agent2y_16 <= 0
_C424: agent2phi_17 - agent2w_17 <= 0
_C425: - agent2t_17 + agent2y_17 <= 0
_C426: - agent2w_17 + agent2y_17 <= 0
_C427: agent2t_17 - 6 agent2y_17 <= 0
_C428: agent2w_17 - 6 agent2y_17 <= 0
_C429: agent2phi_21 - agent2w_21 <= 0
_C43: agent2x_23_17 + agent2x_23_30 - agent2y_23 = 0
_C430: - agent2t_21 + agent2y_21 <= 0
_C431: - agent2w_21 + agent2y_21 <= 0
_C432: agent2t_21 - 6 agent2y_21 <= 0
_C433: agent2w_21 - 6 agent2y_21 <= 0
_C434: agent2phi_22 - agent2w_22 <= 0
_C435: - agent2t_22 + agent2y_22 <= 0
_C436: - agent2w_22 + agent2y_22 <= 0
_C437: agent2t_22 - 6 agent2y_22 <= 0
_C438: agent2w_22 - 6 agent2y_22 <= 0
_C439: agent2phi_23 - agent2w_23 <= 0
_C44: agent2y_30 = 1
_C440: - agent2t_23 + agent2y_23 <= 0
_C441: - agent2w_23 + agent2y_23 <= 0
_C442: agent2t_23 - 6 agent2y_23 <= 0
_C443: agent2w_23 - 6 agent2y_23 <= 0
_C444: agent1phi_0 - agent1w_0 <= 0
_C445: - agent1t_0 + agent1y_0 <= 0
_C446: - agent1w_0 + agent1y_0 <= 0
_C447: agent1t_0 - 6 agent1y_0 <= 0
_C448: agent1w_0 - 6 agent1y_0 <= 0
_C449: agent1phi_1 - agent1w_1 <= 0
_C45: agent1x_0_1 + agent1x_0_30 + agent1x_0_6 - agent1y_0 = 0
_C450: - agent1t_1 + agent1y_1 <= 0
_C451: - agent1w_1 + agent1y_1 <= 0
_C452: agent1t_1 - 6 agent1y_1 <= 0
_C453: agent1w_1 - 6 agent1y_1 <= 0
_C454: agent1phi_2 - agent1w_2 <= 0
_C455: - agent1t_2 + agent1y_2 <= 0
_C456: - agent1w_2 + agent1y_2 <= 0
_C457: agent1t_2 - 6 agent1y_2 <= 0
_C458: agent1w_2 - 6 agent1y_2 <= 0
_C459: agent1phi_6 - agent1w_6 <= 0
_C46: agent1x_1_30 + agent1x_1_7 - agent1y_1 = 0
_C460: - agent1t_6 + agent1y_6 <= 0
_C461: - agent1w_6 + agent1y_6 <= 0
_C462: agent1t_6 - 6 agent1y_6 <= 0
_C463: agent1w_6 - 6 agent1y_6 <= 0
_C464: agent1phi_7 - agent1w_7 <= 0
_C465: - agent1t_7 + agent1y_7 <= 0
_C466: - agent1w_7 + agent1y_7 <= 0
_C467: agent1t_7 - 6 agent1y_7 <= 0
_C468: agent1w_7 - 6 agent1y_7 <= 0
_C469: agent1phi_8 - agent1w_8 <= 0
_C47: agent1x_2_1 + agent1x_2_30 - agent1y_2 = 0
_C470: - agent1t_8 + agent1y_8 <= 0
_C471: - agent1w_8 + agent1y_8 <= 0
_C472: agent1t_8 - 6 agent1y_8 <= 0
_C473: agent1w_8 - 6 agent1y_8 <= 0
_C474: agent1phi_12 - agent1w_12 <= 0
_C475: - agent1t_12 + agent1y_12 <= 0
_C476: - agent1w_12 + agent1y_12 <= 0
_C477: agent1t_12 - 6 agent1y_12 <= 0
_C478: agent1w_12 - 6 agent1y_12 <= 0
_C479: agent1phi_13 - agent1w_13 <= 0
_C48: agent1x_6_12 + agent1x_6_30 - agent1y_6 = 0
_C480: - agent1t_13 + agent1y_13 <= 0
_C481: - agent1w_13 + agent1y_13 <= 0
_C482: agent1t_13 - 6 agent1y_13 <= 0
_C483: agent1w_13 - 6 agent1y_13 <= 0
_C484: agent1phi_14 - agent1w_14 <= 0
_C485: - agent1t_14 + agent1y_14 <= 0
_C486: - agent1w_14 + agent1y_14 <= 0
_C487: agent1t_14 - 6 agent1y_14 <= 0
_C488: agent1w_14 - 6 agent1y_14 <= 0
_C489: agent1phi_15 - agent1w_15 <= 0
_C49: agent1x_7_13 + agent1x_7_30 - agent1y_7 = 0
_C490: - agent1t_15 + agent1y_15 <= 0
_C491: - agent1w_15 + agent1y_15 <= 0
_C492: agent1t_15 - 6 agent1y_15 <= 0
_C493: agent1w_15 - 6 agent1y_15 <= 0
_C494: agent1phi_19 - agent1w_19 <= 0
_C495: - agent1t_19 + agent1y_19 <= 0
_C496: - agent1w_19 + agent1y_19 <= 0
_C497: agent1t_19 - 6 agent1y_19 <= 0
_C498: agent1w_19 - 6 agent1y_19 <= 0
_C499: agent1phi_20 - agent1w_20 <= 0
_C5: agent4x_17_23 + agent4x_17_30 - agent4y_17 = 0
_C50: agent1x_8_2 + agent1x_8_30 - agent1y_8 = 0
_C500: - agent1t_20 + agent1y_20 <= 0
_C501: - agent1w_20 + agent1y_20 <= 0
_C502: agent1t_20 - 6 agent1y_20 <= 0
_C503: agent1w_20 - 6 agent1y_20 <= 0
_C504: agent1phi_21 - agent1w_21 <= 0
_C505: - agent1t_21 + agent1y_21 <= 0
_C506: - agent1w_21 + agent1y_21 <= 0
_C507: agent1t_21 - 6 agent1y_21 <= 0
_C508: agent1w_21 - 6 agent1y_21 <= 0
_C509: agent4phi_0 <= 1
_C51: agent1x_12_13 + agent1x_12_30 - agent1y_12 = 0
_C510: agent4phi_0 >= 0
_C511: agent4phi_1 <= 1
_C512: agent4phi_1 >= 0
_C513: agent4phi_2 <= 1
_C514: agent4phi_2 >= 0
_C515: agent4phi_3 <= 1
_C516: agent4phi_3 >= 0
_C517: agent4phi_4 <= 1
_C518: agent4phi_4 >= 0
_C519: agent4phi_5 <= 1
_C52: agent1x_13_19 + agent1x_13_30 - agent1y_13 = 0
_C520: agent4phi_5 >= 0
_C521: agent4phi_6 <= 1
_C522: agent4phi_6 >= 0
_C523: agent4phi_7 <= 1
_C524: agent4phi_7 >= 0
_C525: agent4phi_8 <= 1
_C526: agent4phi_8 >= 0
_C527: agent4phi_9 <= 1
_C528: agent4phi_9 >= 0
_C529: agent4phi_10 <= 1
_C53: agent1x_14_30 + agent1x_14_8 - agent1y_14 = 0
_C530: agent4phi_10 >= 0
_C531: agent4phi_11 <= 1
_C532: agent4phi_11 >= 0
_C533: agent4phi_12 <= 1
_C534: agent4phi_12 >= 0
_C535: agent4phi_13 <= 1
_C536: agent4phi_13 >= 0
_C537: agent4phi_14 <= 1
_C538: agent4phi_14 >= 0
_C539: agent4phi_15 <= 1
_C54: agent1x_15_14 + agent1x_15_30 - agent1y_15 = 0
_C540: agent4phi_15 >= 0
_C541: agent4phi_16 <= 1
_C542: agent4phi_16 >= 0
_C543: agent4phi_17 <= 1
_C544: agent4phi_17 >= 0
_C545: agent4phi_18 <= 1
_C546: agent4phi_18 >= 0
_C547: agent4phi_19 <= 1
_C548: agent4phi_19 >= 0
_C549: agent4phi_20 <= 1
_C55: agent1x_19_20 + agent1x_19_30 - agent1y_19 = 0
_C550: agent4phi_20 >= 0
_C551: agent4phi_21 <= 1
_C552: agent4phi_21 >= 0
_C553: agent4phi_22 <= 1
_C554: agent4phi_22 >= 0
_C555: agent4phi_23 <= 1
_C556: agent4phi_23 >= 0
_C557: agent4phi_24 <= 1
_C558: agent4phi_24 >= 0
_C559: agent4phi_25 <= 1
_C56: agent1x_20_21 + agent1x_20_30 - agent1y_20 = 0
_C560: agent4phi_25 >= 0
_C561: agent4phi_26 <= 1
_C562: agent4phi_26 >= 0
_C563: agent4phi_27 <= 1
_C564: agent4phi_27 >= 0
_C565: agent4phi_28 <= 1
_C566: agent4phi_28 >= 0
_C567: agent4phi_29 <= 1
_C568: agent4phi_29 >= 0
_C569: agent3phi_0 <= 1
_C57: agent1x_21_15 + agent1x_21_30 - agent1y_21 = 0
_C570: agent3phi_0 >= 0
_C571: agent3phi_1 <= 1
_C572: agent3phi_1 >= 0
_C573: agent3phi_2 <= 1
_C574: agent3phi_2 >= 0
_C575: agent3phi_3 <= 1
_C576: agent3phi_3 >= 0
_C577: agent3phi_4 <= 1
_C578: agent3phi_4 >= 0
_C579: agent3phi_5 <= 1
_C58: agent1y_30 = 1
_C580: agent3phi_5 >= 0
_C581: agent3phi_6 <= 1
_C582: agent3phi_6 >= 0
_C583: agent3phi_7 <= 1
_C584: agent3phi_7 >= 0
_C585: agent3phi_8 <= 1
_C586: agent3phi_8 >= 0
_C587: agent3phi_9 <= 1
_C588: agent3phi_9 >= 0
_C589: agent3phi_10 <= 1
_C59: agent4x_30_11 - agent4y_11 = 0
_C590: agent3phi_10 >= 0
_C591: agent3phi_11 <= 1
_C592: agent3phi_11 >= 0
_C593: agent3phi_12 <= 1
_C594: agent3phi_12 >= 0
_C595: agent3phi_13 <= 1
_C596: agent3phi_13 >= 0
_C597: agent3phi_14 <= 1
_C598: agent3phi_14 >= 0
_C599: agent3phi_15 <= 1
_C6: agent4x_18_12 + agent4x_18_30 - agent4y_18 = 0
_C60: agent4x_18_12 - agent4y_12 = 0
_C600: agent3phi_15 >= 0
_C601: agent3phi_16 <= 1
_C602: agent3phi_16 >= 0
_C603: agent3phi_17 <= 1
_C604: agent3phi_17 >= 0
_C605: agent3phi_18 <= 1
_C606: agent3phi_18 >= 0
_C607: agent3phi_19 <= 1
_C608: agent3phi_19 >= 0
_C609: agent3phi_20 <= 1
_C61: agent4x_12_13 - agent4y_13 = 0
_C610: agent3phi_20 >= 0
_C611: agent3phi_21 <= 1
_C612: agent3phi_21 >= 0
_C613: agent3phi_22 <= 1
_C614: agent3phi_22 >= 0
_C615: agent3phi_23 <= 1
_C616: agent3phi_23 >= 0
_C617: agent3phi_24 <= 1
_C618: agent3phi_24 >= 0
_C619: agent3phi_25 <= 1
_C62: agent4x_13_14 - agent4y_14 = 0
_C620: agent3phi_25 >= 0
_C621: agent3phi_26 <= 1
_C622: agent3phi_26 >= 0
_C623: agent3phi_27 <= 1
_C624: agent3phi_27 >= 0
_C625: agent3phi_28 <= 1
_C626: agent3phi_28 >= 0
_C627: agent3phi_29 <= 1
_C628: agent3phi_29 >= 0
_C629: agent2phi_0 <= 1
_C63: agent4x_11_17 + agent4x_30_17 - agent4y_17 = 0
_C630: agent2phi_0 >= 0
_C631: agent2phi_1 <= 1
_C632: agent2phi_1 >= 0
_C633: agent2phi_2 <= 1
_C634: agent2phi_2 >= 0
_C635: agent2phi_3 <= 1
_C636: agent2phi_3 >= 0
_C637: agent2phi_4 <= 1
_C638: agent2phi_4 >= 0
_C639: agent2phi_5 <= 1
_C64: agent4x_24_18 - agent4y_18 = 0
_C640: agent2phi_5 >= 0
_C641: agent2phi_6 <= 1
_C642: agent2phi_6 >= 0
_C643: agent2phi_7 <= 1
_C644: agent2phi_7 >= 0
_C645: agent2phi_8 <= 1
_C646: agent2phi_8 >= 0
_C647: agent2phi_9 <= 1
_C648: agent2phi_9 >= 0
_C649: agent2phi_10 <= 1
_C65: agent4x_22_21 - agent4y_21 = 0
_C650: agent2phi_10 >= 0
_C651: agent2phi_11 <= 1
_C652: agent2phi_11 >= 0
_C653: agent2phi_12 <= 1
_C654: agent2phi_12 >= 0
_C655: agent2phi_13 <= 1
_C656: agent2phi_13 >= 0
_C657: agent2phi_14 <= 1
_C658: agent2phi_14 >= 0
_C659: agent2phi_15 <= 1
_C66: agent4x_28_22 - agent4y_22 = 0
_C660: agent2phi_15 >= 0
_C661: agent2phi_16 <= 1
_C662: agent2phi_16 >= 0
_C663: agent2phi_17 <= 1
_C664: agent2phi_17 >= 0
_C665: agent2phi_18 <= 1
_C666: agent2phi_18 >= 0
_C667: agent2phi_19 <= 1
_C668: agent2phi_19 >= 0
_C669: agent2phi_20 <= 1
_C67: agent4x_17_23 - agent4y_23 = 0
_C670: agent2phi_20 >= 0
_C671: agent2phi_21 <= 1
_C672: agent2phi_21 >= 0
_C673: agent2phi_22 <= 1
_C674: agent2phi_22 >= 0
_C675: agent2phi_23 <= 1
_C676: agent2phi_23 >= 0
_C677: agent2phi_24 <= 1
_C678: agent2phi_24 >= 0
_C679: agent2phi_25 <= 1
_C68: agent4x_25_24 - agent4y_24 = 0
_C680: agent2phi_25 >= 0
_C681: agent2phi_26 <= 1
_C682: agent2phi_26 >= 0
_C683: agent2phi_27 <= 1
_C684: agent2phi_27 >= 0
_C685: agent2phi_28 <= 1
_C686: agent2phi_28 >= 0
_C687: agent2phi_29 <= 1
_C688: agent2phi_29 >= 0
_C689: agent1phi_0 <= 1
_C69: agent4x_26_25 - agent4y_25 = 0
_C690: agent1phi_0 >= 0
_C691: agent1phi_1 <= 1
_C692: agent1phi_1 >= 0
_C693: agent1phi_2 <= 1
_C694: agent1phi_2 >= 0
_C695: agent1phi_3 <= 1
_C696: agent1phi_3 >= 0
_C697: agent1phi_4 <= 1
_C698: agent1phi_4 >= 0
_C699: agent1phi_5 <= 1
_C7: agent4x_21_27 + agent4x_21_30 - agent4y_21 = 0
_C70: agent4x_27_26 - agent4y_26 = 0
_C700: agent1phi_5 >= 0
_C701: agent1phi_6 <= 1
_C702: agent1phi_6 >= 0
_C703: agent1phi_7 <= 1
_C704: agent1phi_7 >= 0
_C705: agent1phi_8 <= 1
_C706: agent1phi_8 >= 0
_C707: agent1phi_9 <= 1
_C708: agent1phi_9 >= 0
_C709: agent1phi_10 <= 1
_C71: agent4x_21_27 - agent4y_27 = 0
_C710: agent1phi_10 >= 0
_C711: agent1phi_11 <= 1
_C712: agent1phi_11 >= 0
_C713: agent1phi_12 <= 1
_C714: agent1phi_12 >= 0
_C715: agent1phi_13 <= 1
_C716: agent1phi_13 >= 0
_C717: agent1phi_14 <= 1
_C718: agent1phi_14 >= 0
_C719: agent1phi_15 <= 1
_C72: agent4x_29_28 - agent4y_28 = 0
_C720: agent1phi_15 >= 0
_C721: agent1phi_16 <= 1
_C722: agent1phi_16 >= 0
_C723: agent1phi_17 <= 1
_C724: agent1phi_17 >= 0
_C725: agent1phi_18 <= 1
_C726: agent1phi_18 >= 0
_C727: agent1phi_19 <= 1
_C728: agent1phi_19 >= 0
_C729: agent1phi_20 <= 1
_C73: agent4x_23_29 - agent4y_29 = 0
_C730: agent1phi_20 >= 0
_C731: agent1phi_21 <= 1
_C732: agent1phi_21 >= 0
_C733: agent1phi_22 <= 1
_C734: agent1phi_22 >= 0
_C735: agent1phi_23 <= 1
_C736: agent1phi_23 >= 0
_C737: agent1phi_24 <= 1
_C738: agent1phi_24 >= 0
_C739: agent1phi_25 <= 1
_C74: agent3x_7_1 - agent3y_1 = 0
_C740: agent1phi_25 >= 0
_C741: agent1phi_26 <= 1
_C742: agent1phi_26 >= 0
_C743: agent1phi_27 <= 1
_C744: agent1phi_27 >= 0
_C745: agent1phi_28 <= 1
_C746: agent1phi_28 >= 0
_C747: agent1phi_29 <= 1
_C748: agent1phi_29 >= 0
_C75: agent3x_13_7 - agent3y_7 = 0
_C76: agent3x_11_10 - agent3y_10 = 0
_C77: agent3x_30_11 - agent3y_11 = 0
_C78: agent3x_18_12 - agent3y_12 = 0
_C79: agent3x_12_13 - agent3y_13 = 0
_C8: agent4x_22_21 + agent4x_22_30 - agent4y_22 = 0
_C80: agent3x_10_16 - agent3y_16 = 0
_C81: agent3x_11_17 + agent3x_16_17 - agent3y_17 = 0
_C82: agent3x_19_18 - agent3y_18 = 0
_C83: agent3x_20_19 - agent3y_19 = 0
_C84: agent3x_21_20 - agent3y_20 = 0
_C85: agent3x_22_21 - agent3y_21 = 0
_C86: agent3x_23_22 - agent3y_22 = 0
_C87: agent3x_17_23 - agent3y_23 = 0
_C88: agent2x_4_3 - agent2y_3 = 0
_C89: agent2x_10_4 - agent2y_4 = 0
_C9: agent4x_23_29 + agent4x_23_30 - agent4y_23 = 0
_C90: agent2x_30_5 - agent2y_5 = 0
_C91: - agent2y_9 = 0
_C92: agent2x_16_10 - agent2y_10 = 0
_C93: agent2x_5_11 - agent2y_11 = 0
_C94: agent2x_16_15 + agent2x_9_15 - agent2y_15 = 0
_C95: agent2x_17_16 - agent2y_16 = 0
_C96: agent2x_11_17 + agent2x_23_17 - agent2y_17 = 0
_C97: agent2x_15_21 - agent2y_21 = 0
_C98: agent2x_21_22 - agent2y_22 = 0
_C99: agent2x_22_23 - agent2y_23 = 0
Bounds
agent1phi_0 free
agent1phi_1 free
agent1phi_10 free
agent1phi_11 free
agent1phi_12 free
agent1phi_13 free
agent1phi_14 free
agent1phi_15 free
agent1phi_16 free
agent1phi_17 free
agent1phi_18 free
agent1phi_19 free
agent1phi_2 free
agent1phi_20 free
agent1phi_21 free
agent1phi_22 free
agent1phi_23 free
agent1phi_24 free
agent1phi_25 free
agent1phi_26 free
agent1phi_27 free
agent1phi_28 free
agent1phi_29 free
agent1phi_3 free
agent1phi_4 free
agent1phi_5 free
agent1phi_6 free
agent1phi_7 free
agent1phi_8 free
agent1phi_9 free
agent1t_0 free
agent1t_1 free
agent1t_12 free
agent1t_13 free
agent1t_14 free
agent1t_15 free
agent1t_19 free
agent1t_2 free
agent1t_20 free
agent1t_21 free
agent1t_30 free
agent1t_6 free
agent1t_7 free
agent1t_8 free
agent1w_0 free
agent1w_1 free
agent1w_10 free
agent1w_11 free
agent1w_12 free
agent1w_13 free
agent1w_14 free
agent1w_15 free
agent1w_16 free
agent1w_17 free
agent1w_18 free
agent1w_19 free
agent1w_2 free
agent1w_20 free
agent1w_21 free
agent1w_22 free
agent1w_23 free
agent1w_24 free
agent1w_25 free
agent1w_26 free
agent1w_27 free
agent1w_28 free
agent1w_29 free
agent1w_3 free
agent1w_30 free
agent1w_4 free
agent1w_5 free
agent1w_6 free
agent1w_7 free
agent1w_8 free
agent1w_9 free
agent2phi_0 free
agent2phi_1 free
agent2phi_10 free
agent2phi_11 free
agent2phi_12 free
agent2phi_13 free
agent2phi_14 free
agent2phi_15 free
agent2phi_16 free
agent2phi_17 free
agent2phi_18 free
agent2phi_19 free
agent2phi_2 free
agent2phi_20 free
agent2phi_21 free
agent2phi_22 free
agent2phi_23 free
agent2phi_24 free
agent2phi_25 free
agent2phi_26 free
agent2phi_27 free
agent2phi_28 free
agent2phi_29 free
agent2phi_3 free
agent2phi_4 free
agent2phi_5 free
agent2phi_6 free
agent2phi_7 free
agent2phi_8 free
agent2phi_9 free
agent2t_10 free
agent2t_11 free
agent2t_15 free
agent2t_16 free
agent2t_17 free
agent2t_21 free
agent2t_22 free
agent2t_23 free
agent2t_3 free
agent2t_30 free
agent2t_4 free
agent2t_5 free
agent2t_9 free
agent2w_0 free
agent2w_1 free
agent2w_10 free
agent2w_11 free
agent2w_12 free
agent2w_13 free
agent2w_14 free
agent2w_15 free
agent2w_16 free
agent2w_17 free
agent2w_18 free
agent2w_19 free
agent2w_2 free
agent2w_20 free
agent2w_21 free
agent2w_22 free
agent2w_23 free
agent2w_24 free
agent2w_25 free
agent2w_26 free
agent2w_27 free
agent2w_28 free
agent2w_29 free
agent2w_3 free
agent2w_30 free
agent2w_4 free
agent2w_5 free
agent2w_6 free
agent2w_7 free
agent2w_8 free
agent2w_9 free
agent3phi_0 free
agent3phi_1 free
agent3phi_10 free
agent3phi_11 free
agent3phi_12 free
agent3phi_13 free
agent3phi_14 free
agent3phi_15 free
agent3phi_16 free
agent3phi_17 free
agent3phi_18 free
agent3phi_19 free
agent3phi_2 free
agent3phi_20 free
agent3phi_21 free
agent3phi_22 free
agent3phi_23 free
agent3phi_24 free
agent3phi_25 free
agent3phi_26 free
agent3phi_27 free
agent3phi_28 free
agent3phi_29 free
agent3phi_3 free
agent3phi_4 free
agent3phi_5 free
agent3phi_6 free
agent3phi_7 free
agent3phi_8 free
agent3phi_9 free
agent3t_1 free
agent3t_10 free
agent3t_11 free
agent3t_12 free
agent3t_13 free
agent3t_16 free
agent3t_17 free
agent3t_18 free
agent3t_19 free
agent3t_20 free
agent3t_21 free
agent3t_22 free
agent3t_23 free
agent3t_30 free
agent3t_7 free
agent3w_0 free
agent3w_1 free
agent3w_10 free
agent3w_11 free
agent3w_12 free
agent3w_13 free
agent3w_14 free
agent3w_15 free
agent3w_16 free
agent3w_17 free
agent3w_18 free
agent3w_19 free
agent3w_2 free
agent3w_20 free
agent3w_21 free
agent3w_22 free
agent3w_23 free
agent3w_24 free
agent3w_25 free
agent3w_26 free
agent3w_27 free
agent3w_28 free
agent3w_29 free
agent3w_3 free
agent3w_30 free
agent3w_4 free
agent3w_5 free
agent3w_6 free
agent3w_7 free
agent3w_8 free
agent3w_9 free
agent4phi_0 free
agent4phi_1 free
agent4phi_10 free
agent4phi_11 free
agent4phi_12 free
agent4phi_13 free
agent4phi_14 free
agent4phi_15 free
agent4phi_16 free
agent4phi_17 free
agent4phi_18 free
agent4phi_19 free
agent4phi_2 free
agent4phi_20 free
agent4phi_21 free
agent4phi_22 free
agent4phi_23 free
agent4phi_24 free
agent4phi_25 free
agent4phi_26 free
agent4phi_27 free
agent4phi_28 free
agent4phi_29 free
agent4phi_3 free
agent4phi_4 free
agent4phi_5 free
agent4phi_6 free
agent4phi_7 free
agent4phi_8 free
agent4phi_9 free
agent4t_11 free
agent4t_12 free
agent4t_13 free
agent4t_14 free
agent4t_17 free
agent4t_18 free
agent4t_21 free
agent4t_22 free
agent4t_23 free
agent4t_24 free
agent4t_25 free
agent4t_26 free
agent4t_27 free
agent4t_28 free
agent4t_29 free
agent4t_30 free
agent4w_0 free
agent4w_1 free
agent4w_10 free
agent4w_11 free
agent4w_12 free
agent4w_13 free
agent4w_14 free
agent4w_15 free
agent4w_16 free
agent4w_17 free
agent4w_18 free
agent4w_19 free
agent4w_2 free
agent4w_20 free
agent4w_21 free
agent4w_22 free
agent4w_23 free
agent4w_24 free
agent4w_25 free
agent4w_26 free
agent4w_27 free
agent4w_28 free
agent4w_29 free
agent4w_3 free
agent4w_30 free
agent4w_4 free
agent4w_5 free
agent4w_6 free
agent4w_7 free
agent4w_8 free
agent4w_9 free
Generals
agent1t_0
agent1t_1
agent1t_12
agent1t_13
agent1t_14
agent1t_15
agent1t_19
agent1t_2
agent1t_20
agent1t_21
agent1t_30
agent1t_6
agent1t_7
agent1t_8
agent1w_0
agent1w_1
agent1w_10
agent1w_11
agent1w_12
agent1w_13
agent1w_14
agent1w_15
agent1w_16
agent1w_17
agent1w_18
agent1w_19
agent1w_2
agent1w_20
agent1w_21
agent1w_22
agent1w_23
agent1w_24
agent1w_25
agent1w_26
agent1w_27
agent1w_28
agent1w_29
agent1w_3
agent1w_30
agent1w_4
agent1w_5
agent1w_6
agent1w_7
agent1w_8
agent1w_9
agent2t_10
agent2t_11
agent2t_15
agent2t_16
agent2t_17
agent2t_21
agent2t_22
agent2t_23
agent2t_3
agent2t_30
agent2t_4
agent2t_5
agent2t_9
agent2w_0
agent2w_1
agent2w_10
agent2w_11
agent2w_12
agent2w_13
agent2w_14
agent2w_15
agent2w_16
agent2w_17
agent2w_18
agent2w_19
agent2w_2
agent2w_20
agent2w_21
agent2w_22
agent2w_23
agent2w_24
agent2w_25
agent2w_26
agent2w_27
agent2w_28
agent2w_29
agent2w_3
agent2w_30
agent2w_4
agent2w_5
agent2w_6
agent2w_7
agent2w_8
agent2w_9
agent3t_1
agent3t_10
agent3t_11
agent3t_12
agent3t_13
agent3t_16
agent3t_17
agent3t_18
agent3t_19
agent3t_20
agent3t_21
agent3t_22
agent3t_23
agent3t_30
agent3t_7
agent3w_0
agent3w_1
agent3w_10
agent3w_11
agent3w_12
agent3w_13
agent3w_14
agent3w_15
agent3w_16
agent3w_17
agent3w_18
agent3w_19
agent3w_2
agent3w_20
agent3w_21
agent3w_22
agent3w_23
agent3w_24
agent3w_25
agent3w_26
agent3w_27
agent3w_28
agent3w_29
agent3w_3
agent3w_30
agent3w_4
agent3w_5
agent3w_6
agent3w_7
agent3w_8
agent3w_9
agent4t_11
agent4t_12
agent4t_13
agent4t_14
agent4t_17
agent4t_18
agent4t_21
agent4t_22
agent4t_23
agent4t_24
agent4t_25
agent4t_26
agent4t_27
agent4t_28
agent4t_29
agent4t_30
agent4w_0
agent4w_1
agent4w_10
agent4w_11
agent4w_12
agent4w_13
agent4w_14
agent4w_15
agent4w_16
agent4w_17
agent4w_18
agent4w_19
agent4w_2
agent4w_20
agent4w_21
agent4w_22
agent4w_23
agent4w_24
agent4w_25
agent4w_26
agent4w_27
agent4w_28
agent4w_29
agent4w_3
agent4w_30
agent4w_4
agent4w_5
agent4w_6
agent4w_7
agent4w_8
agent4w_9
Binaries
agent1x_0_1
agent1x_0_30
agent1x_0_6
agent1x_12_13
agent1x_12_30
agent1x_13_19
agent1x_13_30
agent1x_14_30
agent1x_14_8
agent1x_15_14
agent1x_15_30
agent1x_19_20
agent1x_19_30
agent1x_1_30
agent1x_1_7
agent1x_20_21
agent1x_20_30
agent1x_21_15
agent1x_21_30
agent1x_2_1
agent1x_2_30
agent1x_30_0
agent1x_30_6
agent1x_6_12
agent1x_6_30
agent1x_7_13
agent1x_7_30
agent1x_8_2
agent1x_8_30
agent1y_0
agent1y_1
agent1y_12
agent1y_13
agent1y_14
agent1y_15
agent1y_19
agent1y_2
agent1y_20
agent1y_21
agent1y_30
agent1y_6
agent1y_7
agent1y_8
agent2x_10_30
agent2x_10_4
agent2x_11_17
agent2x_11_30
agent2x_15_21
agent2x_15_30
agent2x_16_10
agent2x_16_15
agent2x_16_30
agent2x_17_16
agent2x_17_30
agent2x_21_22
agent2x_21_30
agent2x_22_23
agent2x_22_30
agent2x_23_17
agent2x_23_30
agent2x_30_5
agent2x_3_30
agent2x_4_3
agent2x_4_30
agent2x_5_11
agent2x_5_30
agent2x_9_15
agent2x_9_30
agent2y_10
agent2y_11
agent2y_15
agent2y_16
agent2y_17
agent2y_21
agent2y_22
agent2y_23
agent2y_3
agent2y_30
agent2y_4
agent2y_5
agent2y_9
agent3x_10_16
agent3x_10_30
agent3x_11_10
agent3x_11_17
agent3x_11_30
agent3x_12_13
agent3x_12_30
agent3x_13_30
agent3x_13_7
agent3x_16_17
agent3x_16_30
agent3x_17_23
agent3x_17_30
agent3x_18_12
agent3x_18_30
agent3x_19_18
agent3x_19_30
agent3x_1_30
agent3x_20_19
agent3x_20_30
agent3x_21_20
agent3x_21_30
agent3x_22_21
agent3x_22_30
agent3x_23_22
agent3x_23_30
agent3x_30_11
agent3x_7_1
agent3x_7_30
agent3y_1
agent3y_10
agent3y_11
agent3y_12
agent3y_13
agent3y_16
agent3y_17
agent3y_18
agent3y_19
agent3y_20
agent3y_21
agent3y_22
agent3y_23
agent3y_30
agent3y_7
agent4x_11_17
agent4x_11_30
agent4x_12_13
agent4x_12_30
agent4x_13_14
agent4x_13_30
agent4x_14_30
agent4x_17_23
agent4x_17_30
agent4x_18_12
agent4x_18_30
agent4x_21_27
agent4x_21_30
agent4x_22_21
agent4x_22_30
agent4x_23_29
agent4x_23_30
agent4x_24_18
agent4x_24_30
agent4x_25_24
agent4x_25_30
agent4x_26_25
agent4x_26_30
agent4x_27_26
agent4x_27_30
agent4x_28_22
agent4x_28_30
agent4x_29_28
agent4x_29_30
agent4x_30_11
agent4x_30_17
agent4y_11
agent4y_12
agent4y_13
agent4y_14
agent4y_17
agent4y_18
agent4y_21
agent4y_22
agent4y_23
agent4y_24
agent4y_25
agent4y_26
agent4y_27
agent4y_28
agent4y_29
agent4y_30
End
