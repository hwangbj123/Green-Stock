package com.green.greenstock.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.green.greenstock.repository.model.Pay;

@Mapper
public interface PayRepository {
	public int insertPayInfo(Pay pay);

	public int modifyPayInfo(Pay pay);

	public Pay findPayInfoById(Integer id);
}
