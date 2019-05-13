package com.ssafy.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.Notice;
/**
 * @author bora
 * @Date : 2019. 5. 13.
 */
@Repository
public class NoticeRepositoryImpl implements NoticeRepository{
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeRepositoryImpl.class);
	private static final String ns = "com.ssafy.repository.NoticeMapper.";
	
	@Autowired
	SqlSessionTemplate template;
	
	@Override
	public List<Notice> selectAll() {
		logger.trace("공지사항 리스트(selectAll)");
		String statement = ns+"selectAll";
		return template.selectList(statement);
	}

	@Override
	public Notice select(Integer notice_idx) {
		logger.trace("공지사항 상세보기(select): {}", notice_idx);
		String statement = ns+"selectNotice";
		return template.selectOne(statement, notice_idx);
	}

	@Override
	public int insertNotice(Notice notice) {
		logger.trace("공지사항 등록(insertNotice): {}", notice);
		String statement = ns+"insertNotice";
		return template.insert(statement, notice);
	}

	@Override
	public int updateNotice(Notice notice) {
		logger.trace("공지사항 수정(updateNotice): {}", notice);
		String statement = ns+"updateNotice";
		return template.update(statement, notice);
	}

	@Override
	public int deleteNotice(Notice notice) {
		logger.trace("공지사항 삭제(insertUser): {}", notice);
		String statement = ns+"deleteNotice";
		return template.delete(statement, notice);
	}

	@Override
	public int updateHitCnt(Integer notice_idx) {
		logger.trace("공지사항 조회수 증가(updateHitCnt): {}", notice_idx);
		String statement = ns+"updateHitCnt";
		return template.update(statement, notice_idx);
	}

}
