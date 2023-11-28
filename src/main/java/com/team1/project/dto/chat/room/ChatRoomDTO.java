package com.team1.project.dto.chat.room;

import com.team1.project.dto.chat.ChatMember;
import java.time.LocalDateTime;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ChatRoomDTO {
  private Long roomNum;
  private String roomName;
  private RoomType type;
  private LocalDateTime creatTime;
  private LocalDateTime lastTime;
  private String lastText;

  private Long memberCnt;

  private List<ChatMember> chatters;
}
