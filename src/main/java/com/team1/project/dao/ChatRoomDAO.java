package com.team1.project.dao;

import com.team1.project.dto.chat.room.ChatRoom;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChatRoomDAO {

  void registerChatRoom(ChatRoom chatRoom);
}
