package com.team1.project.service.chat;

import com.team1.project.dao.ChatRoomDAO;
import com.team1.project.dto.chat.room.ChatRoom;
import com.team1.project.dto.chat.room.ChatRoomDTO;
import com.team1.project.dto.chat.room.ChatRoomRequest;
import com.team1.project.dto.chat.room.RoomType;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class ChatRoomService {

  private final ChatRoomDAO chatRoomDAO;

  public ChatRoom register(ChatRoomRequest roomRequest) {
    log.info("{}", roomRequest);
    ChatRoom chatRoom = ChatRoom.builder().roomName(roomRequest.getRoomName())
        .type(roomRequest.getRoomType()).creatTime(LocalDateTime.now())
        .createMemberId(roomRequest.getSenderMemberId()).build();

    log.info("ChatRoom {}", chatRoom);

    chatRoomDAO.registerChatRoom(chatRoom);
    return chatRoom;
  }

  public ChatRoom update(Long roomNum, ChatRoomRequest roomRequest) {
    ChatRoom chatRoom = ChatRoom.builder().roomName(roomRequest.getRoomName())
        .type(roomRequest.getRoomType()).creatTime(LocalDateTime.now()).roomNum(roomNum).build();

    chatRoomDAO.updateChatRoom(chatRoom);
    return chatRoom;
  }

  public void delete(Long roomNum) {
    chatRoomDAO.deleteChatRoom(roomNum);
  }

  public List<ChatRoomDTO> getRoomList(String memberId, String searchTxt, RoomType type) {
    Map<String,Object> map = new HashMap<>();
    map.put("memberId", memberId);
    map.put("searchTxt", searchTxt);
    map.put("type", type);
    return chatRoomDAO.selectChatRoom(map); //
  }


  public ChatRoom getRoomById(Long chatRoomId) {
    return chatRoomDAO.selectChatRoomById(chatRoomId);
  }

  public ChatRoom getRoomAlreadyExist(List<String> memberIds, RoomType roomType) {
    Map<String,Object> map = new HashMap<>();
    map.put("memberIds", memberIds);
    map.put("roomType", roomType);
    map.put("size", memberIds.size());
    return chatRoomDAO.getRoomAlreadyExist(map);
  }
}
