package com.company.ssmdemo.pojo;

public class QueryVo {

	private Loan loan;

	private String moneyAndBig;

	private String cityid;

	// 查询条件
	private House house;

	// 当前页码数
	private Integer page = 1;
	// 数据库从哪一条数据开始查
	private Integer start;
	// 每页显示数据条数
	private Integer rows = 10;

	private float Money1;

	private float Money2;

	private float Big1;

	private float Big2;

	public String getMoneyAndBig() {
		return moneyAndBig;
	}

	public void setMoneyAndBig(String moneyAndBig) {
		this.moneyAndBig = moneyAndBig;
	}

	public Loan getLoan() {
		return loan;
	}

	public void setLoan(Loan loan) {
		this.loan = loan;
	}

	public float getMoney1() {
		return Money1;
	}

	public void setMoney1(float money1) {
		Money1 = money1;
	}

	public float getMoney2() {
		return Money2;
	}

	public void setMoney2(float money2) {
		Money2 = money2;
	}

	public float getBig1() {
		return Big1;
	}

	public void setBig1(float big1) {
		Big1 = big1;
	}

	public float getBig2() {
		return Big2;
	}

	public void setBig2(float big2) {
		Big2 = big2;
	}

	public House getHouse() {
		return house;
	}

	public void setHouse(House house) {
		this.house = house;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public String getCityid() {
		return cityid;
	}

	public void setCityid(String cityid) {
		this.cityid = cityid;
	}

}
