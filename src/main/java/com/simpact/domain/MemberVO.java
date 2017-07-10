package com.simpact.domain;

import java.sql.Date;

/**
 * Created
 * User: simpact
 * Date: 2017-06-30
 * Time: 오후 6:01
 */
public class MemberVO {
	//회원
	private String memNO;		//회원번호	
	private String personDF;	//회원분류번호
	private String email;		//회원아이디(이메일)
	private String pass;	 	//회원비밀번호
	private String name;	 	//회원이름
	private String nickName;	//닉네임
	private Date birth;			//생일
	private String sex;			//성별
	private String tel;		 	//전화번호
	private Date joinDate;		//가입일
	private Date latestDate;	//최근접속일
	private String state;		//계정상태
	
	
	public MemberVO() {
	}



	public MemberVO(String memNO, String personDF, String email, String pass, String name, String nickName, Date birth,
			String sex, String tel, Date joinDate, Date latestDate, String state) {
		super();
		this.memNO = memNO;
		this.personDF = personDF;
		this.email = email;
		this.pass = pass;
		this.name = name;
		this.nickName = nickName;
		this.birth = birth;
		this.sex = sex;
		this.tel = tel;
		this.joinDate = joinDate;
		this.latestDate = latestDate;
		this.state = state;
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


}
