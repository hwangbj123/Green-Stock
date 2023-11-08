package com.green.greenstock;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.green.greenstock.repository.interfaces.AdvisorRepository;
import com.green.greenstock.repository.interfaces.UserEntityRepository;

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
