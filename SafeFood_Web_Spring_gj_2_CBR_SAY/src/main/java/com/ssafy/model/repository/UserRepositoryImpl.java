/**
 *
 */
package com.ssafy.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.User;

/**
 * @author itsme
 * @Date : 2019. 4. 14.
 */
@Repository
public class UserRepositoryImpl implements UserRepository{
	private static final Logger logger = LoggerFactory.getLogger(UserRepositoryImpl.class);
	private static final String ns = "com.ssafy.model.mapper.UserInfo.";
	@Autowired
	SqlSessionTemplate template;

	@Override
	public int insertUser(User user) {
		logger.trace("회원가입(insertUser): {}", user);
		String statement = ns+"insertUser";
		return template.insert(statement, user);
	}

	@Override
	public User selectUser(String id) {
		logger.trace("회원정보 불러오기(selectUser): {}", id);
		String statement = ns+"selectUser";
		return template.selectOne(statement, id);
	}
	
	@Override
	public int updateUser(User user) {
		logger.trace("회원정보 수정(updateUser): {}", user);
		String statement = ns+"updateUser";
		return template.update(statement, user);
	}
	
	@Override
	public int deleteUser(String userId) {
		logger.trace("회원탈퇴(deleteUser): {}", userId);
		String statement = ns+"deleteUser";
		return template.update(statement, userId);
	}
	
	@Override
	public int findPw(User user) {
		logger.trace("비밀번호 찾기(findPw): {}", user);
		String statement = ns+"findPw";
		return template.update(statement, user);
	}
	
	@Override
	public int updatePw(User user) {
		logger.trace("비밀번호 찾기 -> 비밀번호 수정(updatePw): {}", user);
		String statement = ns+"updatePw";
		return template.update(statement, user);
	}
}
