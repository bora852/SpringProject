/**
 *
 */
package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.UserVO;
import com.ssafy.model.repository.UserRepository;

/**
 * @author itsme
 * @Date : 2019. 4. 14.
 */
public interface UserService {
	public int insertUser(UserVO user);
	public UserVO login(UserVO user);
	public UserVO selectUser(UserVO user);
	public int updateUser(UserVO user);
	public int deleteUser(UserVO user);
	public int findPw(UserVO user);
	public int updatePw(UserVO user);
}
