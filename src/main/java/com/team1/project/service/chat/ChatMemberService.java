package com.team1.project.service.chat;

import com.team1.project.dao.ChatMemberDAO;
import com.team1.project.dto.chat.ChatMember;
import com.team1.project.dto.chat.ChatMemberList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ChatMemberService {

  private final ChatMemberDAO chatMemberDAO;

  @Transactional
  public void registerChatMember(ChatMemberList chatMemberList){

    Set<String> data = new HashSet<>(chatMemberList.getMemberIds());
    chatMemberList.setMemberIds(data.stream().toList());

    chatMemberDAO.registerChatMember(chatMemberList);
  }

  @Transactional
  public List<ChatMember> getChatMemberList(Long roomNum){


    return chatMemberDAO.getChatMemberList(roomNum);
  }

  public void deleteMemberRoom(Long roomNum, String memberId) {
    chatMemberDAO.deleteMemberRoom(Map.of("roomNum", roomNum, "memberId", memberId));
  }
}
