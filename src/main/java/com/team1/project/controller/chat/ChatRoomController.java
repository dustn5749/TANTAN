package com.team1.project.controller.chat;

import com.team1.project.dto.MemberDTO;
import com.team1.project.dto.chat.room.ChatRoom;
import com.team1.project.dto.chat.room.ChatRoomInviteRequest;
import com.team1.project.dto.chat.room.ChatRoomDTO;
import com.team1.project.dto.chat.room.ChatRoomRequest;
import com.team1.project.dto.chat.room.RoomType;
import com.team1.project.service.MemberService;
import com.team1.project.service.auth.AuthService;
import com.team1.project.service.chat.ChatMemberService;
import com.team1.project.service.chat.ChatMessageService;
import com.team1.project.service.chat.ChatRoomService;
import com.team1.project.service.chat.ChatService;
import java.util.List;
import java.util.Objects;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class ChatRoomController {

  private final ChatService chatService;
  private final ChatRoomService roomService;
  private final ChatMessageService messageService;
  private final ChatMemberService chatMemberService;

  private final MemberService memberService;

  private final AuthService authService;

  // @PostMapping("/chat/room")
  @GetMapping("/chat/room/{type}")
  public List<ChatRoomDTO> getRommList(
      Authentication authentication,
      @RequestParam(required = false) String searchTxt,
      @PathVariable RoomType type
  ) {
    String memberId = authService.getMemberId(authentication);

    return roomService.getRoomList(memberId, searchTxt, type);
  }

  @PostMapping("/chat/room")
  public Long register(
      Authentication authentication,
      @RequestBody ChatRoomRequest roomRequest
  ) throws Exception {
    String memberId = authService.getMemberId(authentication);

    if(CollectionUtils.isEmpty(roomRequest.getMemberIds())){
      throw new Exception();
    }

    if(roomRequest.getRoomType().equals(RoomType.oneOn1)
        && roomRequest.getMemberIds().size() > 1){
      throw new Exception();
    }

    if(roomRequest.getRoomType().equals(RoomType.oneOn1)){

      String s = roomRequest.getMemberIds().get(0);

      roomRequest.getMemberIds().add(memberId);
      roomRequest.setSenderMemberId(memberId);
      MemberDTO byId = memberService.findById(memberId);
      MemberDTO byId2 = memberService.findById(s);

      List<String> memberIds = roomRequest.getMemberIds();
      ChatRoom exist = roomService.getRoomAlreadyExist(memberIds,RoomType.oneOn1);
      if(Objects.nonNull(exist)){
        return exist.getRoomNum();
      }

      roomRequest.setRoomName(byId.getNickname() + ", " + byId2.getNickname() + " 간의 대화");
    }else {
      roomRequest.getMemberIds().add(memberId);
      roomRequest.setSenderMemberId(memberId);
    }

    return chatService.register(roomRequest, memberId);
  }

  @PostMapping("/chat/room/invite")
  public void invite(
      Authentication authentication,
      @RequestBody ChatRoomInviteRequest chatRoomInviteRequest

  ) throws Exception {
    String memberId = authService.getMemberId(authentication);


  }

  @DeleteMapping ("/chat/room/{roomNum}")
  public void delete(
      Authentication authentication,
      @PathVariable Long roomNum

  ) throws Exception {
    String memberId = authService.getMemberId(authentication);
    messageService.deleteRoomNum(roomNum);

  }

  @PostMapping ("/chat/room/{roomNum}/out")
  public void out(
      Authentication authentication,
      @PathVariable Long roomNum

  ) throws Exception {
    String memberId = authService.getMemberId(authentication);
    chatMemberService.deleteMemberRoom(roomNum,memberId);
    messageService.getOutRoomMessage(roomNum,memberId);

  }

}
