package com.team1.project.dto.chat.message;

import lombok.Data;

@Data
public class GetMessageRequest {

  private Long lastId;
  private Long size = 10L;

  private Long roomNum;
}
