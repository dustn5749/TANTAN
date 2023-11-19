package com.team1.project.service.chat;

import com.team1.project.dao.ChatMemberDAO;
import com.team1.project.dto.chat.ChatMemberList;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ChatMemberService {

  private final ChatMemberDAO chatMemberDAO;

  public void registerChatMember(ChatMemberList chatMemberList){
    chatMemberDAO.registerChatMember(chatMemberList);
  }

}
