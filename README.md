# pgxl-docker

[Postgre-XL](http://www.postgres-xl.org/) is a new MPP fork of [PostgreSQL](http://www.postgresql.org).

This version is a test of Postgre-XL with Docker, the default configuration file runs several data nodes, 1 gtm and 1 coordinator.
The docker configuration is not fully functional and is unsecure (run with docker privilegied mode, no password for postgresql coordinator).

We have written a [tutorial](http://www.postmind.net/pgxl_docker-en.html) explaining the use of this docker configuration.

## Getting Started
First, make sure that docker and fig are installed on the host.

Clone the repo: ``$ git clone https://github.com/mbreisch/pgxl-docker``

Navigate to the directory and build the fig file: ``$ fig build``

To generate the ssh keys needed to enter the containers run the `key()` function: ``$ fig run pgxl``
 
Scale pgxl to the desired number of containers: ``$ fig scale pgxl=4``

To view the containers running and their ip addresses: ``$ python run.py --ip``

To automatically create a config file from the running containers: ``$ python run.py --conf pom/pgxc_ctl``

If you would like to create the config file with manually inputted ip addresses: ``$ python run.py --conf ~/pgxc_ctl --static "192.168.0.1,192.168.0.2"``

To start the cluster first ssh into the coordMasterServer container with the ssh key: ``$ ssh -i pom/.ssh/id_rsa pom@172.17.0.14``

Start pgxc_ctl: ``$pgxc_ctl``

Initialize the cluster: ``PGXC init all``

From the host you should now be connect to the cluster: ``$ psql -h 172.17.0.14 -U pom postgres``

To stop the cluster login into the coordMasterServer container again and start pgxc_ctl, then issue the stop command: `PGXC stop all`

### Authors

Matthieu Lagacherie and Yannick Drant
