
package com.team1.project.dto;

import java.util.List;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Root{
    public boolean success;
    public int totalCount;
    
    public List<AccompanyList> accompanyList;
}
