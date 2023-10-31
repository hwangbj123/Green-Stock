package com.green.greenstock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.green.greenstock.handler.exception.CustomRestfulException;
import com.green.greenstock.repository.interfaces.UserRepository;
import com.green.greenstock.repository.model.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Transactional
	public void insertUser(User user) {
		String rawPwd = user.getPassword();
		String hashPwd = passwordEncoder.encode(rawPwd);
		user.setPassword(hashPwd);
		user.setRoletypeId(1);
		int result = userRepository.insertUser(user);
		if(result != 1) {
			throw new CustomRestfulException("가입에 실패했습니다", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	public User findUserByUserName(User user) {
		User principal = userRepository.findUserByUserName(user);
		if(principal == null) {
			throw new CustomRestfulException("해당정보의 유저가 없습니다.", HttpStatus.BAD_REQUEST);
		}
		boolean isPwdMatched = passwordEncoder.matches(user.getPassword(), principal.getPassword());
		if(isPwdMatched==false) {
			throw new CustomRestfulException("비밀번호가 일치하지 않습니다.", HttpStatus.BAD_REQUEST);
		}
		return principal;
	}

	public User findUserName(String username) {
		User user = userRepository.findUserName(username);
		return user;
	}

	public User findUserFromEmail(String email) {
		User user = userRepository.findUserFromEmail(email);
		return user;
	}

	@Transactional
	public void modifyPw(User user) {
		String rawPwd = user.getPassword();
		String hashPwd = passwordEncoder.encode(rawPwd);
		user.setPassword(hashPwd);
		int result = userRepository.modifyUserPw(user);		
		if(result != 1) {
			throw new CustomRestfulException("비밀번호 수정에 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@Transactional
	public void modifyUserInfo(User user) {
		int result = userRepository.modifyUserInfo(user);
		if(result != 1) {
			throw new CustomRestfulException("회원정보 수정에 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	public void deleteUser(Integer id) {
		int result = userRepository.deleteUser(id);
		if(result != 1) {
			throw new CustomRestfulException("회원탈퇴에 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
}
