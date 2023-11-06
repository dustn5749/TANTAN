package com.team1.project.sns.board.service;

import com.team1.project.sns.board.entity.SnsBoard;
import com.team1.project.sns.board.repository.SnsBoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@RequiredArgsConstructor // Lombok을 사용하여 생성자를 자동으로 생성
@Service
public class SnsBoardService {
    private final SnsBoardRepository snsBoardRepository;
    
    // 생성자 주입을 사용하여 'SnsBoardRepository'를 주입
    
    public List<SnsBoard> getList() {
    	// 모든 게시물 목록을 반환
        return snsBoardRepository.findAll();
    }
    //게시물 등록
    public void registerBoard(SnsBoard board) {

        if (board.getBoardNum() != null) {

        }
        snsBoardRepository.save(board); //게시물을 저장 또는 업데이트
        
    }

    public List<SnsBoard> getListNotDelete() {
    	// 삭제되지 않은 게시물 목록을 반환
        return snsBoardRepository.findByDeleteYn("N");

        // return snsBoardRepository.findByDeleteYnOrderByBoardNumDesc("N", );
    }

    public SnsBoard get(Long id) {
    	// 주어진 게시물 번호에 해당하는 게시물을 반환
    	// 게시물이 없는 경우 기본적으로 빈 'SnsBoard' 객체를 반환
        return snsBoardRepository.findById(id).orElse(new SnsBoard());
    }

    @Transactional
    public void viewCountUp(Long id) {
        snsBoardRepository.findById(id).ifPresent((value) -> snsBoardRepository.updateViewCountByBoardNum(id));
        // 'snsBoardRepository.updateViewCountByBoardNum(id)'를 호출하여 조회수를 업데이트
        // 'Transactional' 어노테이션이 사용되어 트랜잭션 처리가 이루어짐
    }
}
