package com.company.ssmdemo.exception;

public class MyException extends Exception {
	private static final long serialVersionUID = -2035852779721183167L;
	private String msg;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public MyException(String msg) {
		super();
		this.msg = msg;
	}

	public MyException() {
		super();
	}

}
