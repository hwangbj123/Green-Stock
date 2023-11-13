package com.green.greenstock.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.greenstock.dto.AdvisorBoardReqDto;
import com.green.greenstock.dto.AdvisorBoardReplyResDto;
import com.green.greenstock.dto.AdvisorBoardResDto;
import com.green.greenstock.dto.AdvisorReqDto;
import com.green.greenstock.dto.AdvisorResDto;
import com.green.greenstock.handler.exception.CustomRestfulException;
import com.green.greenstock.handler.exception.PageNotFoundException;
import com.green.greenstock.repository.entity.AdvisorBoardEntity;
import com.green.greenstock.repository.model.AdvisorBoard;
import com.green.greenstock.repository.model.User;
import com.green.greenstock.service.AdvisorService;
import com.green.greenstock.service.UserService;
import com.green.greenstock.utils.Pagination;

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

    private final int PAGE_SIZE = 10;

    // 전문가 목록
    @GetMapping(value = { "/", "/list" })
    public String advisorList(Model model) {
        model.addAttribute("advisorResDtos", advisorService.findByStatusAuth(2));
        return "advisor/advisorList";
    }

    // 전문가 세부사항
    @GetMapping("/{nickName}")
    public String advisorDetail(@PathVariable String nickName, Model model) {

        User user = (User) httpSession.getAttribute("principal");
        log.info("user {}", user);
        if (user != null) {
            // log.info("id {}",user.getId());
            boolean validateResult = advisorService.validateSubscribeToAdvisor(nickName, user.getId());
            model.addAttribute("validate", validateResult);
            log.info("bool {}", validateResult);
        }

        if (nickName == null) {
            throw new PageNotFoundException("페이지를 찾지 못했습니다.", "/advisor/list");
        }

        // boolean validateResult = advisorService.validateSubscribeToAdvisor(advisorId,
        // id);

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

    // 전문가 상담게시판 목록 페이지
    @GetMapping("/sub/board/{advisorNickName}")
    public String advisorBoardList(Model model, @PathVariable String advisorNickName,
            @RequestParam(defaultValue = "1") int page) {
        int pageReq = page - 1;
        PageRequest pageRequest = PageRequest.of(pageReq, PAGE_SIZE, Sort.by("createdAt").descending());
        Page<AdvisorBoardResDto> advisorBoardResDtos = advisorService.findByAdvisorEntityAndParent(advisorNickName, 0,
                pageRequest);
        Long total = advisorBoardResDtos.getTotalElements();

        Pagination pagination = new Pagination(total.intValue(), page, advisorBoardResDtos.getSize());

        model.addAttribute("page", advisorBoardResDtos);
        model.addAttribute("pagination", pagination);
        return "advisor/advisorBoardList";
    }

    // 전문가 상담게시판 글 보기 페이지
    @GetMapping("/sub/board/{advisorNickName}/{advisorBoardId}")
    public String advisorBoard(Model model, @PathVariable String advisorNickName, @PathVariable int advisorBoardId) {
        
        // 게시글, 이전, 다음 페이지 정보
        AdvisorBoardResDto advisorBoardResDto = advisorService.findByAdvisorBoardId(advisorBoardId);
        model.addAttribute("advisorBoard", advisorBoardResDto);

        // 댓글
        PageRequest pageRequest = PageRequest.of(0, PAGE_SIZE, Sort.by("createdAt").ascending());

        Page<AdvisorBoardReplyResDto> replyDtos = advisorService.findByParent(advisorBoardId, pageRequest);

        Long total = replyDtos.getTotalElements();
        if (total > 0) {
            Pagination pagination = new Pagination(total.intValue(), 1, 10);
            model.addAttribute("pagination", pagination);
            model.addAttribute("reply", replyDtos);
        }

        model.addAttribute("replyTotal", total);
        return "advisor/advisorBoard";
    }

    /* 댓글 영역 */
    // 댓글 불러오기(ajax - json)
    @ResponseBody
    @GetMapping("/sub/board/{advisorNickName}/reply/{parent}/{page}")
    public Page<AdvisorBoardReplyResDto> advisorBoardReplyList(@PathVariable int parent, @PathVariable int page) {
        PageRequest pageRequest = PageRequest.of(page - 1, PAGE_SIZE, Sort.by("createdAt").ascending()); // 0이 시작 페이지
        return advisorService.findByParent(parent, pageRequest);
    }

    // 댓글 작성
    @ResponseBody
    @PostMapping("/sub/board/{advisorNickName}/reply")
    public Map<String, Integer> addAdvisorBoardReply(@RequestBody AdvisorBoardReqDto advisorBoardReqDto) {

        AdvisorBoardEntity advisorBoardEntity = advisorService.saveAdvisorBoard(advisorBoardReqDto);

        PageRequest pageRequest = PageRequest.of(0, PAGE_SIZE, Sort.by("createdAt").ascending());
        Page<AdvisorBoardReplyResDto> replyDtos = advisorService.findByParent(advisorBoardReqDto.getParent(),
                pageRequest);
        int totalPages = replyDtos.getTotalPages();

        Map<String, Integer> resultMap = new HashMap<>();
        resultMap.put("advisorBoardId", advisorBoardEntity.getAdvisorBoardId());
        resultMap.put("totalPages", totalPages);
        return resultMap;
    }

    // 댓글 삭제
    @ResponseBody
    @DeleteMapping("/sub/board/{advisorNickName}/{advisorBoardId}")
    public Map<String, Integer> deleteAdvisorBoard(@PathVariable int advisorBoardId) {

        int result = advisorService.deleteAdvisorBoard(advisorBoardId);
        Map<String, Integer> resultMap = new HashMap<>();
        resultMap.put("result", result);
        return resultMap;
    }

    /* 댓글 영역 끝 */

    
    // 전문가 상담게시판 글 쓰기 페이지
    @GetMapping("/sub/board/{advisorNickName}/write")
    public String advisorBoardWrite(Model model, @PathVariable String advisorNickName) {
        AdvisorResDto advisorResDto = advisorService.findByAdvisorNickName(advisorNickName);
        model.addAttribute("advisor", advisorResDto);
        return "advisor/advisorBoardWrite";
    }

    // 전문가 상담게시판 글 쓰기 기능
    @PostMapping("/sub/board/{advisorNickName}/write")
    public String advisorBoardWriteProc(@PathVariable String advisorNickName, AdvisorBoardReqDto advisorBoardReqDto) {
        if(advisorBoardReqDto == null){
            throw new CustomRestfulException("잘못된 입력입니다.", HttpStatus.BAD_REQUEST);
        }
        if(advisorBoardReqDto.getAdvisorId() == 0 || advisorBoardReqDto.getUserId() == 0){
            throw new CustomRestfulException("잘못된 입력입니다.", HttpStatus.BAD_REQUEST);
        }
        
        AdvisorBoardEntity advisorBoardEntity = advisorService.saveAdvisorBoard(advisorBoardReqDto);

        return "redirect:/advisor/sub/board/" + advisorNickName + "/" + advisorBoardEntity.getAdvisorBoardId();
    }

    // 전문가 상담게시판 글 수정 페이지
    @GetMapping("/sub/board/{advisorNickName}/update/{advisorBoardId}")
    public String advisorBoardUpdate(Model model, @PathVariable int advisorBoardId){
        AdvisorBoardResDto advisorBoardResDto = advisorService.findByAdvisorBoardId(advisorBoardId);
        model.addAttribute("advisorBoard", advisorBoardResDto);
        return "advisor/advisorBoardUpdate";
    }

    // 전문가 상담게시판 글 수정 기능
    @PostMapping("/sub/board/{advisorNickName}/update")
    public String advisorBoardUpdateProc(@PathVariable String advisorNickName, AdvisorBoardReqDto advisorBoardReqDto) {
                
        advisorService.updateAdvisorBoard(advisorBoardReqDto);
        return "redirect:/advisor/sub/board/"+advisorNickName+"/"+advisorBoardReqDto.getAdvisorBoardId();
    }

    // 전문가 상담게시판 글 삭제 기능
    @GetMapping("/sub/board/{advisorNickName}/delete/{advisorBoardId}")
    public String advisorBoardDelete(@PathVariable String advisorNickName, @PathVariable int advisorBoardId) {
        // 게시글, 댓글 삭제
        advisorService.deleteAdvisorBoard(advisorBoardId);
        return "redirect:/advisor/sub/board/" + advisorNickName;
    }

    // 구독한 사용자인지 체크
    // @ResponseBody
    // @GetMapping("/validate")
    // public Map<String, Integer> validateSubscribeToAdvisor(int advisorId, int
    // userId){
    // boolean validateResult = advisorService.validateSubscribeToAdvisor(advisorId,
    // userId);
    // Map<String, Integer> resultMap = new HashMap<>();

    // if(validateResult){
    // resultMap.put("result", 1);

    // }else{
    // resultMap.put("result", 0);

    // }

    // return resultMap;

    // }

}
