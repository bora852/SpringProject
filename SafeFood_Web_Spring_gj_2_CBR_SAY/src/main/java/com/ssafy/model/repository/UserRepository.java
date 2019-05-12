/**
 *
 */
package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.User;

/**
 * @author itsme
 * @Date : 2019. 4. 14.
 */
public interface UserRepository {
	public int insertUser(User user);
	public User selectUser(String id);
	public int updateUser(User user);
	public int deleteUser(String userId);
	public int deleteUserEat(String userId);
	public User findId(User user);
	public User findPw(User user);
	public int updatePw(User user);
}
