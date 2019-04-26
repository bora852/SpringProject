/**
 *
 */
package com.ssafy.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.model.dto.Food;
import com.ssafy.model.repository.FoodRepository;

@Transactional
@Service
public class FoodServiceImpl implements FoodService {

	private FoodRepository foodRepo;
	@Autowired
	public FoodServiceImpl(FoodRepository repo) {
		foodRepo = repo;
	}

	@Override
	public int insert(Food book) {
		return foodRepo.insert(book);
	}

	@Override
	public Food selectName1(String name) {
		return foodRepo.selectName1(name);
	}

	@Override
	public List<Food> selectName2(String name) {
		return foodRepo.selectName2(name);
	}
	
	@Override
	public List<Food> selectAll() {
		return foodRepo.selectAll();
	}
	
	@Override
	public List<Food> selectMaterial(String material) {
		return foodRepo.selectMaterial(material);
	}
	
	@Override
	public List<Food> selectMaker(String maker) {
		return foodRepo.selectMaker(maker);
	}

}
