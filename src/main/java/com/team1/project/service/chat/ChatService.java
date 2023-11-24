package com.team1.project.service.chat;

import com.team1.project.dto.chat.ChatMemberList;
import com.team1.project.dto.chat.room.ChatRoom;
import com.team1.project.dto.chat.room.ChatRoomRequest;
import javax.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ChatService {
  private final ChatRoomService roomService;
  private final ChatMessageService messageService;
  private final ChatMemberService memberService;

  @Transactional
  public void register(ChatRoomRequest roomRequest) {
    ChatRoom room = roomService.register(roomRequest);
    memberService.registerChatMember(ChatMemberList.builder()
            .memberIds(roomRequest.getMemberList())
            .chatRoomNum(room.getRoomNum())
        .build());
  }


}
