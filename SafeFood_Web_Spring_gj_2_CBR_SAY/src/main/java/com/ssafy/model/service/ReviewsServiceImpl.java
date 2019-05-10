package com.ssafy.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.ssafy.model.dto.Reviews;
import com.ssafy.model.repository.ReviewsRepository;

public class ReviewsServiceImpl implements ReviewsService {
	private ReviewsRepository reviewsRepo;

	@Autowired
	public ReviewsServiceImpl(ReviewsRepository repo) {
		reviewsRepo = repo;
	}

	@Override
	public int insert(Reviews review) {
		return reviewsRepo.insert(review);
	}

}
