package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.greenstock.repository.model.Advisor;

@Mapper
public interface AdvisorRepository {

    Advisor findById(int advisorId);

    List<Advisor> findAll();

    List<Advisor> findByStatus(int status);

    void updateStatus(@Param("advisorId") int advisorId,@Param("status") int status);

    List<Advisor> selectAdvisorList(int stauts);
    
}
