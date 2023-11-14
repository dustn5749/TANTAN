package com.team1.project.dao;

import com.team1.project.dto.FriendRequestDTO;
import com.team1.project.dto.SnsBoardDTO;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FriendDAO {

    List<FriendRequestDTO> getFriendRequest(String memberId);
}
