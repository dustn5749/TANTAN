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
@Table(name = "FRIEND_REQUEST")
public class FriendRequest {

  @Id
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "FRIEND_REQUEST_id_gen")
  @SequenceGenerator(name = "FRIEND_REQUEST_id_gen", sequenceName = "FR_REQ_SEQ", allocationSize = 1)
  @Column(name = "FRIEND_REQ_ID", nullable = false)
  private Long id;

  @Column(name = "SEND_MEMBER_ID", nullable = false, length = 50)
  private String sendMemberId;

  @Column(name = "RECEIVE_MEMBER_ID", nullable = false, length = 50)
  private String receiveMemberId;

  @Column(name = "REQ_DATE", nullable = false)
  private LocalDate reqDate;

  @Column(name = "ACCEPT_YN", nullable = false)
  private String acceptYn;

}