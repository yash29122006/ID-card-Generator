package model;

public class IdDetails {
	private String id;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	private int roll_no;
	private String name;
	private String email;
	private String mobile_no;
	private String department;
	private String year;
	private String div;
	private String blood_group;
	private String city;
	private int pincode;
	private String State;
	
	public IdDetails() {
	}
	public IdDetails(int roll_no, String name, String email, String mobile_no, String department, String year,
			String div, String blood_group, String city, int pincode, String state) {
		this.roll_no = roll_no;
		this.name = name;
		this.email = email;
		this.mobile_no = mobile_no;
		this.department = department;
		this.year = year;
		this.div = div;
		this.blood_group = blood_group;
		this.city = city;
		this.pincode = pincode;
		State = state;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile_no() {
		return mobile_no;
	}
	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getPincode() {
		return pincode;
	}
	public void setPincode(int pincode) {
		this.pincode = pincode;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public int getRoll_no() {
		return roll_no;
	}
	public void setRoll_no(int roll_no) {
		this.roll_no = roll_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getDiv() {
		return div;
	}
	public void setDiv(String div) {
		this.div = div;
	}
	public String getBlood_group() {
		return blood_group;
	}
	public void setBlood_group(String blood_group) {
		this.blood_group = blood_group;
	}
}
