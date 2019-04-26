/**
 *
 */
package com.ssafy.model.service;

import com.ssafy.model.dto.UserVO;

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
