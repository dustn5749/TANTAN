package com.team1.project.dao.sns;

import com.team1.project.entity.SnsLike;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SnsLikeDAO {

  SnsLike findById(String memberId, Long boardNum);

  void save(SnsLike build);

  Long countByBoardNum(Long boardNum);

  void deleteByMemberIdAndBoardNum(Map<String,Object> map);

}
