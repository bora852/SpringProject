package com.ssafy.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.model.dto.Notice;
import com.ssafy.model.repository.NoticeRepository;

/**
 * @author bora
 * @Date : 2019. 5. 13.
 */
@Service
@Transactional
public class NoticeServiceImpl implements NoticeService{

	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	private NoticeRepository noticeRepo;
	
	@Autowired
	public NoticeServiceImpl(NoticeRepository repo) {
		this.noticeRepo = repo;
	}
	
	@Override
	public List<Notice> selectAll() {
		return noticeRepo.selectAll();
	}

	@Override
	public Notice select(Integer notice_idx) {
		noticeRepo.updateHitCnt(notice_idx);
		return noticeRepo.select(notice_idx);
	}

	@Override
	public int insertNotice(Notice notice) {
		return noticeRepo.insertNotice(notice);
	}

	@Override
	public int updateNotice(Notice notice) {
		return noticeRepo.updateNotice(notice);
	}

	@Override
	public int deleteNotice(Notice notice) {
		return noticeRepo.deleteNotice(notice);
	}

}
