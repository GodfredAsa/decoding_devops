"""
DESCRIPTION OF THE TASKS OF THIS FILE 
It takes 3 users add them to the system and also assign them 
to a science group. If the users or the group does not exists 
print out are made.

# to very that a user exist with a group from the server or vm
<id user>
"""

#!/usr/bin/python3
import os
userlist = ["alpha", "beta", "gamma"]
print("========================  ADDING USERS  ========================")

for user in userlist:
    exitcode = os.system("id {}".format(user))
    if exitcode != 0:
        print("==========================================")
        print("{} does not exist, Adding user.".format(user))
        os.system("useradd {}".format(user))
    else:
        print("==========================================")
        print(f"User Already exists, Skipping {user}".title())
    
    print("====================  CREATING A GROUP  ====================")

    exitcode = os.system("grep science /etc/group")
    if exitcode != 0:
        print("==========================================")
        print("Group science does not exists".title())
        print("Adding Science")
        os.system("groupadd science")
    else:
        print("==========================================")
        print("Group Science already exists")

for user in userlist:
    print("==========================================")
    print("Adding {} to science group".format(user))

    os.system("usermod -G science {}".format(user))

print("==================  ADDING DIRECTORY  [ SCIENCE DIRECTORY ] ====================")

science_dir = "/opt/science_dir"

if os.path.isdir(science_dir):
    print("Directory Already Exists")
else:
    print("Directory Created")
    os.mkdir(science_dir)

print("="*10)
print("Assigning Permission and Ownership to the Directory")
os.system(f"chown :science {science_dir}")
os.system(f"chmod 770 {science_dir}")