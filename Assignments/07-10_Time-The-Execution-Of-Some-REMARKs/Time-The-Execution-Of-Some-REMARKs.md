

0. Pull the latest versions of the REMARK repo
0. For the SolvingMicroDSOPs repo:
    * Verify that you are able to execute the "do_all.py" programs in spyder on your VM
    * Modify the do_all.py file to `do_all_Moniker.py` so that
      1. When run, it executes the _min and _mid versions of the code 
      1. It calculates the time required for running those two versions
      1. It creates a do_all_Moniker.out file that reports the exact specs of your VM setup (like, which version of Linux, what version of VirtualBox, what OS you are using (not just "Windows" or "MacOS" but the exact version), what kind of hardware you are running it on (the exact model of your laptop, its RAM, etc).  Basically, enough information that you are confident that if somebody else took that information and ran the code themselves, they would get a very similar result.
0. For the AndCwithStickyE repo:
   * Modify the do_all.py file to `do_all_Moniker.py` so that
      1. When run, it executes the _min version only of the code 
      1. It calculates the time required for running this version
      1. It creates a do_all_Moniker.out file that reports the exact specs of your VM setup (see above). 
0. When you have finished doing this on your VM, repeat the exercise on an AWS EC2 instance
   * You will probably want to review the sketchy instructions `Get-AWS-Account-And-Learn-About-EC2.md` and the info in
   `/Methods/Tools/Install/Machines/030_Amazon-Web-Services_Elastic-Cloud/Scripts`


**Detailed instructions for the assignment 07_10_Time-The-Execution-Of-Some-REMARKs on an AWS EC2 instance**


0. Open your VM
0. Launch an instance on AWS (**Important note**: The Free tier eligible instance type (1GB RAM, 1 vCPU) is not powerful enough to properly run this code. An appropriate instance configuration would include 8GB RAM, 2 vCPUs and a network performance up to 10 Gigabit. Moreover, select 30 GiB Size on the Add Storage section. **AWS will charge you a (small) fee for such configuration, so remember to terminate your instance after you are done!** 
0. Open Terminal

   `cd Downloads`   
   `ssh -i "[Moniker].pem" ubuntu@ec2-18-222-201-18.us-east2.compute.amazonaws.com` (copy the link given to you by AWS under Connect to your instance using its public DNS)       
   `sudo apt update`    
   `sudo apt-get upgrade`
   `sudo apt-get install ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal xfce4 vnc4server xfce4-terminal`   
   
   `git clone https://github.com/ccarrollATjhuecon/Methods`   
   
   `sudo apt install tigervnc-standalone-server tigervnc-xorg-extension tigervnc-viewer`        
   
   `vncserver`

   You are asked to give a password.   
   Because we are going to be changing how the VNC server is configured, first stop the VNC server instance that is running on port       5901 with the following command:   
   `vncserver -kill :1`   

   The output should look like this:   
   Killing Xtigervnc process ID 9523... success!    
   
   You have to copy the xstartup file from the Methods repo. Change directory to the folder where the file is located, then copy it:  
      `cd Methods/Tools/Install/Machines/030_Amazon-Web-Services_Elastic-Cloud/Resources/userRoot/dot/vnc`   
      `cp xstartup_xfce ~/.vnc/xstartup`   
      `chmod a+x !$`      
    
   Now, restart the VNC server.   
   `vncserver`   
   
0. Do not close this terminal, open a second one   
   `cd Downloads`   
   `ssh -L 5901:localhost:5901 -i [Moniker].pem ubuntu@ec2-18-222-201-18.us-east-2.compute.amazonaws.com` (again, the DNS is given to you by AWS)       
   
0. Again do not close this new terminal, open a third one   
   `remmina`   
   
   Select Protocol: VCN   
   Server: localhost:5901   
   Connect   
   
   It will ask you the password, type it. Once you are connected, you'll see the default Xfce desktop.   
   
0. In the remote machine (localhost:5901), open a terminal   
   
   `sudo apt install python-pip`      
   `sudo apt-get install curl`      
   `curl -O https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh`      
   Note: -O is the uppercase letter O, not the number 0.   
   `chmod a+x Anaconda3-5.2.0-Linux-x86_64.sh`      
   `./Anaconda3-5.2.0-Linux-x86_64.sh`   
   
   `export PATH=~/anaconda3/bin:$PATH`   
   `conda --version`   
   `conda install -c conda-forge jupyter_contrib_nbextensions`   
   `sudo apt install spyder`   
   `conda install pyopengl`
   
   `conda create -y --name ARK python=3.6`    
   `pip install –upgrade pip`   
   `pip install econ-ark`   
    
   `cd`   
   `mkdir GitHub`   
   `cd GitHub`   
   
   `git clone git://github.com/econ-ark/DemARK`   
   `git clone git://github.com/econ-ark/REMARK`   
   
   `source activate ARK`   
   `spyder &`   
   
Run the relevant do_all.py files   
Report the time to execute the files  
