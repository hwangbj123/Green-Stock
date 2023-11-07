package com.green.greenstock.repository.model;

import java.time.LocalDateTime;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Advisor {

    private int advisorId;
    private String advisor_full_name;
    private String advisor_nick_name;
    private String career;
    private String introduction;
    private LocalDateTime createdAt;
    private int userId;

}
