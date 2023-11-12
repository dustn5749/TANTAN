package com.team1.project.dao;

import com.team1.project.dto.AlimDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AlimDAO {

    List<AlimDTO> getAlimListByReceiveMember(String memberId);
    /// AlimDTO getAlimDTO(String memberId);

    Long getCount(String memberId);

    void updateReadYnByMemberId(String memberId);

    void updateReadYnByAlimId(Long alimId);
}
