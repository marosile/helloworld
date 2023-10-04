package io.marosile.helloworld.socket;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.SocketIOServer;
import com.corundumstudio.socketio.listener.ConnectListener;
import com.corundumstudio.socketio.listener.DataListener;
import io.marosile.helloworld.chat.model.dto.Message;
import io.marosile.helloworld.chat.model.service.ChatService;
import oracle.jdbc.proxy.annotation.Post;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.Map;

@Service
public class SocketIOService {

    @Autowired
    private SocketIOServer server;

    @Autowired
    private ChatService chatService;

    @PostConstruct
    public void init() {
        server.addConnectListener(new ConnectListener() {
            @Override
            public void onConnect(SocketIOClient client) {
            }
        });

        server.addEventListener("joinRoom", String.class, new DataListener<String>() {
            @Override
            public void onData(SocketIOClient socketIOClient, String roomName, AckRequest ackRequest) throws Exception {
                socketIOClient.joinRoom(roomName);
                System.out.println(socketIOClient.getAllRooms());
            }
        });

        server.addEventListener("leaveRoom", String.class, new DataListener<String>() {
            @Override
            public void onData(SocketIOClient socketIOClient, String roomName, AckRequest ackRequest) throws Exception {
                socketIOClient.leaveRoom(roomName);
            }
        });

        server.addEventListener("message", JSONObject.class, new DataListener<JSONObject>() {
            @Override
            public void onData(SocketIOClient socketIOClient, JSONObject message, AckRequest ackRequest) throws Exception {
                Message msg = new Message();
                msg.setChatRoomNo(Integer.parseInt(message.get("chatRoomNo").toString()));
                msg.setMemberId(message.get("memberId").toString());
                msg.setMessageContent(message.get("messageContent").toString());
                chatService.insertMessage(msg);
                server.getBroadcastOperations().sendEvent("message", message);
            }
        });

        server.start();
    }
}
