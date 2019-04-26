/**
 *
 */
package com.ssafy.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.model.dto.UserInfo;
import com.ssafy.model.dto.UserVO;
import com.ssafy.model.repository.UserRepository;

/**
 * @author itsme
 * @Date : 2019. 4. 14.
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {

	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	private UserRepository userRepo;

	public UserServiceImpl(UserRepository repo) {
		userRepo = repo;
	}

	@Override
	public int insertUser(UserVO user) {
		int result = userRepo.insertUser(user);
		return result;
	}

	@Override
	public UserVO login(UserVO user) {
		return userRepo.login(user);
	}

	@Override
	public UserVO selectUser(UserVO user) {
		return userRepo.selectUser(user);
	}

	@Override
	public int updateUser(UserVO user) {
		return userRepo.updateUser(user);
	}

	@Override
	public int deleteUser(UserVO user) {
		return userRepo.deleteUser(user);
	}

	@Override
	public int findPw(UserVO user) {
		return userRepo.findPw(user);
	}

	@Override
	public int updatePw(UserVO user) {
		return userRepo.updatePw(user);
	}
}
