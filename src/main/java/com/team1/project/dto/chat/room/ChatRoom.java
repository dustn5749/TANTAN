package com.team1.project.dto.chat.room;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ChatRoom {
  private Long roomNum;
  private String roomName;
  private RoomType type;
  private LocalDateTime creatTime;
}
