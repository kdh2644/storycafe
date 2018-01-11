package com.storycafe.member.model;

public class MemberDetailDto extends MemberDto{
	private int mgender;
	private String email1;
	private String email2;
	private String phone1;
	private String phone2;
	private String phone3;
	private String mjoindate;
	private String moutdate;
	
	public int getMgender() {
		return mgender;
	}
	public void setMgender(int mgender) {
		this.mgender = mgender;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getMjoindate() {
		return mjoindate;
	}
	public void setMjoindate(String mjoindate) {
		this.mjoindate = mjoindate;
	}
	public String getMoutdate() {
		return moutdate;
	}
	public void setMoutdate(String moutdate) {
		this.moutdate = moutdate;
	}
	
	@Override
	public String toString() {
		return "MemberDetailDto [mgender=" + mgender + ", email1=" + email1 + ", email2=" + email2 + ", phone1="
				+ phone1 + ", phone2=" + phone2 + ", phone3=" + phone3 + ", mjoindate=" + mjoindate + ", moutdate="
				+ moutdate + "]";
	}
	
	
}
