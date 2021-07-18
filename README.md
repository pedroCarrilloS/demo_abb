# demo_abb
Install steps:

1. Clone this repo in your filesystem

git clone https://github.com/pedroCarrilloS/demo_abb.git

2. Launch install script:

sh demo_abb/scripts/init_script.sh

3. Go to the Chromium browser and enter this url to access:

http://127.0.0.1:3003/login

This is the grafana dashboard

4. You can also access to the Influx dashboard, go to this URL:

http://127.0.0.1:3004

Notes:
- Due to the time restriction (this test should be done in aprox 3h) I have not finished the influx/grafana dashboard configuration. The connection script is sending the information to an Influx database named "demo_abb".
- Cron for check_conn.sh will execute the script at "/root/demo_abb/script/check_conn.sh". This could be improved using the current path to install this cron.
-I know, I used a script to launch the container instead of docker-compose or swarm. I prefer use docker-compose, but the script was this time the faster way for me.

Networking answers:
4. Networking -Explain how you try to inspect the error in the next case:
We have a remote user who has an edge machine connected on a VPN with network (192.168.2.0/23) using 4G connection with public ip 89.32.42.4. And another interface connected to the factory network 10.2.3.0/32 . They added one robot and one database sink. The robot is on the factory network and the database and the monitoring tool is running on a docker stack the. The user says that he added the ip and the database hostname, but the monitoring tool is not storing any data. You have access to the VPN and the edge has the port 22 open and you know the user (username: support) and password to access
1. Who you connect to the edge 
  a. what ip range -> 192.168.2.0/23
  b. what protocol you should use to connect -> SSH
  c. write the linux command or the connection string for this protocol-> ssh support@$EDGE_MACHINE_IP
2. Write 3 different things you should check
   - Check if containers are running and ports ("docker ps")
   - Check if the edge machine has the mandatory ports opened ("iptables -L" or "netstat -onaput | grep $PORT")
   - Check if we can reach the robot and if the ports are open: "telnet $ROBOT_IP $ROBOT_PORT"
   
4. Write 5 different error that should happened
   - Docker was not able to run the containers.
   - Docker exported containers are not mapping ports properly
   - The edge machine firewall is blocking the connection with the robot.
   - Connectivity is failing between the robot and the edge machine (routers, firewalls, robot hasn't loaded the expected configuration, etc...)
   - The user has not added fine the ip and hostname at the monitoring tool.


