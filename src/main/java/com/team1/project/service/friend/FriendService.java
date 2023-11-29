package com.team1.project.service.friend;

import com.team1.project.dao.FriendDAO;
import com.team1.project.dto.FriendDTO;
import com.team1.project.dto.FriendRequestDTO;
import com.team1.project.entity.Alim;
import com.team1.project.entity.AlimContentEnum;
import com.team1.project.entity.Friend;
import com.team1.project.entity.FriendRequest;
import com.team1.project.service.alim.AlimSendService;
import com.team1.project.service.alim.AlimService;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import javax.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@RequiredArgsConstructor
@Service
public class FriendService {

  private final FriendDAO friendDAO;

  private final AlimService alimService;
  private final AlimSendService alimSendService;

  @Transactional
  public void requestFriend(String receiveMemberId, String sendMemberId){
    //String receiveMemberId, String sendMemberId
    FriendRequest request = friendDAO.findByReceiveMemberIdAndSendMemberId(Map.of("receiveMemberId",receiveMemberId, "sendMemberId", sendMemberId));

    if(Objects.isNull(request)){
      friendDAO.save(
          FriendRequest.builder()
              .receiveMemberId(receiveMemberId)
              .sendMemberId(sendMemberId)
              .reqDate(LocalDateTime.now())
              .acceptYn("N")
              .build()
      );

      Alim alim = Alim.builder()
          .receiveMemberId(receiveMemberId)
          .sendMemberId(sendMemberId)
          .content(AlimContentEnum.FRIEND_REQ)
          .url("/friend/req")
          .thumbnailUrl("")
          .readYn("N")
          .createTime(new Date())
          .build();
      alimService.registerAlim(alim);
      alimSendService.sendAlim(alim.toDTO());
    }
  }

  public List<FriendRequest> getRequestList(String receiveMemberId) {
    return friendDAO.findByReceiveMemberId(receiveMemberId);
  }

  public List<FriendRequestDTO> getRequestDTOList(String receiveMemberId) {
    return friendDAO.getFriendRequest(receiveMemberId);
  }

  public List<FriendDTO> getFriendList(String memberId) {
    return friendDAO.getFriendList(memberId);
  }

  @Transactional
  public void acceptRequest(Long reqId) {
    FriendRequest byId = friendDAO.findById(reqId);
    if(Objects.nonNull(byId)){
      friendDAO.saveFriend(Friend.builder()
              .regId(byId.getReceiveMemberId())
              .resId(byId.getSendMemberId())
              .reqDate(byId.getReqDate())
              .resDate(LocalDateTime.now())
              .build());

      friendDAO.saveFriend(
          Friend.builder()
              .regId(byId.getSendMemberId())
              .resId(byId.getReceiveMemberId())
              .reqDate(LocalDateTime.now())
              .resDate(LocalDateTime.now())
              .build()
      );

      byId.setAcceptYn("Y");
      log.info("FriendRequest byId = {}", byId);
      friendDAO.updateRequest(byId);
    }
  }

  public void deleteFriend(Long friendId, String memberId) {

    FriendDTO friendInfo = friendDAO.getFriendInfo(friendId);
    // String regId, String resId
    FriendDTO res = friendDAO.getFriendInfoByRegIdResId(Map.of("regId",friendInfo.getRegId(),"resId",friendInfo.getResId()));

    friendDAO.deleteFriendId(res.getId());
    FriendDTO req = friendDAO.getFriendInfoByRegIdResId(Map.of("regId",friendInfo.getResId(),"resId",friendInfo.getRegId()));

    friendDAO.deleteFriendId(req.getId());

    //String regId, String resId
    friendDAO.deleteFriendReq(Map.of("regId",friendInfo.getRegId(), "resId", friendInfo.getResId()));
    friendDAO.deleteFriendReq(Map.of("regId",friendInfo.getResId(), "resId", friendInfo.getRegId()));
  }

  public void deleteRequest(Long reqId) {
    friendDAO.deleteFriendReqById(reqId);
  }
}
