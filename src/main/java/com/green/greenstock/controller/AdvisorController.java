package com.green.greenstock.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/advisor")
public class AdvisorController {

    // 목록
    @GetMapping("/list")
    public String advisorList() {

        return "list";
    }

    // 세부사항
    @GetMapping("/{advisorId}")
    public String advisorDetail(@PathVariable int advisorId) {

        return "detail";
    }

    // 신청페이지
    @GetMapping("/register")
    public String advisorRegister() {

        return "register";
    }

    // 신청하기
    @PostMapping("/register")
    public String advisorRegisterProc() {

        return "registerProc";
    }

}
