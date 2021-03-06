package com.ssafy.model.dto;

public class Food {
	/** 식품을 구별하는 코드 */
	protected int code;
	/** 식품 이름 */
	protected String name;
	/** 일회 제공 량 */
	protected double supportpereat;
	/** 일회 제공되는 칼로기 */
	protected double calory;
	/** 일회 제공되는 탄수화물 */
	protected double carbo;
	/** 일회 제공되는 단백질 */
	protected double protein;
	/** 일회 제공되는 지방 */
	protected double fat;
	/** 일회 제공되는 당류 */
	protected double sugar;
	/** 일회 제공되는 나트륨 */
	protected double natrium;
	/** 일회 제공되는 콜레스테롤 */
	protected double chole;
	/** 일회 제공되는 포화지방산 */
	protected double fattyacid;
	/** 일회 제공되는 트렌스지방 */
	protected double transfat;
	/** 제조사 */
	protected String maker;
	/** 원료 */
	protected String material;
	/** 이미지 경로 */
	protected String img;
	/** 날짜 추가 - 차트에서 필요 */
	protected String srtDate;
	protected String endDate;
	protected String dates;
	protected String content;
	protected boolean overFood;

	public Food() {
	}

	public Food(int code) {
		super();
		this.code = code;
	}

	public Food(int code, String name, double supportpereat, double calory, double carbo, double protein, double fat,
			double sugar, double natrium, double chole, double fattyacid, double transfat, String maker,
			String material, String img) {
		super();
		this.code = code;
		this.name = name;
		this.supportpereat = supportpereat;
		this.calory = calory;
		this.carbo = carbo;
		this.protein = protein;
		this.fat = fat;
		this.sugar = sugar;
		this.natrium = natrium;
		this.chole = chole;
		this.fattyacid = fattyacid;
		this.transfat = transfat;
		this.maker = maker;
		this.material = material;
		this.img = img;
	}

	public Food(int code, String name, double supportpereat, double calory, double carbo, double protein, double fat,
			double sugar, double natrium, double chole, double fattyacid, double transfat, String maker,
			String material, String img, String srtDate, String endDate, String dates) {
		super();
		this.code = code;
		this.name = name;
		this.supportpereat = supportpereat;
		this.calory = calory;
		this.carbo = carbo;
		this.protein = protein;
		this.fat = fat;
		this.sugar = sugar;
		this.natrium = natrium;
		this.chole = chole;
		this.fattyacid = fattyacid;
		this.transfat = transfat;
		this.maker = maker;
		this.material = material;
		this.img = img;
		this.srtDate = srtDate;
		this.endDate = endDate;
		this.dates = dates;
	}

	public String getSrtDate() {
		return srtDate;
	}

	public void setSrtDate(String srtDate) {
		this.srtDate = srtDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getSupportpereat() {
		return supportpereat;
	}

	public void setSupportpereat(double supportpereat) {
		this.supportpereat = supportpereat;
	}

	public double getCalory() {
		return calory;
	}

	public void setCalory(double calory) {
		this.calory = calory;
	}

	public double getCarbo() {
		return carbo;
	}

	public void setCarbo(double carbo) {
		this.carbo = carbo;
	}

	public double getProtein() {
		return protein;
	}

	public void setProtein(double protein) {
		this.protein = protein;
	}

	public double getFat() {
		return fat;
	}

	public void setFat(double fat) {
		this.fat = fat;
	}

	public double getSugar() {
		return sugar;
	}

	public void setSugar(double sugar) {
		this.sugar = sugar;
	}

	public double getNatrium() {
		return natrium;
	}

	public void setNatrium(double natrium) {
		this.natrium = natrium;
	}

	public double getChole() {
		return chole;
	}

	public void setChole(double chole) {
		this.chole = chole;
	}

	public double getFattyacid() {
		return fattyacid;
	}

	public void setFattyacid(double fattyacid) {
		this.fattyacid = fattyacid;
	}

	public double getTransfat() {
		return transfat;
	}

	public void setTransfat(double transfat) {
		this.transfat = transfat;
	}

	public String getMaker() {
		return maker;
	}

	public void setMaker(String maker) {
		this.maker = maker;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	public String getDates() {
		return dates;
	}

	public void setDates(String dates) {
		this.dates = dates;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}

	public boolean getOverFood() {
		return overFood;
	}
	
	public void setOverFood(boolean overFood) {
		this.overFood = overFood;
	}

	@Override
	public String toString() {
		return "Food [code=" + code + ", name=" + name + ", supportpereat=" + supportpereat + ", calory=" + calory
				+ ", carbo=" + carbo + ", protein=" + protein + ", fat=" + fat + ", sugar=" + sugar + ", natrium="
				+ natrium + ", chole=" + chole + ", fattyacid=" + fattyacid + ", transfat=" + transfat + ", maker="
				+ maker + ", material=" + material + ", img=" + img + ", srtDate=" + srtDate + ", endDate=" + endDate
				+ ", dates=" + dates + "]";
	}
}
