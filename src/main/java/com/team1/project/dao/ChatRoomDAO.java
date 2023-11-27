package com.team1.project.dao;

import com.team1.project.dto.chat.room.ChatRoom;
import com.team1.project.dto.chat.room.ChatRoomDTO;
import com.team1.project.dto.chat.room.RoomType;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChatRoomDAO {

  void registerChatRoom(ChatRoom chatRoom);

  void updateChatRoom(Long roomNum, ChatRoom chatRoom);

  void deleteChatRoom(Long roomNum);

  List<ChatRoomDTO> selectChatRoom(String memberId, String searchTxt, RoomType type);

  ChatRoom selectChatRoomById(Long chatRoomId);

  ChatRoom getRoomAlreadyExist(List<String> memberIds, RoomType roomType, long size);
}
