package com.green.greenstock.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.green.greenstock.repository.model.Advisor;

@Mapper
public interface AdvisorRepository {

	Advisor findById(int advisorId);
    
}
