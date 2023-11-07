package com.green.greenstock;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.green.greenstock.repository.entity.UserEntity;
import com.green.greenstock.repository.interfaces.AdvisorRepository;
import com.green.greenstock.repository.interfaces.UserEntityRepository;
import com.green.greenstock.repository.model.Advisor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class GreenStockApplicationTests2 {

	@Autowired
	AdvisorRepository advisorRepository;

	@Autowired
	UserEntityRepository userEntityRepository;

//	@Test
//	@Transactional
//	void contextLoads() {	
//		UserEntity userEntity = userEntityRepository.findById(1).orElse(null);
//		
//		Advisor advisor = Advisor
//							.builder()
//							.advisor_full_name("full")
//							.advisor_nick_name("nick")
//							.career("나뭐")
//							.introduction("하이")
//							.userEntity(userEntity)
//							.build();
//		
//		advisorRepository.save(advisor);
//	}
}
