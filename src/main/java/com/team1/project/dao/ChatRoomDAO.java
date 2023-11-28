package com.team1.project.dao;

import com.team1.project.dto.chat.room.ChatRoom;
import com.team1.project.dto.chat.room.ChatRoomDTO;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChatRoomDAO {

  void registerChatRoom(ChatRoom chatRoom);

  void updateChatRoom(ChatRoom chatRoom);

  void deleteChatRoom(Long roomNum);

  List<ChatRoomDTO> selectChatRoom(Map<String, Object> map);

  ChatRoom selectChatRoomById(Long chatRoomId);

  ChatRoom getRoomAlreadyExist(Map<String, Object> map);
}
