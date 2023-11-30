package com.team1.project.dao;

import com.team1.project.dto.FriendDTO;
import com.team1.project.dto.FriendRequestDTO;
import com.team1.project.dto.SnsBoardDTO;
import com.team1.project.entity.Friend;
import com.team1.project.entity.FriendRequest;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FriendDAO {

    List<FriendRequestDTO> getFriendRequest(String memberId);

    List<FriendDTO> getFriendList(String memberId);

    FriendRequest findByReceiveMemberIdAndSendMemberId(Map<String,Object> map);

    void save(FriendRequest n);

    List<FriendRequest> findByReceiveMemberId(String receiveMemberId);

    void saveFriend(Friend build);

    FriendRequest findById(Long reqId);

    void updateRequest(FriendRequest byId);

    FriendDTO getFriendInfo(Long friendId);

    FriendDTO getFriendInfoByRegIdResId(Map<String,Object> map);

    void deleteFriendId(Long friendId);

    void deleteFriendReq(Map<String,Object> map);

    void deleteFriendReqById(Long reqId);
}
