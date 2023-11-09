package com.team1.project.sns.board.repository;

import com.team1.project.sns.board.entity.SnsLike;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SnsLikeRepository extends JpaRepository<SnsLike, SnsLike.SnsLikePK> {
    long countByBoardNum(Long boardNum);
    boolean existsByMemberIdAndBoardNum(Long memberId, Long boardNum);

}
