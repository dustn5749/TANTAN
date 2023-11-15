package com.team1.project.dto;

import java.io.Serializable;
import java.time.LocalDate;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class FriendRequestDTO implements Serializable {

  private Long id;
  private String sendMemberId;
  private String sendNickName;
  private String receiveMemberId;
  private LocalDate reqDate;
}