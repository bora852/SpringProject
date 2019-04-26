package com.ssafy.model.dto;

import java.util.Date;

public class Eat {
	private Integer userEatIdx;	
	private String userId;
	private Integer foodCode;
	private Date eatDate;
	
	public Eat() {
		super();
	}
	public Eat( String userId, Integer foodCode) {
		super();
		this.userId = userId;
		this.foodCode = foodCode;
		this.eatDate = new Date();
	}
	public Eat(Integer userEatIdx, String userId, Integer foodCode) {
		super();
		this.userEatIdx = userEatIdx;
		this.userId = userId;
		this.foodCode = foodCode;
		this.eatDate = new Date();
	}
	public Integer getUserEatIdx() {
		return userEatIdx;
	}
	public void setUserEatIdx(Integer userEatIdx) {
		this.userEatIdx = userEatIdx;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Integer getFoodCode() {
		return foodCode;
	}
	public void setFoodCode(Integer foodCode) {
		this.foodCode = foodCode;
	}
	public Date getEatDate() {
		return eatDate;
	}
	public void setEatDate(Date eatDate) {
		this.eatDate = eatDate;
	}
	@Override
	public String toString() {
		return "EatVO [userEatIdx=" + userEatIdx + ", userId=" + userId + ", foodCode=" + foodCode + ", eatDate="
				+ eatDate + "]";
	}
}
