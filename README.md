
# JioODU-ssh

A way to get temporary ssh access in Jio Outdoor Unit.

## Overview

The sshd binary exists on the Jio ODU at /usr/sbin/sshd. However, the root filesystem is read-only, which prevents modifying the sshd config directly or changing the root password, that's why I used SSH key-based auth to get access to the ODU.

>⚠️This method is not persistant and you'll lose ssh connection if the ODU is restarted.⚠️

## Steps to Enable SSH.
### **1. Generate an SSH key pair on your PC**

##### **For linux**:-
```bash
ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa
```

##### **For windows**:-
```cmd
ssh-keygen -t rsa -b 2048
```
The id_rsa.pub file can be found at "C:\Users\username\\.ssh\id_rsa.pub",
> You can leave the passphrase empty.


**Once the keys are generated, copy the content of id_rsa.pub to the **authorized_keys** file.**


### **2. Push the get-ssh folder using adb.**
Use
```bash
adb push get-ssh/ /tmp/
```
to push the entire get-ssh folder to the /tmp directory of the ODU.

### **3. Run the start.sh Script in adb shell.**

```bash
adb shell /tmp/get-ssh/start.sh
```
You can now use 
```bash
ssh root@<ODU's GATEWAY ADDR> 
```
to access the ODU.
## Troubleshooting

Make sure start.sh is executable. if not, do so with
```bash
chmod +x /tmp/get-ssh/start.sh
```

