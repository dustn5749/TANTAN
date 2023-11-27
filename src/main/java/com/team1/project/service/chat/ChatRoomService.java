package com.team1.project.service.chat;

import com.team1.project.dao.ChatRoomDAO;
import com.team1.project.dto.chat.room.ChatRoom;
import com.team1.project.dto.chat.room.ChatRoomDTO;
import com.team1.project.dto.chat.room.ChatRoomRequest;
import com.team1.project.dto.chat.room.RoomType;
import java.time.LocalDateTime;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class ChatRoomService {

  private final ChatRoomDAO chatRoomDAO;

  public ChatRoom register(ChatRoomRequest roomRequest) {
    log.info("{}" ,roomRequest);
    ChatRoom chatRoom = ChatRoom.builder()
        .roomName(roomRequest.getRoomName())
        .type(roomRequest.getRoomType())
        .creatTime(LocalDateTime.now())
        .createMemberId(roomRequest.getSenderMemberId())
        .build();

    log.info("ChatRoom {}" ,chatRoom);

    chatRoomDAO.registerChatRoom(chatRoom);
    return chatRoom;
  }

  public ChatRoom update(Long roomNum, ChatRoomRequest roomRequest) {
    ChatRoom chatRoom = ChatRoom.builder()
        .roomName(roomRequest.getRoomName())
        .type(roomRequest.getRoomType())
        .creatTime(LocalDateTime.now())
        .build();

    chatRoomDAO.updateChatRoom(roomNum, chatRoom);
    return chatRoom;
  }

  public void delete(Long roomNum) {
    chatRoomDAO.deleteChatRoom(roomNum);
  }

  public List<ChatRoomDTO> getRoomList(String memberId, String searchTxt, RoomType type) {
    return chatRoomDAO.selectChatRoom(memberId,searchTxt, type); //
  }


  public ChatRoom getRoomById(Long chatRoomId) {
    return chatRoomDAO.selectChatRoomById(chatRoomId);
  }

  public ChatRoom getRoomAlreadyExist(List<String> memberIds, RoomType roomType) {
    return chatRoomDAO.getRoomAlreadyExist(memberIds,roomType, memberIds.size());
  }
}
