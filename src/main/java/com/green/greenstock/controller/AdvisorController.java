package com.green.greenstock.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.green.greenstock.dto.AdvisorReqDto;
import com.green.greenstock.handler.exception.CustomRestfulException;
import com.green.greenstock.handler.exception.PageNotFoundException;
import com.green.greenstock.repository.model.User;
import com.green.greenstock.service.AdvisorService;
import com.green.greenstock.service.UserService;

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
    private final UserService userService;

    // 목록
    @GetMapping(value = { "/", "/list" })
    public String advisorList(Model model) {
        model.addAttribute("advisorResDtos", advisorService.findByStatusAuth(2));
        return "advisor/advisorList";
    }

    // 세부사항
    @GetMapping("/{nickName}")
    public String advisorDetail(@PathVariable String nickName, Model model) {

        User user = (User)httpSession.getAttribute("principal");
        if(user != null){
            //log.info("id {}",user.getId());
            boolean validateResult = advisorService.validateSubscribeToAdvisor(nickName, user.getId());
            model.addAttribute("validate", validateResult);
        }
        
        

        if (nickName == null) {
            throw new PageNotFoundException("페이지를 찾지 못했습니다.", "/advisor/list");
        }

        //boolean validateResult = advisorService.validateSubscribeToAdvisor(advisorId, id);

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
     * 
     * @param advisorReqDto
     * @return 전문가 목록 페이지
     */
    @PostMapping("/register")
    public String advisorRegisterProc(AdvisorReqDto advisorReqDto) {
        if (advisorReqDto == null) {
            throw new CustomRestfulException("잘못된 입력입니다.", HttpStatus.BAD_REQUEST);
        }
        // 유저 아이디 가져오기
        User user = (User) httpSession.getAttribute("principal");

        // 유저 아이디 set
        advisorReqDto.setUserId(user.getId());

        // 서비스 호출
        advisorService.saveAdvisor(advisorReqDto);

        return "redirect:/advisor/list";
    }

    @GetMapping("/sub")
    public void sub() {
        throw new PageNotFoundException("페이지를 찾지 못했습니다.", "/advisor/list");
    }

    // 전문가 상담게시판 목록 페이지
    @GetMapping("/sub/board/{advisorNickName}")
    public String advisorBoardList(@PathVariable String advisorNickName) {

        return "advisor/advisorBoardList";
    }

    // 전문가 상담게시판 글 보기 페이지
    @GetMapping("/sub/board/{advisorNickName}/{advisorBoardId}")
    public String advisorBoard(@PathVariable String advisorNickName, @PathVariable int advisorBoardId) {
        return "advisor/advisorBoard";
    }

    // 전문가 상담게시판 글 쓰기 페이지
    @GetMapping("/sub/board/{advisorNickName}/write")
    public String advisorBoardWrite() {

        return "advisor/";
    }

    // 전문가 상담게시판 글 쓰기 기능
    @PostMapping("/sub/board/{advisorNickName}/write")
    public String advisorBoardWriteProc(@PathVariable String advisorNickName) {
        int advisorBoardId = 1;
        advisorNickName = "tom";
        return "redirect:/advisor/board/" + advisorNickName + "/" + advisorBoardId;
    }

    // 전문가 상담게시판 글 수정 기능
    @PutMapping("/sub/board/{advisorNickName}/{advisorBoardId}")
    public Map<String, String> advisorBoardUpdateProc(@PathVariable String advisorNickName,
            @PathVariable int advisorBoardId) {

        return null;
    }

    // 전문가 상담게시판 글 삭제 기능
    @GetMapping("/sub/board/{advisorNickName}/delete/{advisorBoardId}")
    public String advisorBoardDelete(@PathVariable String advisorNickName, @PathVariable int advisorBoardId) {

        return "redirect:/advisor/advisorBoard/" + advisorNickName;
    }


    // 구독한 사용자인지 체크
    // @ResponseBody
    // @GetMapping("/validate")
    // public Map<String, Integer> validateSubscribeToAdvisor(int advisorId, int userId){
    //     boolean validateResult = advisorService.validateSubscribeToAdvisor(advisorId, userId);
    //     Map<String, Integer> resultMap = new HashMap<>();

    //     if(validateResult){
    //         resultMap.put("result", 1);
            
    //     }else{
    //         resultMap.put("result", 0);

    //     }

    //     return resultMap;

    // }

}
