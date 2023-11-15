package com.team1.project.entity;

import java.time.LocalDate;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
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
@Entity
@Table(name = "FRIEND")
public class Friend {

  @Id
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "FRIEND_id_gen")
  @SequenceGenerator(name = "FRIEND_id_gen", sequenceName = "FR_SEQ", allocationSize = 1)
  @Column(name = "FRIEND_ID", nullable = false)
  private Long id;

  @Column(name = "REG_ID")
  private String regId;

  @Column(name = "RES_ID", length = 50)
  private String resId;

  @Column(name = "REQ_DATE")
  private LocalDate reqDate;

  @Column(name = "RES_DATE")
  private LocalDate resDate;

}