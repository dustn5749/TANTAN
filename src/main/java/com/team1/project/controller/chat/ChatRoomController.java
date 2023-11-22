package com.team1.project.controller.chat;

import com.team1.project.dto.chat.room.ChatRoomRequest;
import com.team1.project.dto.chat.room.RoomType;
import com.team1.project.service.chat.ChatService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class ChatRoomController {

  private final ChatService chatService;

  // @PostMapping("/chat/room")
  @GetMapping("/chat/room")
  public void register(
      //@RequestBody ChatRoomRequest roomRequest
  ){
    ChatRoomRequest roomRequest = new ChatRoomRequest();
    roomRequest.setRoomName("테스트");
    roomRequest.setMemberList(List.of("7800","admin"));
    roomRequest.setType(RoomType.oneOn1);
    chatService.register(roomRequest);
  }

}
