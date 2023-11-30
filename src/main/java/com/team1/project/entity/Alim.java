package com.team1.project.entity;

import com.team1.project.dto.AlimDTO;
import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Alim {

    private Long alimId;
    private String url;
    private String sendMemberId;
    private String receiveMemberId;
    private AlimContentEnum content;
    private Date createTime;
    private String readYn;
    private String thumbnailUrl;

    public AlimDTO toDTO(){
        return AlimDTO.builder()
                .alimId(alimId)
                .url(url)
                .createTime(createTime)
                .receiveMemberId(receiveMemberId)
                .sendMemberId(sendMemberId)
                .content(content.name())
                .thumbnailUrl(thumbnailUrl)
                .build();
    }
}
