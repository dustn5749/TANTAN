package com.team1.project.entity;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FriendRequest {

  private Long id;

  private String sendMemberId;

  private String receiveMemberId;

  private LocalDateTime reqDate;

  private String acceptYn;

}