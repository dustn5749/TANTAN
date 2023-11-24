package com.team1.project.dto;

import java.time.LocalDate;
import lombok.Data;

@Data
public class FriendDTO {

  private Long id;
  private String regId;
  private String resId;
  private LocalDate reqDate;
  private LocalDate resDate;

  private String nickname;

}
