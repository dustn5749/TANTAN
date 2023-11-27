package com.team1.project.service.sns;

import com.team1.project.config.NCloudConfig;
import com.team1.project.dao.sns.SnsDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class SnsProfileService {

  private final SnsDAO snsDAO;
  public void updateProfileImg(String memberId, String key) {
    snsDAO.updateProfile(memberId, NCloudConfig.DOWNLOAD_END_POINT+key);
  }
}
