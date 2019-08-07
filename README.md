# DevOps-Task
Ansible, Docker, Python tasks

**Task 1:**
* Ansible Playbook to do the following tasks on 2 Servers ( 1 Ubuntu and 1 CentOS ) :
    * Install troubleshooting utilities htop, iftop, iotop, ncdu on both servers.
    * Copy a sample script on both of them but execute it only if the Server OS is CentOS
    * Print script output to a file & then copy the file back to Ansible server.
    * When Playbook finishes running, we should be able to see time taken by each task.
    * Also, include the command to execute the above Ansible Playbook

**Soln:** Read the readme.txt file in Ansible-Play dir

**Task 2:**
* Write a Dockerfile (CentOS 7) to install the following in a Docker container:
    - Python 3.6.5
    - MongoDB - any version
    - Apache tomcat 8 - running on port 8080
    - Please include comments at every command explaining what it does.
    - Write the command to run the Dockerfile such that once the container boots, apache tomcat's home page is accessible from the host on port 7080.

**Soln:** Go through the dockerfile

**Task 3:**
(AWS specific) Python script to find the security group that is open to the external world

**Soln:** Go through the Python-OpneSG script. (Run with AWS lambda)

 
 