package com.team1.project.dto.chat.message;

import lombok.Data;

@Data
public class ChatMessage {
  private Long messageNum;
  private String memberId;
  private Long roomNum;
  private MessageType messageType;
  private String contents;

  public ChatMessageDTO toDTO(){
    return ChatMessageDTO.builder()
        .messageNum(messageNum)
        .senderId(memberId)
        .messageType(messageType)
        .contents(contents)
        .roomNum(roomNum)
        .build();
  }
}
