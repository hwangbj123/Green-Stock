package com.green.greenstock.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.greenstock.dto.AdvisorReqDto;
import com.green.greenstock.handler.exception.CustomRestfulException;
import com.green.greenstock.handler.exception.UnAuthorizedException;
import com.green.greenstock.repository.model.User;
import com.green.greenstock.service.AdvisorService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/advisor")
public class AdvisorController {

    @Autowired
    private final HttpSession httpSession;

    private final AdvisorService advisorService;

    // 목록
    @GetMapping("/list")
    public String advisorList(Model model) {
        model.addAttribute("advisorResDtos", advisorService.findByStatusAuth(2));
        return "advisor/advisorList";
    }

    // 세부사항
    @GetMapping("/{nickName}")
    public String advisorDetail(@PathVariable String nickName, Model model) {
        model.addAttribute("advisor", advisorService.findByAdvisorNickName(nickName));
        return "advisor/advisorDetail";
    }

    // 전문가 신청페이지
    @GetMapping("/register")
    public String advisorRegister() {

        return "advisor/advisorRegister";
    }

    
    /**
     * 전문가 신청 기능
     * @param advisorReqDto
     * @return 전문가 목록 페이지
     */
    @PostMapping("/register")
    public String advisorRegisterProc(AdvisorReqDto advisorReqDto) {
        if(advisorReqDto == null){
            throw new CustomRestfulException("잘못된 입력입니다.", HttpStatus.BAD_REQUEST);
        }
        // 유저 아이디 가져오기
        // User user = (User) httpSession.getAttribute("principal");
        
        // if(user == null){
        //     throw new UnAuthorizedException("로그인이 필요합니다.", HttpStatus.UNAUTHORIZED);
        // }
        
        // 유저 아이디 set
        // advisorReqDto.setUserId(user.getId());
        advisorReqDto.setUserId(1);

        // 서비스 호출
        advisorService.saveAdvisor(advisorReqDto);

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
