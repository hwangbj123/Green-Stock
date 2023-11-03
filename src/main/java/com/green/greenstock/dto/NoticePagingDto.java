package com.green.greenstock.dto;

import lombok.Data;

@Data
public class NoticePagingDto {
    /* 시작 페이지 */
    private int startPage;

    /* 끝 페이지 */
    private int endPage;

    /* 이전 페이지, 다음 페이지 존재유무 */
    private boolean prev, next;

    /* 전체 게시물 수 */
    private int total;

    /* 현재 페이지, 페이지당 게시물 표시수 정보 */
    private Criteria cri;

    public void calculatePaging() {
        int totalPages = (int) Math.ceil((double) total / cri.getPerPage());
        int pageRange = 10; // 페이지 범위 설정 (예: 10 페이지씩)

        int currentPage = cri.getPageNum();
        int startPage = (int) Math.floor((currentPage - 1) / pageRange) * pageRange + 1;
        int endPage = startPage + pageRange - 1;

        if (endPage > totalPages) {
            endPage = totalPages;
        }

        this.startPage = startPage;
        this.endPage = endPage;

        this.prev = startPage > 1;
        this.next = endPage < totalPages;
    }
}
