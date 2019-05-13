package com.ssafy.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.model.dto.Notice;
/**
 * 
 * @author bora
 * 공지사항 Service
 *
 */
public interface NoticeService {
	
	public List<Notice> selectAll();
	
	public Notice select(Integer notice_idx);
	
	public int insertNotice(Notice notice);
	
	public int updateNotice(Notice notice);
	
	public int deleteNotice(Notice notice);
	
}
