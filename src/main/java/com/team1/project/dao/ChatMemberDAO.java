package com.team1.project.dao;

import com.team1.project.dto.chat.ChatMemberList;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChatMemberDAO {

  void registerChatMember(ChatMemberList memberList);
}
