package com.ssafy.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.ssafy.model.dto.LikeFood;
import com.ssafy.model.repository.LikeFoodRepository;

public class LikeFoodServiceImpl implements LikeFoodService {
	private LikeFoodRepository likeFoodRepo;
	
	@Autowired
	public LikeFoodServiceImpl(LikeFoodRepository repo) {
		likeFoodRepo = repo;
	}

	@Override
	public int insert(LikeFood likefood) {
		// TODO Auto-generated method stub
		return likeFoodRepo.insert(likefood);
	}

}
