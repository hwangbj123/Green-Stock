package com.green.greenstock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.green.greenstock.repository.interfaces.UserRepository;
import com.green.greenstock.repository.model.User;

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
		userRepository.insertUser(user);
	}

	public User findUserByUserName(User user) {
		User principal = userRepository.findUserByUserName(user);
		System.out.println(principal.getPassword());
		System.out.println(user.getPassword());
		boolean isPwdMatched = passwordEncoder.matches(user.getPassword(), principal.getPassword());
		System.out.println(isPwdMatched);
		if(isPwdMatched==false) {
			System.out.println("비밀번호가 일치하지 않습니다.");
			principal = null;
		}
		return principal;
	}

	public User findUserName(String username) {
		User user = userRepository.findUserName(username);
		return user;
	}

	public User findUserFromEmail(String email) {
		User user = userRepository.findUserFromEmail(email);
		return null;
	}
	
}
