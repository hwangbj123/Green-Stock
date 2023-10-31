package com.green.greenstock.service;

import com.green.greenstock.repository.model.User;

public interface MailSendServiceImpl {
	
	// 메일 발송
	String sendSimpleMessage(String to) throws Exception;

	// 임시 비밀번호 발송
	String sendTempPassword(String to) throws Exception;

	String sendUserId(String to, User user) throws Exception;

}