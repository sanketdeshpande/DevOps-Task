1. Open Hosts file--> 
	- Add the relevant hosts [IPs]
	- Created Variables for <Linux Flavour>: Vars, use connection with Key pairs (AWS instances) or provide user/pass

2. Create a ansible.cfg file in local directory(where your task.yml is present) for timestamp of every task

3. Copy the sample-script.py in local directory(where your task.yml is present).

4. Run the task:
	 ansible-playbook -i hosts tasks.yml