package com.team1.project.sns.board.entity;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import java.io.Serializable;
import java.util.Date;

@Setter
@Getter
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@IdClass(SnsLike.SnsLikePK.class)
public class SnsLike {
    //https://abbo.tistory.com/329
    @Id
    private Long memberId;

    @Id
    private Long boardNum;

    private Date regDate;

    @Setter
    @Getter
    public static class SnsLikePK implements Serializable {
        private Long memberId;
        private Long boardNum;
    }

}
