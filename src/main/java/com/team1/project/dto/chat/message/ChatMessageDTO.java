package com.team1.project.dto.chat.message;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ChatMessageDTO {

  static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

  private Long messageNum;
  private Long roomNum;
  private String senderId;
  private String senderNickName;
  private MessageType messageType;
  private String contents;
  private Date sendTime;
  private String profileImg;

  public String getSendTimeStr(){
    return sdf.format(sendTime);
  }

}
