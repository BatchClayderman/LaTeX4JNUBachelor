import os
from matplotlib import pyplot as plt
from matplotlib.font_manager import FontProperties
os.chdir(os.path.abspath(os.path.dirname(__file__)))#解析进入程序所在目录
font = FontProperties(fname = "C:\\Windows\\fonts\\simsun.ttc")

x = [2011 + i for i in range(12)]
y1 = [1.14, 2.66, 3.79, 4.93, 5.23, 6.28, 6.96, 10.6, 14.2, 19.2, 19.2 * (1 + 0.17), 19.2 * (1 + 0.17) * (1 + 0.38)]
y1 = [item * 10 ** 8 for item in y1]

KL = [1.5, 1.8, 2.4, 2.8, 3.2, 3.3, 3.7, 3.2, 4.2, 6.4]
Sym = [2.1, 2.4, 3.3, 3.9, 4.2, 4.2, 4.7, 5.6, 6.4, 6.4]
McA = [2.1, 2.8, 3.2, 3.8, 4.3, 4.7, 5.3, 6.0, 6.8, 8.2]
y2 = [KL[i] + Sym[i] + McA[i] for i in range(len(KL))]
y2.append(y2[-1] * (1 + 0.17))
y2.append(y2[-1] * (1 + 0.38))
y2 = [item * 10 ** 8 for item in y2]

plt.plot(x, y1, color = "orange", marker = "x")
plt.plot(x, y2, color = "blue", marker = "o")
plt.legend(["全球恶意软件攻击事件", "全球计算机攻击事件"], prop = font) # plt.legend(["Malware", "Total"])
plt.xlabel("年份", fontproperties = font) # plt.xlabel("Year")
plt.ylabel("次数（保守计算值）", fontproperties = font) # plt.ylabel("Frequency")
plt.rcParams["figure.dpi"] = 1200
plt.rcParams["savefig.dpi"] = 1200
plt.savefig("trend.png")
plt.close()