import sys,os,glob

for file in glob.glob("./*py"):
    lines = open(file, "r").readlines()
    for i in range(len(lines)):
        lines[i] = lines[i].replace("\r","")
    wfile = open(file, "w")
    wfile.write("".join(lines))
    wfile.close()