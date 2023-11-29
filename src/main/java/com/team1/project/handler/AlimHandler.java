package com.team1.project.handler;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.stomp.StompCommand;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ImmutableMessageChannelInterceptor;
import org.springframework.stereotype.Component;

import java.util.Map;

@Slf4j
@Component
@RequiredArgsConstructor
public class AlimHandler extends ImmutableMessageChannelInterceptor {


    /**
     * 인증 처리나 사전 처리 할 것들
     * @param message 클라이언트 메세지
     * @param channel 구독 채널
     * @return 가공 메세지
     */
    @Override
    public Message<?> preSend(Message<?> message, MessageChannel channel) {


        StompHeaderAccessor accessor = StompHeaderAccessor.wrap(message);
        for (Map.Entry<String, Object> entry : message.getHeaders().entrySet()) {
            log.info("preSend() header -> {}", entry);
        }
        if (StompCommand.CONNECT == accessor.getCommand()) { // websocket 연결요청
            String jwtToken = accessor.getFirstNativeHeader("token");
            log.info("preSend() CONNECT message = {}", message);
            log.info("preSend() CONNECT channel = {}", channel);
            log.info("preSend() CONNECT accessor = {}", accessor);
            log.info("preSend() CONNECT jwtToken = {}", jwtToken);
        } else if (StompCommand.SUBSCRIBE == accessor.getCommand()) { // 채팅룸 구독요청
        	/*
        	 * 예]  header로 전달 되는 키와 값의 종류
						simpMessageType : SUBSCRIBE
						stompCommand : SUBSCRIBE
						nativeHeaders : {id=[sub-0], destination=[/sub/chat/room/378de7a1-4ae9-42da-9f01-34d311e1c66c]}
						simpSessionAttributes : {}
						simpHeartbeat : [J@43300a0f
						simpSubscriptionId : sub-0
						simpSessionId : 0ecozkbs
						simpDestination : /sub/chat/room/378de7a1-4ae9-42da-9f01-34d311e1c66c

						//구독시 추가 헤더함(사용자 이름)
							userName : 홍길동
            // header정보에서 구독 destination정보를 얻어 채팅방에 사용자 입장
          */
//            String simpDestination = (String) accessor.getHeader("simpDestination");
//            String simpSessionId = (String) accessor.getHeader("simpSessionId");
//            String sender = accessor.getFirstNativeHeader("sender");
//            System.out.println("sender = " + sender);
//            if (simpDestination.contains("/sub/chat/room")) {
//                chatRoomService.userEnterChatRoomUser(simpDestination, simpSessionId, sender);
//            }
        } else if (StompCommand.UNSUBSCRIBE == accessor.getCommand()) { //메시지 구독 취소 //채팅방에서 나감
        	/*
        	 * 예]  header로 전달 되는 키와 값의 종류
        		simpMessageType : UNSUBSCRIBE
        		stompCommand : UNSUBSCRIBE
        		nativeHeaders : {id=[sub-0]}
        		simpSessionAttributes : {}
        		simpHeartbeat : [J@1e0982e5cccccccon
        		simpSubscriptionId : sub-0
        		simpSessionId : sxepxewb
        		*/

//            String simpSessionId = (String) accessor.getHeader("simpSessionId");
//            chatRoomService.userLeaveChatRoomUser(simpSessionId);

        } else if (StompCommand.DISCONNECT == accessor.getCommand()) { // Websocket 연결 종료
            // 연결이 종료된 클라이언트 sesssionId로 채팅방 id를 얻는다.
            String sessionId = (String) message.getHeaders().get("simpSessionId");
            log.info("preSend() DISCONNECTED sessionId = {}", sessionId);
            log.info("preSend() DISCONNECTED accessor = {}", accessor);
        }

        return super.preSend(message, channel);
    }



}
