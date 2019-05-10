package com.ssafy.model.dto;

public class LikeFood {
	private int likefoodIdx;
	private String userId;
	private int foodCode;
	
	
	public LikeFood() {
		super();
	}

	public LikeFood(int likefoodIdx, String userId, int foodCode) {
		super();
		this.likefoodIdx = likefoodIdx;
		this.userId = userId;
		this.foodCode = foodCode;
	}

	public int getLikefoodIdx() {
		return likefoodIdx;
	}

	public void setLikefoodIdx(int likefoodIdx) {
		this.likefoodIdx = likefoodIdx;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getFoodCode() {
		return foodCode;
	}

	public void setFoodCode(int foodCode) {
		this.foodCode = foodCode;
	}

	@Override
	public String toString() {
		return "LikeFood [likefoodIdx=" + likefoodIdx + ", userId=" + userId + ", foodCode=" + foodCode + "]";
	}

}
