package com.ssafy.model.dto;

import java.io.Serializable;
import java.util.Arrays;

public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String pw;
	private String name;
	private String addr;
	private String tel;
	private String[] allergy_arr;
	private String allergy;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}
	
	public User(String id, String[] allergy) {
		super();
		this.id = id;
		this.allergy_arr = allergy;
	}	
	public User(String id, String pw, String name, String addr, String tel) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.addr = addr;
		this.tel = tel;
	}
	public User(String id, String pw, String name, String addr, String tel, String[] allergy) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.addr = addr;
		this.tel = tel;
		this.allergy_arr = allergy;
		this.setAllergy_arr(allergy);
	}
	
	public User(String id, String pw, String name, String addr, String tel, String allergy) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.addr = addr;
		this.tel = tel;
		this.allergy = allergy;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String[] getAllergy_arr() {
		return allergy_arr;
	}
	
	public void setAllergy_arr(String[] allergy) {
		this.allergy_arr = allergy;
		this.allergy = "";
		if(getAllergy_arr()!=null) {
			for(int i = 0; i < allergy.length; i++) {
				this.allergy += allergy[i]+",";
			}
			this.allergy += getAllergy().substring(0, getAllergy().length());
			System.out.println(">>>>>>>"+allergy);
		}
	}

	public String getAllergy() {
		return allergy;
	}

	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", pw=" + pw + ", name=" + name + ", addr=" + addr + ", tel=" + tel
				+ ", allergy_arr=" + Arrays.toString(allergy_arr) + ", allergy=" + allergy + "]";
	}
	

	
}
