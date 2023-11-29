package com.team1.project.dao.sns;

import com.team1.project.dto.SnsBoardDTO;
import com.team1.project.entity.SnsBoard;
import com.team1.project.entity.SnsBoardFile;
import com.team1.project.service.sns.SnsBoardRequest;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SnsDAO {

  List<SnsBoardDTO> getBoardList(SnsBoardRequest request);

  List<SnsBoard> findAll(SnsBoardRequest request);

  void saveBoard(SnsBoard board);

  List<SnsBoard> findByDeleteYn(String n);

  SnsBoard findById(Long boardNum);

  void updateViewCountByBoardNum(Long id);

  void update(SnsBoard board);

  void saveFile(SnsBoardFile snsBoardFile);

  void updateProfile(Map<String,Object> map);

  List<SnsBoardFile> getFile(Long id);
}
