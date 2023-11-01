package com.green.greenstock.repository.interfaces;

import com.green.greenstock.dto.PagingDto;
import com.green.greenstock.repository.model.User;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository {
	public int insertUser(User user);

	public User findUserByUserName(User user);

	public User findUserName(String username);

	public User findUserFromEmail(String email);

	public int modifyUserPw(User user);

	public int modifyUserInfo(User user);

	public int deleteUser(Integer id);

	public List<User> findAllUser(PagingDto paging);

	public int countUser();

	public List<User> findBySuspended(boolean b);
}
