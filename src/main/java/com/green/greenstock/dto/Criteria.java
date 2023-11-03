package com.green.greenstock.dto;

import lombok.Data;

@Data
public class Criteria {
    private int pageNum;  // 현재 페이지 번호
    private int perPage;  // 페이지당 표시 아이템 수

    public Criteria() {
        this.pageNum = 1;
        this.perPage = 10; // 기본값으로 10 아이템을 한 페이지에 표시
    }

    public int getOffset() {
        return (pageNum - 1) * perPage; // 데이터베이스에서 조회할 때 사용할 오프셋을 계산
    }
}
