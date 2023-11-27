package com.team1.project.service.chat;

import com.team1.project.dto.AlimDTO;
import com.team1.project.dto.MemberDTO;
import com.team1.project.dto.chat.ChatMember;
import com.team1.project.dto.chat.ChatMemberList;
import com.team1.project.dto.chat.message.ChatMessageRequest;
import com.team1.project.dto.chat.message.MessageType;
import com.team1.project.dto.chat.room.ChatRoom;
import com.team1.project.dto.chat.room.ChatRoomInviteRequest;
import com.team1.project.dto.chat.room.ChatRoomRequest;
import com.team1.project.dto.chat.room.RoomType;
import com.team1.project.entity.Alim;
import com.team1.project.entity.AlimContentEnum;
import com.team1.project.service.MemberService;
import com.team1.project.service.alim.AlimSendService;
import com.team1.project.service.alim.AlimService;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import javax.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class ChatService {
  private final ChatRoomService roomService;
  private final ChatMessageService messageService;
  private final ChatMemberService chatMemberService;

  private final MemberService memberService;

  private final AlimService alimService;
  private final AlimSendService alimSendService;

  @Transactional
  public Long register(ChatRoomRequest roomRequest, String excludeMemberId) {

    log.info("{}" ,roomRequest);
    ChatRoom room = roomService.register(roomRequest);
    chatMemberService.registerChatMember(ChatMemberList.builder()
            .memberIds(roomRequest.getMemberIds())
            .chatRoomNum(room.getRoomNum())
        .build());

    List<AlimDTO> list = new ArrayList<>();
    for(String memberId : roomRequest.getMemberIds()){
      if(memberId.equals(excludeMemberId)) continue;
      Alim n = Alim.builder()
          .readYn("N")
          .sendMemberId(roomRequest.getSenderMemberId())
          .receiveMemberId(memberId)
          .content(AlimContentEnum.CHAT_INVITE)
          .createTime(new Date())
          .build();
      alimService.registerChatAlim(n);
      list.add(n.toDTO());
    }

    alimSendService.sendAlims(list);

    return room.getRoomNum();

  }

  @Transactional
  public void invite(ChatRoomInviteRequest chatRoomInviteRequest, String excludeMemberId) {

    log.info("{}" ,chatRoomInviteRequest);
    ChatRoom roomById = roomService.getRoomById(chatRoomInviteRequest.getRoomNum());

    Long roomNum = null;
    List<AlimDTO> list= new ArrayList<>();

    if (roomById.getType().equals(RoomType.oneOn1)){

      List<ChatMember> chatMemberList = chatMemberService.getChatMemberList(roomById.getRoomNum());

      List<String> memberIds = getMemberIds(chatRoomInviteRequest, chatMemberList);
      List<String> nickNames = new ArrayList<>();

      for(String memberId : memberIds) {
        MemberDTO byId = memberService.findById(memberId);
        nickNames.add(byId.getNickname());
      }

      ChatRoomRequest chatRoomRequest = new ChatRoomRequest();
      chatRoomRequest.setRoomName(String.join(",",nickNames) +"과의 대화");
      chatRoomRequest.setRoomType(RoomType.group);
      chatRoomRequest.setSenderMemberId(excludeMemberId);
      chatRoomRequest.setMemberIds(memberIds);

      register(chatRoomRequest,excludeMemberId);

      for(String memberId : memberIds) {
        if(memberId.equals(excludeMemberId)) continue;
        Alim a = Alim.builder()
            .content(AlimContentEnum.CHAT_INVITE)
            .sendMemberId(excludeMemberId)
            .receiveMemberId(memberId)
            .readYn("N")
            .createTime(new Date())
            .build();
        alimService.registerAlim(a);
        list.add(a.toDTO());
      }

    } else {
      ChatMemberList dd = new ChatMemberList();
      dd.setMemberIds(chatRoomInviteRequest.getMemberIds());
      dd.setChatRoomNum(chatRoomInviteRequest.getRoomNum());

      chatMemberService.registerChatMember(dd);

      for(String memberId : chatRoomInviteRequest.getMemberIds()){
        messageService.sendMessage(ChatMessageRequest.builder()
            .roomNum(chatRoomInviteRequest.getRoomNum())
            .messageType(MessageType.ENTER)
            .memberId(memberId)
            .contents("none")
            .build());

        Alim a = Alim.builder()
            .content(AlimContentEnum.CHAT_INVITE)
            .sendMemberId(excludeMemberId)
            .receiveMemberId(memberId)
            .readYn("N")
            .createTime(new Date())
            .build();
        alimService.registerAlim(a);
        list.add(a.toDTO());
      }

    }


    alimSendService.sendAlims(list);

  }

  // 중복제거
  private static List<String> getMemberIds(ChatRoomInviteRequest chatRoomInviteRequest,
      List<ChatMember> chatMemberList) {
    List<String> originMemberIds = new ArrayList<>(
        chatMemberList.stream().map(ChatMember::getMemberId).toList());
    originMemberIds.addAll(chatRoomInviteRequest.getMemberIds());
    originMemberIds = new HashSet<>(originMemberIds).stream().toList();
    return originMemberIds;
  }

}
