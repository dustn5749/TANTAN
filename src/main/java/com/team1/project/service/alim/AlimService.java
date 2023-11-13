package com.team1.project.service.alim;

import com.team1.project.dao.AlimDAO;
import com.team1.project.dao.MemberDao;
import com.team1.project.dto.AlimDTO;
import com.team1.project.entity.Alim;
import com.team1.project.repository.AlimRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AlimService {
    private final AlimRepository alimRepository;
    private final AlimDAO alimDAO;
    private final MemberDao memberDao;

    @Transactional
    public void registerAlim(Alim alim){
        alimRepository.save(alim);
    }


    public List<AlimDTO> getAlimListByReceiveMember(String memberId){

        return alimDAO.getAlimListByReceiveMember(memberId);
    }

    public Long getCount(String memberId) {
        return alimDAO.getCount(memberId);
    }


    @Transactional
    public void readAlimByMemberId(String memberId) {
        alimDAO.updateReadYnByMemberId(memberId);
    }

    @Transactional
    public void readAlimByAlimId(Long alimId) {
        alimDAO.updateReadYnByAlimId(alimId);
    }




}
