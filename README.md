## WORK IN PROGRESS

# docker-minecraft-skyfactory4
    
This is based on several repos. 
- itzg/minecraft-server
- jaysonsantos/docker-minecraft-ftb-skyfactory3

I'm not taking any credit.

To simply use the latest stable version, run:

    docker run -d -p 25565:25565 trueosiris/minecraft-skyfactory4

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
