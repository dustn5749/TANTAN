package com.team1.project.dao;

import com.team1.project.dto.AlimDTO;
import com.team1.project.entity.Alim;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AlimDAO {

  List<AlimDTO> getAlimListByReceiveMember(String memberId);
  /// AlimDTO getAlimDTO(String memberId);

  Long getCount(String memberId);

  void updateReadYnByMemberId(String memberId);

  void updateReadYnByAlimId(Long alimId);

  void save(Alim alim);
}
