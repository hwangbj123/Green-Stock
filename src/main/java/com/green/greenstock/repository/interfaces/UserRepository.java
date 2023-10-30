package com.green.greenstock.repository.interfaces;

import com.green.greenstock.repository.model.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository {
	public int insertUser(User user);

	public User findUserByUserName(User user);

	public User findUserName(String username);

	public User findUserFromEmail(String email);

	public int modifyUserPw(User user);
}
