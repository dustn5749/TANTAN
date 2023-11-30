package com.team1.project.entity;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Friend {

  private Long id;
  private String regId;
  private String resId;
  private LocalDateTime reqDate;
  private LocalDateTime resDate;

}