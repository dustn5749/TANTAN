package com.team1.project.entity;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SnsLike {
    private String memberId;
    private Long boardNum;
    private Date regDate;
}
