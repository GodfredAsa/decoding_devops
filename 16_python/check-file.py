# FIRST PYTHON SCRIPT FILE IN VAGRANT scriptbox vm
#!/usr/bin/python
import os
path = 'tmp/testfile.txt'
if os.path.isdir(path):
    print("Its a directory")
elif os.path.isfile(path):
    print("Its a file")
else:
    print("It does not exists")