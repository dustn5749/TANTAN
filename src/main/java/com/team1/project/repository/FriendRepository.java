package com.team1.project.repository;

import com.team1.project.entity.Friend;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FriendRepository extends JpaRepository<Friend,Long> {

  List<Friend> findByResId(String resId);
}
