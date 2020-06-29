import sys
import re
if len(sys.argv) < 1 :
    print 'usage: python %s <file' % sys.argv[0]
    sys.exit(0)

fname= sys.argv[1]+".dat"
fp = open(sys.argv[1], 'r')
fout=open(fname, 'w')

#except IOError:
#	print "can not open file"

s = fp.readline()
while s:
        if s=="Heat3d\n":
		s=fp.readline();
        s1=s
        aList = re.findall('([-+]?\d+(\.\d*)?|\.\d+)([eE][-+]?\d+)?',s1)
#        print aList
        for ss in aList:
                aNum = float((ss[0]+ss[2]))
    #           print(aNum)
                str1=str("%e" % aNum)
                fout.write(str1)
        	fout.write(" ")
	if (len(aList)>0):
		fout.write("\n")
        s=fp.readline();
fout.close()
fp.close()
