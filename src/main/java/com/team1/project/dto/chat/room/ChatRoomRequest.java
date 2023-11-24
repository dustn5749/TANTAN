package com.team1.project.dto.chat.room;

import java.util.List;
import lombok.Data;

@Data
public class ChatRoomRequest {

  private RoomType type;
  private String roomName;
  private List<String> memberList;

}
