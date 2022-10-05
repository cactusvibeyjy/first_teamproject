package bit.com.a.model;

import java.io.Serializable;

public class CGVNoMemberDto implements Serializable{
	private String password;
	private String name;
	private String phoneNumber;
	private String email;
	private int auth;
	private String createdAt;
	
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
	public int getAuth() {
		return auth;
	}
	public void setAuth(int auth) {
		this.auth = auth;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	@Override
	public String toString() {
		return "CGVNoMemberDto [password=" + password + ", name=" + name + ", phoneNumber=" + phoneNumber + ", email="
				+ email + ", auth=" + auth + ", createdAt=" + createdAt + "]";
	}
	
	
	
}


