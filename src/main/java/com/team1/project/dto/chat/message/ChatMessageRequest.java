package com.team1.project.dto.chat.message;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ChatMessageRequest {

  private Long roomNum;
  private String contents;
  private MessageType messageType;
  private String memberId;

}
