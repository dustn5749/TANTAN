package com.team1.project.dto.chat.room;

import java.util.List;
import lombok.Data;

@Data
public class ChatRoomRequest {

  private RoomType roomType;
  private String roomName;
  private List<String> memberIds;
  private String senderMemberId;

}
