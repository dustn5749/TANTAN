package com.team1.project.service.chat;

import com.team1.project.dao.ChatRoomDAO;
import com.team1.project.dto.chat.room.ChatRoom;
import com.team1.project.dto.chat.room.ChatRoomRequest;
import com.team1.project.dto.chat.room.RoomType;
import java.time.LocalDateTime;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ChatRoomService {

  private final ChatRoomDAO chatRoomDAO;

  public ChatRoom register(ChatRoomRequest roomRequest) {
    ChatRoom chatRoom = ChatRoom.builder()
        .roomName(roomRequest.getRoomName())
        .type(roomRequest.getType())
        .creatTime(LocalDateTime.now())
        .build();
    chatRoomDAO.registerChatRoom(chatRoom);
    return chatRoom;
  }



}
