package com.ezen.carCamping.config;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler{
	//쳇팅서버
//	List<WebSocketSession> list = new ArrayList<WebSocketSession>();
	static int cnt;
	Map<String, WebSocketSession> map = new HashMap<String,WebSocketSession>();
	Map<String, String> users = new HashMap<String,String>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("Connect...");
		cnt++;
		map.put(session.getId(), session);
		users.put(session.getId(), "user"+cnt);
		System.out.println(session.getId()+">websocket>"+session.getAttributes());
	}
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(message.getPayload()); //ㅇㅇ
		System.out.println(session.getAttributes()); // {msg=12345, msg1=abcedefg, HTTP.SESSION.ID=EEB44B7645F246D21B26B387AC06728D}
		// 클라이언트에 전달
		TextMessage msg = null;
		msg = new TextMessage(users.get(session.getId())+">>>"+ message.getPayload());
		Set<String> keys = map.keySet();
		Iterator<String> ite = keys.iterator();
		while(ite.hasNext()) {
			map.get(ite.next()).sendMessage(msg);
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("Close");
		map.remove(session.getId());
		users.remove(session.getId());
	}
}
