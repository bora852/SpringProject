package com.ssafy.test;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.assertThat;

import java.awt.print.Book;

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
import com.ssafy.model.repository.UserRepository;
import com.ssafy.model.service.UserServiceImpl;

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
		assertThat(users, is(notNullValue()));
	}
	@Autowired
	UserServiceImpl users;
	
	

	
	@Autowired
	UserRepository user;
//	
//	@Autowired
//	BookRepository book;
//	
//	@Test
//	public void insertUserTest() {
//		int result = user.insert(new UserInfo("2","사람1","1234"));
//		assertThat(result, is(1));
//	}
//	
//	@Test
//	public void insertBookTest() {
//		int result = book.insert(new Book("2","책이름","작가","출판사","설명"));
//		assertThat(result, is(1));
//	}
//	
//	@Test
//	public void selectUserTest() {
//		UserInfo result = user.select("2");
//		assertThat(result.getName(), is("사람1"));
//	}
//	
//	@Test
//	public void selectBookTest() {
//		Book result = book.select("2");
//		assertThat(result.getTitle(), is("책이름"));
//	}
//	
//	@Test
//	public void updatetUserTest() {
//		int result = user.update(new UserInfo("2","up_사람1","up_1234"));
//		assertThat(result, is(1));
//	}
//	
//	@Test
//	public void updatetBookTest() {
//		int result = book.update(new Book("2","up_책이름","작가","출판사","설명"));
//		assertThat(result, is(1));
//	}
//
//	@Test
//	public void deleteUserTest() {
//		int result = user.delete("2");
//		assertThat(result, is(1));
//	}
//	
//	@Test
//	public void selectAll() {
//		List<UserInfo> users = user.selectAllUsers();
//		assertThat(users.size(), is(1));
//	}
}
