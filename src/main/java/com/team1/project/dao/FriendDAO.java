package com.team1.project.dao;

import com.team1.project.dto.FriendDTO;
import com.team1.project.dto.FriendRequestDTO;
import com.team1.project.dto.SnsBoardDTO;
import com.team1.project.entity.Friend;
import com.team1.project.entity.FriendRequest;
import java.util.List;
import java.util.Optional;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FriendDAO {

    List<FriendRequestDTO> getFriendRequest(String memberId);

    List<FriendDTO> getFriendList(String memberId);

    FriendRequest findByReceiveMemberIdAndSendMemberId(String receiveMemberId, String sendMemberId);

    void save(FriendRequest n);

    List<FriendRequest> findByReceiveMemberId(String receiveMemberId);

    void saveFriend(Friend build);

    FriendRequest findById(Long reqId);

    void updateRequest(FriendRequest byId);

    FriendDTO getFriendInfo(Long friendId);

    FriendDTO getFriendInfoByRegIdResId(String regId, String resId);

    void deleteFriendId(Long friendId);

    void deleteFriendReq(String regId, String resId);
}
