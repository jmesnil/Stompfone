# Stomp on the iPhone #

This demo iPhone application can send and receive messages from a STOMP broker.

To use it with [HornetQ][hornetq], you need to add a JMS queue named ExampleQueue in `hornetq-jms.xml`:

    <queue name="ExampleQueue">
		<entry name="/queue/ExampleQueue"/>
	</queue>
	
You also need to configure HornetQ server to accept STOMP messages on 61613 port in `hornetq-server.xml`:

    <acceptor name="stomp">
       <factory-class>org.hornetq.core.remoting.impl.netty.NettyAcceptorFactory</factory-class>
       <param key="port" value="61613"/>
       <param key="protocol" value="stomp"/>
    </acceptor>
    
This example uses [AsyncSocket][async] and [stomp-objc][stomp-objc] for using STOMP from Objective-C.

Enjoy!

[hornetq]: http://jboss.org/hornetq/
[async]: http://code.google.com/p/cocoaasyncsocket/
[stomp-objc]: http://github.com/juretta/objc-stomp
