/**
 *
 */
package com.ssafy.model.service;

import com.ssafy.model.dto.User;

/**
 * @author itsme
 * @Date : 2019. 4. 14.
 */
public interface UserService {
	public int insertUser(User user);
	public User login(String id, String pw);
	public User selectUser(String id);
	public int updateUser(User user);
	public int deleteUser(String userId);
	public User findPw(User user);
	public int updatePw(User user);
	public void sendEmail(User user, String div);
}
