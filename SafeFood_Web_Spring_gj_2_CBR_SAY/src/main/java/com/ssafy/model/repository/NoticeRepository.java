package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.Notice;

public interface NoticeRepository {
	
	public List<Notice> selectAll();
	
	public Notice select(Integer notice_idx);
	
	public int insertNotice(Notice notice);
	
	public int updateNotice(Notice notice);
	
	public int deleteNotice(Notice notice);
	
	public int updateHitCnt(Integer notice_idx);
	
}
