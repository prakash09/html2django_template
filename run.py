from subprocess import Popen
import os

import sys
try:
    file_name=sys.argv[1]
except:
    print "Send valid file name in the argument"
file_path=os.path.abspath("%s" % (file_name,))
print "Working....."
process=Popen("./django_template.sh %s" % ( str(file_path),), shell=True)
print "Done successfully"

