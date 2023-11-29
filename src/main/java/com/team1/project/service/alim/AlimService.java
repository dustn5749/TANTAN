package com.team1.project.service.alim;

import com.team1.project.dao.AlimDAO;
import com.team1.project.dao.MemberDao;
import com.team1.project.dto.AlimDTO;
import com.team1.project.entity.Alim;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@RequiredArgsConstructor
public class AlimService {

  // 알림 정보를 저장하고 조회
  // private final AlimRepository alimRepository;
  // 알림 관련 데이터 액세스를 수행하는 DAO
  private final AlimDAO alimDAO;
  // 회원 정보 조회
  private final MemberDao memberDao;

  // 알림 등록
  @Transactional
  public void registerAlim(Alim alim) {
    log.info("alim = {}" , alim);
     alimDAO.save(alim);
  }

  //특정 회원이 받은 알림 목록을 조회
  public List<AlimDTO> getAlimListByReceiveMember(String memberId) {
    return alimDAO.getAlimListByReceiveMember(memberId);
  }

  //받은 알림의 개수 조회
  public Long getCount(String memberId) {
    return alimDAO.getCount(memberId);
  }

  //받은 알림을 읽은 상태로 처리
  @Transactional
  public void readAlimByMemberId(String memberId) {
    alimDAO.updateReadYnByMemberId(memberId);
  }

  //특정 알림을 읽은 상태로 처리
  @Transactional
  public void readAlimByAlimId(Long alimId) {
    alimDAO.updateReadYnByAlimId(alimId);
  }

  public void registerChatAlim(Alim n) {
  }
}
