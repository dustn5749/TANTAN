package com.team1.project.controller.chat;

import com.team1.project.dto.chat.message.ChatMessageRequest;
import com.team1.project.service.auth.AuthService;
import com.team1.project.service.chat.ChatMessageService;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class ChatMessageController {

  private final ChatMessageService messageService;
  private final AuthService authService;

  @PostMapping("/chat/message")
  public void chatMessage(
      @RequestBody ChatMessageRequest request,
      Authentication authentication
  ){

    String memberId = authService.getMemberId(authentication);
    request.setMemberId(memberId);

    messageService.sendMessage(request);
  }

}
