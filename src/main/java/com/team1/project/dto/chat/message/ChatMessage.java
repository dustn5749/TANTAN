package com.team1.project.dto.chat.message;

import com.team1.project.dto.chat.MessageType;
import lombok.Data;

@Data
public class ChatMessage {

  private Long roomId;
  private String senderId;
  private String senderNickName;
  private MessageType type;
  private String contents;

}
