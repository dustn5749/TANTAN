package com.team1.project.controller.chat;

import com.team1.project.dto.chat.message.ChatMessageDTO;
import com.team1.project.dto.chat.room.ChatRoom;
import com.team1.project.dto.chat.room.ChatRoomDTO;
import com.team1.project.dto.chat.room.RoomType;
import com.team1.project.service.auth.AuthService;
import com.team1.project.service.chat.ChatMemberService;
import com.team1.project.service.chat.ChatMessageService;
import com.team1.project.service.chat.ChatRoomService;
import com.team1.project.dto.chat.message.GetMessageRequest;
import com.team1.project.service.friend.FriendService;
import java.util.Collections;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@RequiredArgsConstructor
@Controller
public class ChatPageController {

  private final AuthService authService;
  private final ChatRoomService chatRoomService;
  private final ChatMessageService messageService;
  private final ChatMemberService chatMemberService;

  private final FriendService friendService;
  @GetMapping("/page/chat/modal")
  public String modalPage(Authentication authentication){

    String memberId = authService.getMemberId(authentication);

    return "chat-modal";
  }

  @GetMapping("/page/chat/detail/{chatRoomId}")
  public String detailPage(Authentication authentication,
      HttpServletRequest request,
      @PathVariable Long chatRoomId
  ){

    String memberId = authService.getMemberId(authentication);
    request.setAttribute("roomId",chatRoomId);

    GetMessageRequest getMessageRequest = new GetMessageRequest();
    getMessageRequest.setRoomNum(chatRoomId);
    List<ChatMessageDTO> list = messageService.getList(getMessageRequest);

    Collections.reverse(list);

    log.info("messageDto list = {}", list);

    request.setAttribute("chatItemList", list);
    request.setAttribute("chatRoom", chatRoomService.getRoomById(chatRoomId));

    return "chat-detail";
  }

  @GetMapping("/page/chat/1on1")
  public String oneOn1Page(Authentication authentication,
      @RequestParam(required = false) String searchTxt,
      HttpServletRequest request){

    log.info("/page/chat/1on1");
    String memberId = authService.getMemberId(authentication);
    request.setAttribute("chatRoomList",chatRoomService.getRoomList(memberId, searchTxt ,RoomType.oneOn1));

    return "chat-1on1";
  }

  @GetMapping("/page/chat/group")
  public String groupPage(Authentication authentication,
      @RequestParam(required = false) String searchTxt,
    HttpServletRequest request){
    log.info("/page/chat/group");
    String memberId = authService.getMemberId(authentication);
    request.setAttribute("chatRoomList",chatRoomService.getRoomList(memberId, searchTxt,RoomType.group));

    return "chat-group";
  }

  @GetMapping("/page/chat/invite")
  public String invitePage(HttpServletRequest request, Authentication authentication){

    String memberId = authService.getMemberId(authentication);

    request.setAttribute("friendList", friendService.getFriendList(memberId));

    return "chat-invite";
  }

  @GetMapping("/page/chat/exit")
  public String exitPage(
      @RequestParam Long roomNum,
      Authentication authentication,
      HttpServletRequest request
      ){

    String memberId = authService.getMemberId(authentication);
    request.setAttribute("chatRoom", chatRoomService.getRoomById(roomNum));

    return "chat-exit";
  }

  @GetMapping("/page/chat/participant")
  public String participantPage(
      @RequestParam Long roomNum,
      Authentication authentication,
      HttpServletRequest request
  ){

    String memberId = authService.getMemberId(authentication);

    ChatRoom roomById = chatRoomService.getRoomById(roomNum);

    ChatRoomDTO dto = roomById.toDto();
    dto.setChatters(chatMemberService.getChatMemberList(roomNum));

    request.setAttribute("chatRoom", dto);
    return "chat-participant";
  }
}