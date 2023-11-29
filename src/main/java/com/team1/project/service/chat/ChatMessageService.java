package com.team1.project.service.chat;

import com.team1.project.dto.chat.ChatMember;
import com.team1.project.dto.chat.message.ChatMessageRequest;
import com.team1.project.dao.ChatMessageDAO;
import com.team1.project.dto.MemberDTO;
import com.team1.project.dto.chat.message.ChatMessage;
import com.team1.project.dto.chat.message.ChatMessageDTO;
import com.team1.project.dto.chat.message.GetMessageRequest;
import com.team1.project.dto.chat.message.MessageType;
import com.team1.project.service.MemberService;
import java.util.Date;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class ChatMessageService {

  private final MemberService memberService;
  private final ChatMessageDAO messageDAO;
  private final ChatMemberService chatMemberService;
  private final SimpMessageSendingOperations messagingTemplate;

  public void sendMessage(ChatMessageRequest request) {

    log.info("ChatMessageRequest = {} ",request);

    ChatMessage message = new ChatMessage();
    message.setMessageType(request.getMessageType());
    message.setContents(request.getContents());
    message.setRoomNum(request.getRoomNum());
    message.setMemberId(request.getMemberId());

    messageDAO.insertMessage(message);

    ChatMessageDTO dto = message.toDTO();

    MemberDTO byId = memberService.findById(request.getMemberId());
    String name = byId.getNickname();

    dto.setSendTime(new Date());
    dto.setSenderNickName(name);
    dto.setProfileImg(byId.getProfile_img());

    messagingTemplate.convertAndSend("/sub/chat/room/" + dto.getRoomNum(), dto);

    List<ChatMember> chatMemberList = chatMemberService.getChatMemberList(request.getRoomNum());
    for(ChatMember chatMember : chatMemberList){
      if(chatMember.getMemberId().equals(request.getMemberId())) continue;
      messagingTemplate.convertAndSend("/sub/chat/new/" + chatMember.getMemberId(), dto);
    }

  }

  public List<ChatMessageDTO> getList(GetMessageRequest messageRequest) {

    return messageDAO.getList(messageRequest);
  }

  public ChatMessageDTO getMessage(Long messageId) {

    return messageDAO.getMessageById(messageId);
  }
  public void deleteRoomNum(Long roomNum) {
  }

  public void getOutRoomMessage(Long roomNum, String memberId) {
    sendMessage(ChatMessageRequest.builder()
        .messageType(MessageType.LEAVE)
        .roomNum(roomNum)
        .memberId(memberId)
        .contents("")
        .build());
  }
}
