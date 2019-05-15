package com.ssafy.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.LikeFood;
import com.ssafy.model.repository.LikeFoodRepository;

@Service
public class LikeFoodServiceImpl implements LikeFoodService {
	private LikeFoodRepository likeFoodRepo;
	
	@Autowired
	public LikeFoodServiceImpl(LikeFoodRepository repo) {
		likeFoodRepo = repo;
	}

	@Override
	public int insert(LikeFood likefood) {
		return likeFoodRepo.insert(likefood);
	}
	@Override
	public List<Food> selectAll(String userId) {
		return likeFoodRepo.selectAll(userId);
	}
	
	@Override
	public int delete(LikeFood likefood) {
		return likeFoodRepo.delete(likefood);
	}
}
