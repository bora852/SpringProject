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
	public List<Food> selectName(String name, String id) {
		return eatRepo.selectName(name,id);
	}
	
	@Override
	public List<Food> selectMaterial(String material, String id) {
		return eatRepo.selectMaterial(material,id);
	}
	
	@Override
	public List<Food> selectMaker(String maker, String id) {
		return eatRepo.selectMaker(maker,id);
	}

}