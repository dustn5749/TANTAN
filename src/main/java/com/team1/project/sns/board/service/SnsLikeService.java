package com.team1.project.sns.board.service;

import com.team1.project.sns.board.entity.SnsBoard;
import com.team1.project.sns.board.entity.SnsLike;
import com.team1.project.sns.board.repository.SnsBoardRepository;
import com.team1.project.sns.board.repository.SnsLikeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor // Lombok을 사용하여 생성자를 자동으로 생성
@Service
public class SnsLikeService {
    private final SnsLikeRepository snsLikeRepository;
    private final SnsBoardRepository snsBoardRepository;


    //게시물 등록
    @Transactional
    public void registerLike(Long boardNum, Long memberId) {

        snsLikeRepository.save(
                SnsLike.builder()
                        .boardNum(boardNum)
                        .memberId(memberId)
                        .build()); //게시물을 저장 또는 업데이트

        Optional<SnsBoard> byId = snsBoardRepository.findById(boardNum);
        byId.ifPresent( (value) -> value.setLikeCount(snsLikeRepository.countByBoardNum(boardNum)));
    }

    public boolean isLikeBoard(Long boardNum, Long memberId) {

        return snsLikeRepository.existsByMemberIdAndBoardNum(memberId,boardNum);
    }



}
