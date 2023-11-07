package com.green.greenstock.service;

import org.springframework.stereotype.Service;

import com.green.greenstock.repository.interfaces.AdvisorBoardRepository;
import com.green.greenstock.repository.interfaces.AdvisorRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class AdvisorService {

    private final AdvisorRepository advisorRepository;
    private final AdvisorBoardRepository advisorBoardRepository;

    // 목록(사용자)
    public void findAll() {
    }

    // 보기(사용자)
    public void findByAdvisorId() {
    }

    // 신청(사용자)
    public void saveAdvisor() {
    }

    //

}
