# docker minecraft Skyfactory 4

[![Docker Pulls](https://badgen.net/docker/pulls/trueosiris/minecraft-skyfactory4?icon=docker&label=pulls)](https://hub.docker.com/r/trueosiris/minecraft-skyfactory4/) 
[![Docker Stars](https://badgen.net/docker/stars/trueosiris/minecraft-skyfactory4?icon=docker&label=stars)](https://hub.docker.com/r/trueosiris/minecraft-skyfactory4/) 
[![Docker Image Size](https://badgen.net/docker/size/trueosiris/minecraft-skyfactory4?icon=docker&label=image%20size)](https://hub.docker.com/r/trueosiris/minecraft-skyfactory4/) 
![Github Commits](https://badgen.net/github/commits/trueosiris/docker-minecraft-skyfactory4?icon=github&label=commits) 
![GitHub last commit](https://badgen.net/github/last-commit/trueosiris/docker-minecraft-skyfactory4?icon=github&label=last%20commit) 
![Github stars](https://badgen.net/github/stars/trueosiris/docker-minecraft-skyfactory4?icon=github&label=stars) 
![Github forks](https://badgen.net/github/forks/trueosiris/docker-minecraft-skyfactory4?icon=github&label=forks)

Updated to 4.2.4 and tested succesfully using Curseforge modpack on 2021-dec-20<br>
Sourcefiles from here: https://www.curseforge.com/minecraft/modpacks/skyfactory-4/files<br>
The file-redirect currently leads to https://edge.forgecdn.net/files/3565/687/SkyFactory-4_Server_4_2_4.zip

git repo: https://github.com/TrueOsiris/docker-minecraft-skyfactory4<br>
dockerhub repo: https://hub.docker.com/r/trueosiris/minecraft-skyfactory4
    
This is based on several other repos. Credits to these fellas! <br>
- itzg/minecraft-server<br>
- jaysonsantos/docker-minecraft-ftb-skyfactory3

Also thanks to contributer [connorv001](https://github.com/connorv001) and bug reporter / commenter [AmandaJonesAway](https://github.com/AmandaJonesAway) [bitjumper1](https://github.com/bitjumper1) [msshnl](https://github.com/msshnl)

To adapt the server properties, run the container & let it fully install until you see the line

    [Aromabackup-Backup/INFO] [minecraft/DedicatedServer]: [AromaBackup] Server Backup done!

Then stop the container, adapt the server.properties file & start it again.

To simply use the latest stable version, run:

    docker run -d -p 25565:25565 trueosiris/minecraft-skyfactory4
    
To use a specific version, use 
  
    docker run -d -p 25565:25565 trueosiris/minecraft-skyfactory4:4.2.4

where the default server port, 25565, will be exposed on your host machine. If you want to serve up multiple Minecraft servers or just use an alternate port, change the host-side port mapping such as:

    docker run -p 25566:25565 ...

will service port 25566.

Speaking of multiple servers, it's handy to give your containers explicit names using `--name`, such as

    docker run -d -p 25565:25565 --name minecraft trueosiris/minecraft-skyfactory4

With that you can easily view the logs, stop, or re-start the container:

    docker logs -f minecraft
        ( Ctrl-C to exit logs action )

    docker stop minecraft

    docker start minecraft


## Attaching data directory to host filesystem

In order to persist the Minecraft data, which you *probably want to do for a real server setup*, use the `-v` argument to map a directory of the host to ``/data``:

    docker run -d -v /path/on/host:/data -p 25565:25565 trueosiris/minecraft-skyfactory4

When attached in this way you can stop the server, edit the configuration under your attached ``/path/on/host`` and start the server again with `docker start CONTAINERID` to pick up the new configuration.


## Server configuration

The message of the day, shown below each server entry in the UI, can be changed with the `MOTD` environment variable, such as:

    docker run -d -e 'MOTD=My Server' ...

If you leave it off, the last used or default message will be used.

The Java memory limit can be adjusted using the `JVM_OPTS` environment variable, where the default is the setting shown in the example (max and min at 2048 MB):

    docker run -e 'JVM_OPTS=-Xmx2048M -Xms2048M' ...
