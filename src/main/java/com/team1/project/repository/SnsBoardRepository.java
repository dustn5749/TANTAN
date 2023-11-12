package com.team1.project.repository;

import com.team1.project.entity.SnsBoard;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface SnsBoardRepository extends JpaRepository<SnsBoard, Long> {
	// 'SnsBoard' 엔티티와 관련된 JPA 리포지토리를 정의
	
	// 'deleteYn' 값에 따라 게시물을 조회하고 게시물 번호를 내림차순으로 정렬하여 리스트를 반환
    List<SnsBoard> findByDeleteYnOrderByBoardNumDesc(String deleteYn, Sort sort);

    //아래 와 같이 작성하면 위에서 JPA 구현체가 알아서 동작함
    // 게시물의 조회수를 증가시키는 쿼리
    //게시물 번호를 기반으로 조회수를 증가시키는 업데이트 쿼리를 실행
    @Transactional
    @Modifying
    @Query("update SnsBoard s set s.viewCount = s.viewCount+1 where s.boardNum = ?1")
    void updateViewCountByBoardNum(Long boardNum);
    
    // 'deleteYn' 값에 따라 게시물을 조회
    List<SnsBoard> findByDeleteYn(String deleteYn);
}
