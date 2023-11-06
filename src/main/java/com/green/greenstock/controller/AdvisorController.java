package com.green.greenstock.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/advisor")
public class AdvisorController {

    // 목록
    @GetMapping("/list")
    public String advisorList() {
        return "advisor/advisorList";
    }

    // 세부사항
    @GetMapping("/{advisorNickName}")
    public String advisorDetail(@PathVariable int advisorId) {

        return "advisor/advisorDetail";
    }

    // 전문가 신청페이지
    @GetMapping("/register")
    public String advisorRegister() {

        return "advisor/advisorRegister";
    }

    // 전문가 신청하기 기능
    @PostMapping("/register")
    public String advisorRegisterProc() {

        return "redirect:/advisor/list";
    }

    // 전문가 상담게시판 목록 페이지
    @GetMapping("/board/{advisorId}")
    public String advisorBoardList(@PathVariable String advisorId) {
        return "advisor/advisorBoardList";
    }

    // 전문가 상담게시판 글 보기 페이지
    @GetMapping("/board/{advisorId}/{advisorBoardId}")
    public String advisorBoard(@PathVariable String advisorId, @PathVariable int advisorBoardId) {
        return "advisor/advisorBoard";
    }

    // 전문가 상담게시판 글 쓰기 페이지
    @GetMapping("/board/{advisorId}/write")
    public String advisorBoardWrite() {

        return "advisor/";
    }

    // 전문가 상담게시판 글 쓰기 기능
    @PostMapping("/board/{advisorId}/write")
    public String advisorBoardWriteProc(@PathVariable String advisorId) {
        int advisorBoardId = 1;
        advisorId = "tom";
        return "redirect:/advisor/board/" + advisorId + "/" + advisorBoardId;
    }

    // 전문가 상담게시판 글 수정 기능
    @PutMapping("/board/{advisorId}/{advisorBoardId}")
    public Map<String, String> advisorBoardUpdateProc(@PathVariable String advisorId,
            @PathVariable int advisorBoardId) {

        return null;
    }

    // 전문가 상담게시판 글 삭제 기능
    @GetMapping("/board/{advisorId}/{advisorBoardId}/delete")
    public String advisorBoardDelete(@PathVariable String advisorId, @PathVariable int advisorBoardId) {

        return "redirect:/advisor/advisorBoard/" + advisorId;
    }

}
