package com.green.greenstock.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AdvisorBoardResDto {

    private int advisorBoardId;
    private String title;
    private String content;
    private int parent;
    private String createdAt;
    private int userId;
    private String userName;
    private int advisorId;
    private String advisorNickname;
    private int views;

}
