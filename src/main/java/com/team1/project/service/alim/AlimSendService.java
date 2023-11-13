package com.team1.project.service.alim;

import com.team1.project.dto.AlimDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class AlimSendService {


    private final SimpMessageSendingOperations messagingTemplate;

    public void sendAlim(AlimDTO send) {
        messagingTemplate.convertAndSend("/sub/alim/" + send.getReceiveMemberId(), send);
    }
}
