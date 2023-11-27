package com.team1.project.dto.chat;

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
public class ChatMember {

  private String memberId;
  private Long roomNum;
  private LocalDateTime joinTime;
  private String nickname;

}
