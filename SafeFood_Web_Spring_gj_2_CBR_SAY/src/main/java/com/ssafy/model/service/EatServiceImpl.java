/**
 *
 */
package com.ssafy.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.model.dto.Eat;
import com.ssafy.model.dto.Food;
import com.ssafy.model.repository.EatRepository;
import com.ssafy.model.repository.FoodRepository;

@Transactional
@Service
public class EatServiceImpl implements EatService {

	private EatRepository eatRepo;

	public EatServiceImpl(EatRepository repo) {
		eatRepo = repo;
	}

	@Override
	@Transactional
	public int insert(Eat eat) {
		return eatRepo.insert(eat);
	}

	@Override
	public List<Food> searchMyList(String id) {
		return eatRepo.searchMyList(id);
	}

	@Override
	public List<Food> selectName(String name) {
		return eatRepo.selectName(name);
	}
	
	@Override
	public List<Food> selectMaterial(String material) {
		return eatRepo.selectMaterial(material);
	}
	
	@Override
	public List<Food> selectMaker(String maker) {
		return eatRepo.selectMaker(maker);
	}

}
