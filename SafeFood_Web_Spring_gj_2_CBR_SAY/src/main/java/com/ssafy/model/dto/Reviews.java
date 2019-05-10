package com.ssafy.model.dto;

public class Reviews {
	private int reviewsIdx;
	private String userId;
	private int foodCode;
	private String reviewsContent;
	
	public Reviews() {
		super();
	}

	public Reviews(int reviewsIdx, String userId, int foodCode, String reviewsContent) {
		super();
		this.reviewsIdx = reviewsIdx;
		this.userId = userId;
		this.foodCode = foodCode;
		this.reviewsContent = reviewsContent;
	}



	public int getReviewsIdx() {
		return reviewsIdx;
	}



	public void setReviewsIdx(int reviewsIdx) {
		this.reviewsIdx = reviewsIdx;
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



	public String getReviewsContent() {
		return reviewsContent;
	}



	public void setReviewsContent(String reviewsContent) {
		this.reviewsContent = reviewsContent;
	}



	@Override
	public String toString() {
		return "Reviews [reviewsIdx=" + reviewsIdx + ", userId=" + userId + ", foodCode=" + foodCode
				+ ", reviewsContent=" + reviewsContent + "]";
	}
	
	
}
