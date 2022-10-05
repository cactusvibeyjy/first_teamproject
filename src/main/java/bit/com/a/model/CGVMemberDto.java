package bit.com.a.model;

import java.io.Serializable;

public class CGVMemberDto implements Serializable{
	private String id;
	private String password;
	private String name;
	private String phone_number;
	private String email;
	private String address;
	private int auth;
	private String register_date;
	private String unRegisterDate;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getAuth() {
		return auth;
	}
	public void setAuth(int auth) {
		this.auth = auth;
	}
	public String getUnRegisterDate() {
		return unRegisterDate;
	}
	public void setUnRegisterDate(String unRegisterDate) {
		this.unRegisterDate = unRegisterDate;
	}
	
	
	
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getRegister_date() {
		return register_date;
	}
	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}
	public CGVMemberDto() {
		// TODO Auto-generated constructor stub
	}
	public CGVMemberDto(String id, String password, String name, String phone_number, String email, String address,
			int auth, String register_date, String unRegisterDate) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.phone_number = phone_number;
		this.email = email;
		this.address = address;
		this.auth = auth;
		this.register_date = register_date;
		this.unRegisterDate = unRegisterDate;
	}
	@Override
	public String toString() {
		return "CGVMemberDto [id=" + id + ", password=" + password + ", name=" + name + ", phone_number=" + phone_number
				+ ", email=" + email + ", address=" + address + ", auth=" + auth + ", registerDate=" + register_date
				+ ", unRegisterDate=" + unRegisterDate + "]";
	}
	public CGVMemberDto(String id, String password, String name, String phone_number, String email, String address) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.phone_number = phone_number;
		this.email = email;
		this.address = address;
	}
	public CGVMemberDto(String id, String name, String phone_number, String email, String address, int auth,
			String register_date, String unRegisterDate) {
		super();
		this.id = id;
		this.name = name;
		this.phone_number = phone_number;
		this.email = email;
		this.address = address;
		this.auth = auth;
		this.register_date = register_date;
		this.unRegisterDate = unRegisterDate;
	}
	
	
	
	
	
}


