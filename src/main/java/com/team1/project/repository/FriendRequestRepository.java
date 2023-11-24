package com.team1.project.repository;

import com.team1.project.entity.FriendRequest;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FriendRequestRepository extends JpaRepository<FriendRequest, Long> {

  Optional<FriendRequest> findByReceiveMemberIdAndSendMemberId(String receiveMemberId, String sendMemberId);

  List<FriendRequest> findByReceiveMemberId(String receiveMemberId);
}