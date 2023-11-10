package com.team1.project.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CityDTO {

	private int cityNum;
    private int doeNum;
    private String cityName;
    private String LATITUDE;
    private String LONGITUDE;
}
