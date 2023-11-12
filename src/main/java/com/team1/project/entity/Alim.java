package com.team1.project.entity;

import com.team1.project.dto.AlimDTO;
import lombok.*;

import javax.persistence.*;
import java.util.Date;

@Entity
@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Alim {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ALIM_SEQ_GEN")
    @SequenceGenerator(sequenceName = "ALIM_SEQ", allocationSize = 1, name = "ALIM_SEQ_GEN")
    private Long alimId;
    private String url;
    private String sendMemberId;
    private String receiveMemberId;
    @Enumerated(EnumType.STRING)
    private AlimContentEnum content;
    private Date createTime;
    private String readYn;

    public AlimDTO toDTO(){
        return AlimDTO.builder()
                .alimId(alimId)
                .url(url)
                .createTime(createTime)
                .receiveMemberId(receiveMemberId)
                .sendMemberId(sendMemberId)
                .content(content.name())
                .build();
    }
}
