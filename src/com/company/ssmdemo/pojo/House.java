package com.company.ssmdemo.pojo;

public class House {

	private String rentalorsale;
	private String neworold;
	private String liveorwork;
	private String gardenName;
	private int houseCode;
	private String houseName;
	private float housePrice;
	private float houseBig;
	private String houseInfo;
	private String publisher;
	private String houseImg;

	public String getRentalorsale() {
		return rentalorsale;
	}

	public void setRentalorsale(String rentalorsale) {
		this.rentalorsale = rentalorsale;
	}

	public String getNeworold() {
		return neworold;
	}

	public void setNeworold(String neworold) {
		this.neworold = neworold;
	}

	public String getLiveorwork() {
		return liveorwork;
	}

	public void setLiveorwork(String liveorwork) {
		this.liveorwork = liveorwork;
	}

	public String getGardenName() {
		return gardenName;
	}

	public void setGardenName(String gardenName) {
		this.gardenName = gardenName;
	}

	public int getHouseCode() {
		return houseCode;
	}

	public void setHouseCode(int houseCode) {
		this.houseCode = houseCode;
	}

	public String getHouseName() {
		return houseName;
	}

	public void setHouseName(String houseName) {
		this.houseName = houseName;
	}

	public float getHousePrice() {
		return housePrice;
	}

	public void setHousePrice(float housePrice) {
		this.housePrice = housePrice;
	}

	public float getHouseBig() {
		return houseBig;
	}

	public void setHouseBig(float houseBig) {
		this.houseBig = houseBig;
	}

	public String getHouseInfo() {
		return houseInfo;
	}

	public void setHouseInfo(String houseInfo) {
		this.houseInfo = houseInfo;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getHouseImg() {
		return houseImg;
	}

	public void setHouseImg(String houseImg) {
		this.houseImg = houseImg;
	}

	@Override
	public String toString() {
		return "House [rentalorsale=" + rentalorsale + ", neworold=" + neworold + ", liveorwork=" + liveorwork
				+ ", gardenName=" + gardenName + ", houseCode=" + houseCode + ", houseName=" + houseName
				+ ", housePrice=" + housePrice + ", houseBig=" + houseBig + ", houseInfo=" + houseInfo + ", publisher="
				+ publisher + ", houseImg=" + houseImg + "]";
	}

}
