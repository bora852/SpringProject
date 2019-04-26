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

import com.ssafy.model.dto.UserInfo;
import com.ssafy.model.dto.UserVO;

/**
 * @author itsme
 * @Date : 2019. 4. 14.
 */
@Repository
public class UserRepositoryMysqlImpl implements UserRepository{
	private static final Logger logger = LoggerFactory.getLogger(UserRepositoryMysqlImpl.class);
	private static final String ns = "com.ssafy.model.mapper.UserInfo.";
	@Autowired
	SqlSessionTemplate template;

	@Override
	public int insertUser(UserVO user) {
		logger.trace("회원가입(insertUser): {}", user);
		String statement = ns+"insertUser";
		return template.insert(statement, user);
	}

	@Override
	public UserVO login(UserVO user) {
		logger.trace("로그인(select): {}", user);
		String statement = ns+"login";
		return template.selectOne(statement, user);
	}
	
	@Override
	public UserVO selectUser(UserVO user) {
		logger.trace("회원정보 불러오기(selectUser): {}", user);
		String statement = ns+"selectUser";
		return template.selectOne(statement, user);
	}
	
	@Override
	public int updateUser(UserVO user) {
		logger.trace("회원정보 수정(updateUser): {}", user);
		String statement = ns+"updateUser";
		return template.update(statement, user);
	}
	
	@Override
	public int deleteUser(UserVO user) {
		logger.trace("회원탈퇴(deleteUser): {}", user);
		String statement = ns+"deleteUser";
		return template.update(statement, user);
	}
	
	@Override
	public int findPw(UserVO user) {
		logger.trace("비밀번호 찾기(findPw): {}", user);
		String statement = ns+"findPw";
		return template.update(statement, user);
	}
	
	@Override
	public int updatePw(UserVO user) {
		logger.trace("비밀번호 찾기 -> 비밀번호 수정(updatePw): {}", user);
		String statement = ns+"updatePw";
		return template.update(statement, user);
	}
}
