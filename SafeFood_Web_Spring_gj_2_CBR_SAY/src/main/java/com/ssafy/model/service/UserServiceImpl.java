/**
 *
 */
package com.ssafy.model.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.model.dto.User;
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
	
	@Autowired
	public UserServiceImpl(UserRepository repo) {
		userRepo = repo;
	}

	@Override
	public int insertUser(User user) {
		int result = userRepo.insertUser(user);
		return result;
	}

	@Override
	public User login(String id, String pw) {
		User account = userRepo.selectUser(id);
		logger.trace("login : {}", account);
		if(account != null && account.getPw().equals(pw)) {
			return account;
		}else return null;
	}

	@Override
	public User selectUser(String id) {
		return userRepo.selectUser(id);
	}

	@Override
	public int updateUser(User user) {
		return userRepo.updateUser(user);
	}

	@Override
	public int deleteUser(String userId) {
		return userRepo.deleteUser(userId);
	}

	@Override
	public int findPw(User user) {
		return userRepo.findPw(user);
	}

	@Override
	public int updatePw(User user) {
		return userRepo.updatePw(user);
	}
}
