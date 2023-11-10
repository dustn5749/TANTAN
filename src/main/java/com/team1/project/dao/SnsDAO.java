package com.team1.project.dao;

import com.team1.project.dto.SnsBoardDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SnsDAO {

    List<SnsBoardDTO> getBoardList();
}
