package com.ssafy.test;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.assertThat;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.ssafy.config.ApplicationConfig;
import com.ssafy.model.dto.User;
import com.ssafy.model.repository.UserRepository;
import com.ssafy.model.service.UserService;
// TODO: 테스트 환경을 구축한다.
@RunWith(SpringRunner.class)
@ContextConfiguration(classes = ApplicationConfig.class)
public class DataTest {

	// TODO: ApplicationContext를 주입받는다.
	@Autowired
	ApplicationContext ctx;
	
	@Value("${db.driverClassName}") //Spring이 관리하는 scalar값을 주입받을때
	String classNm;
	
	@Test
	public void Valuetest() {
		assertThat(classNm, is("com.mysql.cj.jdbc.Driver"));
	}
	
	@Autowired
	DataSource ds;
	
	@Test
	public void dsTest() {
		assertThat(ds, is(notNullValue()));
	}
	
	@Autowired
	SqlSessionFactory sf;
	
	@Autowired
	SqlSessionTemplate st;
	
	@Test
	public void sfst() {
		assertThat(sf, is(notNullValue()));
		assertThat(st, is(notNullValue()));
		assertThat(user, is(notNullValue()));
		assertThat(service, is(notNullValue()));
	}
	@Autowired
	UserService service;
	
	@Autowired
	UserRepository user;
	
	@Test
	public void testInsert() {
		User user = new User("id3","pw2","name2","addr2","tel2", new String[] {"all1","all2","all3"});
		int result = service.insertUser(user);
		assertThat(result, is(1));
	}
	
	@Test
	public void loginTest() {
		User user = service.login("cbr","1111");
		assertThat(user.getId(), is("cbr"));
	}
	
	@Test
	public void deleteUserTest() {
		int result = service.deleteUser("id3");
		assertThat(result, is(1));
	}
	
	@Test
	public void updateUser() {
		User user = new User("id3","u_pw2","u_name2","u_addr2","u_tel2", new String[] {"u_all1","u_all2","u_all3"});
		int result = service.updateUser(user);
		assertThat(result, is(1));
	}
	
}
