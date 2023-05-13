import os
from re import findall
from msvcrt import getch
os.chdir(os.path.abspath(os.path.dirname(__file__)))#解析进入程序所在目录
EXIT_SUCCESS = 0
EXIT_FAILURE = 1
filepath = "LaTeX/jnuthesis.tex"


def checkRef(lines, distance = 50) -> None:
	cites = []
	for line in lines:
		if "\\bibitem" in line:
			cites.append(line[line.index(" ") + 1:-1])
	cites.sort()
	if len(cites) > 1:
		for i in range(len(cites) - 1):
			if cites[i][:distance if distance > 1 else int(len(cites[i]) * distance)] == cites[i + 1][:distance if distance > 1 else int(len(cites[i + 1]) * distance)]:
				print(cites[i], cites[i + 1], sep = "\n", end = "\n\n")
				getch()
	for i in range(len(cites)):
		print("[{0}] {1}".format(i + 1, cites[i]))
	getch()

def checkLabel(lines) -> None:
	refs = []
	labels = []
	for line in lines:
		if "\\label" in line:
			label = findall("\\\\label\\{.*?\\}", line)
			labels += [l[7:-1] for l in label]
		if "\\ref" in line:
			ref = findall("\\\\ref\\{.*?\\}", line)
			refs += [r[5:-1] for r in ref]
	refs.sort()
	labels.sort()
	if len(labels) > 1:
		for i in range(len(labels) - 1):
			if labels[i] == labels[i + 1]:
				print("Repeated label:", labels[i])
	for ref in refs:
		if ref not in labels:
			print("Undefined ref:", ref)
	print(refs)
	print(labels)
	getch()

def checkCites(lines) -> None:
	refs = []
	labels = []
	for line in lines:
		if "\\bibitem" in line:
			label = findall("\\\\bibitem\\{.*?\\}", line)
			labels += [l[9:-1] for l in label]
		if "\\cite" in line:
			ref = findall("\\\\cite\\{.*?\\}", line)
			for r in ref:
				refs += r[6:-1].replace(" ", "").split(",")
		if "\\upcite" in line:
			ref = findall("\\\\upcite\\{.*?\\}", line)
			for r in ref:
				refs += r[8:-1].replace(" ", "").split(",")
		if "\\upupcite" in line:
			ref = findall("\\\\upupcite\\{.*?\\}", line)
			for r in ref:
				refs += r[10:-1].replace(" ", "").split(",")
	while "#1" in refs:
		refs.remove("#1")
	#refs.sort()
	#labels.sort()
	if len(labels) > 1:
		for i in range(len(labels) - 1):
			if labels[i] == labels[i + 1]:
				print("Repeated label:", labels[i])
	for ref in refs:
		if ref not in labels:
			print("Undefined ref:", ref)
	print(refs)
	print(labels)
	getch()

def main() -> int:
	try:
		with open(filepath, "r", encoding = "utf-8") as f:
			lines = f.readlines()
	except Exception as e:
		print(e)
		getch()
		return EXIT_FAILURE
	checkRef(lines)
	print()
	checkLabel(lines)
	print()
	checkCites(lines)
	return EXIT_SUCCESS



if __name__ == "__main__":
	exit(main())