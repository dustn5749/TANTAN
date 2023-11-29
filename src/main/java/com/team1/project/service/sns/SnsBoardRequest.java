package com.team1.project.service.sns;

import lombok.Data;

@Data
public class SnsBoardRequest {

  private Long size;
  private Long lastId;
  private String memberId;

}
