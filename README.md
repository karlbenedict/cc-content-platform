# UNM Research Data Services Workshop Platform

This repository contains [Docker](https://www.docker.com) container packages that enable local or server-based workshop content access and use. The container configurations may vary from workshop to workshop, but typically includes an enhanced version of the [jupyter/datascience-notebook](https://hub.docker.com/r/jupyter/datascience-notebook/) maintained by [Jupyter.org](https://hub.docker.com/u/jupyter/). 

Each workshop folder contains one or more `docker-compose` YAML files that, when run, will run the workshop platform on the host system. Typically, once running, the platform may be accessed through the user's web browser on the host system through the `http://localhost:8888` address. Some workhops may run more than one web-based container, and in those cases the additional web addresses will be provided in the workshop-specific `README.md` file. 

The current workshops included in the repository include:

* `Project-Management`: a workshop focused on presenting basic research project management principles and providing hands-on experience in using [TaskJuggler](http://taskjuggler.org) to plan, execute, and track project activities and progress. When the platform is run the content from the [workshops-pm](https://github.com/karlbenedict/workshops-pm) repository is imported into the platform. 

## Requirements to run the platform

In order to run the platform on your local computer or on a server you must have the [Docker Platform](https://www.docker.com/community-edition) installed on your platform. [Docker compose](https://docs.docker.com/compose/install/) must also be installed on your system. This is included in some installations of Docker by default. 

You must also transfer the workshop repository to your system to be able to run the startup commands provided below. You can transfer the repository by:

* downloading the [Zip archive](https://github.com/karlbenedict/workshops/archive/master.zip) from GitHub and unzipping it on your local computer, or
* if you have [Git](https://git-scm.com) installed on your computer you may clone the repository to your computer by using the following command:

    git clone https://github.com/karlbenedict/workshops.git

## Running the platform

The workshop platform may be run using the default configuration of one instance of the platform (the recommended approach when running the platform as a workshop participant) by executing the following command from within the appropriate workshop folder:

    docker-compose up -d --build

This will use the default configuration defined in the `docker-compose.yml` file in the folder where the command is run. If you want to run an alternative docker-compose configuration file you can execute the following command:

    docker-compose -f <alternative YAML filename> up -d --build

replacing `<alternative YAML filename>` with the name of the file you want to use. 

## Stopping the platform

Since the workshop environment is published using a specified port on the host machine (`8888` by default), you can only run one instance of the workshop platform at a time. To switch to another workshop platform you will need to stop the current one that is running, *otherwise the command provided above to run the new workshop platform will fail*. 

You can see what containers are running on your system, and the ports that they are assigned to by executing the

    docker ps

command. 

To stop the currently running workshop platform you can execute the following command from within the workshop directory that you started it from:

    docker-compose down

If you want to remove any new or modified files from your local copy of the workshop platform you can use the following variant of the above command:

    docker-compose down -v

This will remove the persistant storage volume that allows for the retention of content between runs of the container. This retention of changes **only applies outside of the workshop folder in the platform** each time the workshop platform is started it pulls the current workshop content from GitHub - overwriting any local changes to the workshop materials. 


The default password for the running workshop platform is `password`. The password used by the platform may be changed by editing the `startup_instruction.sh` and `startup_playground.sh` files in the `jupyter` folder in each workshop. The `SHA1 Password Calculator.ipynb` notebook in the `Utility-Scripts` folder may be used ot generate a new password hash that can be pasted into one or both of the startup scripts. 

