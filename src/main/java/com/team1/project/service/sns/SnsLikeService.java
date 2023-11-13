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
    	//좋아요를 등록한 회원과 게시물 번호를 기준으로 좋아요 엔터티를 조회
        Optional<SnsLike> optionalSnsLike = snsLikeRepository.findById(SnsLike.SnsLikePK.builder().memberId(memberId).boardNum(boardNum).build());

        if(optionalSnsLike.isEmpty()){
        	// 좋아요가 등록되어 있지 않은 경우, 새로운 좋아요를 등록
            snsLikeRepository.save(
                    SnsLike.builder()
                            .boardNum(boardNum)
                            .memberId(memberId)
                            .build()); //게시물을 저장 또는 업데이트
         // 게시물 번호를 기준으로 해당 게시물을 조회
            Optional<SnsBoard> byId = snsBoardRepository.findById(boardNum);
            
            byId.ifPresent( (value) -> {
            	// 해당 게시물의 좋아요 개수를 업데이트
                value.setLikeCount(snsLikeRepository.countByBoardNum(boardNum));
                
             // 좋아요를 등록한 회원이 게시물 작성자가 아닌 경우, 알림을 생성하고 전송
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
        	 // 이미 좋아요가 등록되어 있는 경우, 좋아요를 취소
            snsLikeRepository.deleteByMemberIdAndBoardNum(memberId,boardNum);
        }

    }
    // 특정 회원이 특정 게시물에 대해 좋아요를 등록했는지 여부를 확인
    public boolean isLikeBoard(Long boardNum, String memberId) {

        return snsLikeRepository.existsByMemberIdAndBoardNum(memberId,boardNum);
    }



}
