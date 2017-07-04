package com.simpact.domain;

import java.sql.Date;

/**
 * Created
 * User: simpact
 * Date: 2017-06-30
 * Time: 오후 6:01
 */
public class MemberVO {

	private String memNO;
	private String personDF;
	private String email;
	private String pass;
	private String name;
	private String nickName;
	private Date birth;
	private String sex;
	private String tel;
	private Date joinDate;
	private Date latestDate;
	private String state;
	private String id;

	public MemberVO() {
	}

	@Override
	public String toString() {
		return "MemberVO{" +
				"memNO='" + memNO + '\'' +
				", personDF='" + personDF + '\'' +
				", email='" + email + '\'' +
				", pass='" + pass + '\'' +
				", name='" + name + '\'' +
				", nickName='" + nickName + '\'' +
				", birth=" + birth +
				", sex='" + sex + '\'' +
				", tel='" + tel + '\'' +
				", joinDate=" + joinDate +
				", latestDate=" + latestDate +
				", state='" + state + '\'' +
				", id='" + id + '\'' +
				'}';
	}

	public String getMemNO() {
		return memNO;
	}

	public void setMemNO(String memNO) {
		this.memNO = memNO;
	}

	public String getPersonDF() {
		return personDF;
	}

	public void setPersonDF(String personDF) {
		this.personDF = personDF;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public Date getLatestDate() {
		return latestDate;
	}

	public void setLatestDate(Date latestDate) {
		this.latestDate = latestDate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
