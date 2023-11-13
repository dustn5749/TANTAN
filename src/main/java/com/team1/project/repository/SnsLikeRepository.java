package com.team1.project.repository;

import com.team1.project.entity.SnsLike;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SnsLikeRepository extends JpaRepository<SnsLike, SnsLike.SnsLikePK> {
    long deleteByMemberIdAndBoardNum(String memberId, Long boardNum);
    long countByBoardNum(Long boardNum);
    boolean existsByMemberIdAndBoardNum(String memberId, Long boardNum);

}
