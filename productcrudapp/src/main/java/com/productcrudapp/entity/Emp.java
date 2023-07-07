package com.productcrudapp.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "emp_dtls")
public class Emp {
	//Automatically creates ID 
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	
	private int id;
	private String fullName;
	
	@OneToMany(mappedBy = "emp", fetch = FetchType.EAGER,cascade = CascadeType.ALL)
//	@JoinColumn(name = "id")
	private List <Address> address;
	
	
	
	private String email;
	private String password;
	private String designation;
	private String salary;
	private String userType;

	
	
	
	public List<Address> getAddress() {
		return address;
	}

	public void setAddress(List<Address> address) {
		this.address = address;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	@Override
	public String toString() {
		return "Emp [id=" + id + ", fullName=" + fullName + ", address=" + address + ", email=" + email + ", password="
				+ password + ", designation=" + designation + ", salary=" + salary + ", userType=" + userType + "]";
	}

	
	

	
}
