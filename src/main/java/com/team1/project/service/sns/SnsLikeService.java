package com.team1.project.service.sns;

import com.team1.project.dao.AlimDAO;
import com.team1.project.entity.Alim;
import com.team1.project.entity.AlimContentEnum;
import com.team1.project.service.alim.AlimSendService;
import com.team1.project.service.alim.AlimService;
import com.team1.project.entity.SnsBoard;
import com.team1.project.entity.SnsLike;
import com.team1.project.repository.SnsBoardRepository;
import com.team1.project.repository.SnsLikeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.Optional;

@RequiredArgsConstructor // Lombok을 사용하여 생성자를 자동으로 생성
@Service
public class SnsLikeService {
    private final SnsLikeRepository snsLikeRepository;
    private final SnsBoardRepository snsBoardRepository;
    private final AlimDAO alimDAO;

    private final AlimService alimService;

    private final AlimSendService alimSendService;


    //게시물 등록
    @Transactional
    public void registerLike(Long boardNum, String memberId) {

        Optional<SnsLike> optionalSnsLike = snsLikeRepository.findById(SnsLike.SnsLikePK.builder().memberId(memberId).boardNum(boardNum).build());

        if(optionalSnsLike.isEmpty()){
            snsLikeRepository.save(
                    SnsLike.builder()
                            .boardNum(boardNum)
                            .memberId(memberId)
                            .build()); //게시물을 저장 또는 업데이트

            Optional<SnsBoard> byId = snsBoardRepository.findById(boardNum);
            byId.ifPresent( (value) -> {
                value.setLikeCount(snsLikeRepository.countByBoardNum(boardNum));

                if(!value.getMemberId().equals(memberId)){
                    Alim n = Alim.builder()
                            .sendMemberId(memberId)
                            .receiveMemberId(value.getMemberId())
                            .content(AlimContentEnum.LIKE)
                            .readYn("N")
                            .createTime(new Date())
                            .build();
                    alimService.registerAlim(n);
                    alimSendService.sendAlim(n.toDTO());
                }

            });

        } else {
            snsLikeRepository.deleteByMemberIdAndBoardNum(memberId,boardNum);
        }

    }

    public boolean isLikeBoard(Long boardNum, String memberId) {

        return snsLikeRepository.existsByMemberIdAndBoardNum(memberId,boardNum);
    }



}
