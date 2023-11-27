package com.team1.project.dao;

import com.team1.project.dto.chat.ChatMember;
import com.team1.project.dto.chat.ChatMemberList;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChatMemberDAO {

  void registerChatMember(ChatMemberList memberList);

  List<ChatMember> getChatMemberList(Long roomNum);

  void deleteMemberRoom(Map<String,Object> map);
}
