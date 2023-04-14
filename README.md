# jmx
This container launch an Open Message Queue (Open MQ ou IMQ) version 4.4. This is an old JMS broker formely from Sun.

In order this container to works, as Open MQ bind a consumer to a dynamics port, you need to start your container with --net=host.

For example :
```
 docker pull swhite2016/jmx
 docker run -ti -p 8998:8998 --net=host swhite2016/jmx
```
You can then connect to the JMS broker on port 8998

This container binds the 8998 port (to connect to the broker) and the 1099 port (for JNDI connections).

This container also expose two volumes : /var/imq that is the broker data directory and /opt/imq.tar/imq/etc that is the config directory of the broker.
