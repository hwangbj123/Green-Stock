package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.greenstock.repository.model.AdvisorBoard;

@Mapper
public interface AdvisorBoardRepository {

    AdvisorBoard findById(int id);

    List<AdvisorBoard> findAll();
}
