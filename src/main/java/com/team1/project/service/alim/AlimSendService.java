package com.team1.project.service.alim;

import com.team1.project.dto.AlimDTO;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class AlimSendService {

  // 메시지 전송 작업을 수행하는 데 사용되는 객체 주입
  private final SimpMessageSendingOperations messagingTemplate;

  // 알림을 특정 사용자에게 전송하는 메서드
  public void sendAlim(AlimDTO send) {
    // "/sub/alim/{receiveMemberId}" 주제로 알림을 전송
    // 해당 주제를 구독 중인 클라이언트에게 메시지가 전달
    messagingTemplate.convertAndSend("/sub/alim/" + send.getReceiveMemberId(), send);
  }

  public void sendAlims(List<AlimDTO> list) {
    for (AlimDTO dto : list) {
      messagingTemplate.convertAndSend("/sub/alim/" + dto.getReceiveMemberId(), dto);
    }
    
  }

}
