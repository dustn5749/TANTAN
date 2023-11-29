package com.team1.project.dto.chat.room;

import java.util.List;
import lombok.Data;
import lombok.NonNull;

@Data
public class ChatRoomInviteRequest {
  private List<String> memberIds; // 추가된 애들만
  private Long roomNum;
  private String senderMemberId;

}
