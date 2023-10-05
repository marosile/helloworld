package io.marosile.helloworld.socket;

import com.corundumstudio.socketio.SocketIOServer;
import org.springframework.context.annotation.Bean;
import com.corundumstudio.socketio.Configuration;

@org.springframework.context.annotation.Configuration
public class SocketIOConfig {

    @Bean
    public SocketIOServer socketIOServer() {
        Configuration config = new Configuration();
        config.setHostname("192.168.10.58");
        config.setPort(8080);
        return new SocketIOServer(config);
    }

}