package com.team1.project.config.websocket;

import com.team1.project.handler.AlimHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@RequiredArgsConstructor
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
	 // WebSocket 연결을 처리할 핸들러를 주입
    private final AlimHandler alimHandler;
    // 클라이언트 수신 채널에 핸들러를 등록
	@Override
	public void configureClientInboundChannel(ChannelRegistration registration) {
		registration.interceptors(alimHandler);
	}
	// 메시지 브로커를 구성
    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
        config.enableSimpleBroker("/sub");
        config.setApplicationDestinationPrefixes("/pub");
    }

    /**
     * /ws-stomp 로 소켓 연결
     *
     * @param registry
     */
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
    	// "/ws-stomp" endpoint를 등록하고 SockJS를 사용하여 연결을 허용
        registry.addEndpoint("/ws-stomp").withSockJS();
    }
}
