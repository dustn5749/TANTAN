package com.team1.project.service.friend;

import com.team1.project.dao.FriendDAO;
import com.team1.project.dto.FriendDTO;
import com.team1.project.dto.FriendRequestDTO;
import com.team1.project.entity.Alim;
import com.team1.project.entity.AlimContentEnum;
import com.team1.project.entity.Friend;
import com.team1.project.entity.FriendRequest;
import com.team1.project.repository.FriendRepository;
import com.team1.project.repository.FriendRequestRepository;
import com.team1.project.service.alim.AlimSendService;
import com.team1.project.service.alim.AlimService;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import javax.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@RequiredArgsConstructor
@Service
public class FriendService {

  private final FriendRequestRepository friendRequestRepository;
  private final FriendRepository friendRepository;

  private final FriendDAO friendDAO;

  private final AlimService alimService;
  private final AlimSendService alimSendService;

  @Transactional
  public void requestFriend(String receiveMemberId, String sendMemberId){

    Optional<FriendRequest> optional = friendRequestRepository.findByReceiveMemberIdAndSendMemberId(
        receiveMemberId, sendMemberId);

    if(optional.isEmpty()){
      friendRequestRepository.save(
          FriendRequest.builder()
              .receiveMemberId(receiveMemberId)
              .sendMemberId(sendMemberId)
              .reqDate(LocalDate.now())
              .acceptYn("N")
              .build()
      );

      Alim alim = Alim.builder()
          .receiveMemberId(receiveMemberId)
          .sendMemberId(sendMemberId)
          .content(AlimContentEnum.FRIEND_REQ)
          .readYn("N")
          .createTime(new Date())
          .build();
      alimService.registerAlim(alim);
      alimSendService.sendAlim(alim.toDTO());
    }
  }

  public List<FriendRequest> getRequestList(String receiveMemberId) {
    return friendRequestRepository.findByReceiveMemberId(receiveMemberId);
  }

  public List<FriendRequestDTO> getRequestDTOList(String receiveMemberId) {
    return friendDAO.getFriendRequest(receiveMemberId);
  }

  public List<FriendDTO> getFriendList(String memberId) {
    return friendDAO.getFriendList(memberId);
  }

  @Transactional
  public void acceptRequest(Long reqId) {
    Optional<FriendRequest> byId = friendRequestRepository.findById(reqId);
    byId.ifPresent(value -> {

      friendRepository.save(
          Friend.builder()
              .regId(value.getReceiveMemberId())
              .resId(value.getSendMemberId())
              .reqDate(value.getReqDate())
              .resDate(LocalDate.now())
              .build()
      );

      friendRepository.save(
          Friend.builder()
              .regId(value.getSendMemberId())
              .resId(value.getReceiveMemberId())
              .reqDate(LocalDate.now())
              .resDate(LocalDate.now())
              .build()
      );

      value.setAcceptYn("Y");
      friendRequestRepository.save(value);
    });
  }
}
