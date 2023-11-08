package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.greenstock.repository.model.Advisor;

@Mapper
public interface AdvisorRepository {

    Advisor findById(int advisorId);

    List<Advisor> findAll();

    List<Advisor> findByStatus(int status);

}
