package com.team1.project.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.team1.project.entity.AlimContentEnum;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.text.SimpleDateFormat;
import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AlimDTO {
    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    private Long alimId;
    private String url;
    private String sendMemberId;
    private String receiveMemberId;
    private String content;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date createTime;
    public String getTime(){
        return sdf.format(createTime);
    }

    private String readYn;
    private String nickname;
    private String profileImg;
    private String thumbnailUrl;
    public String getContent(){
        return AlimContentEnum.valueOf(content).getTemplate();
    }
    public String getRealContent(){
        return AlimContentEnum.valueOf(content).name();
    }


}
