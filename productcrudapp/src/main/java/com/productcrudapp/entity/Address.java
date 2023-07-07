package com.productcrudapp.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "emp_address")
public class Address {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
//	@ManyToOne(targetEntity = Emp.class)
	private int addressId;
	@ManyToOne
	//@ManyToOne(targetEntity = Emp.class)
	
	@JoinColumn(name = "emp_id")
	private Emp emp;
	private String permanenetAddress;
	private String temporaryAddress;
	private String streetAddress;
	private String city;
	private String stateProvince;
	private String country;
	
	//Getters and Setters 
	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
	public Emp getEmp() {
		return emp;
	}
	public void setEmp(Emp emp) {  
		this.emp = emp;
	}
	public String getPermanenetAddress() {
		return permanenetAddress;
	}
	public void setPermanenetAddress(String permanenetAddress) {
		this.permanenetAddress = permanenetAddress;
	}
	public String getTemporaryAddress() {
		return temporaryAddress;
	}
	public void setTemporaryAddress(String temporaryAddress) {
		this.temporaryAddress = temporaryAddress;
	}
	public String getStreetAddress() {
		return streetAddress;
	}
	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getStateProvince() {
		return stateProvince;
	}
	public void setStateProvince(String stateProvince) {
		this.stateProvince = stateProvince;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	@Override
	public String toString() {
		return "Address [addressId=" + addressId + ", emp=" + emp + ", permanenetAddress=" + permanenetAddress
				+ ", temporaryAddress=" + temporaryAddress + ", streetAddress=" + streetAddress + ", city=" + city
				+ ", stateProvince=" + stateProvince + ", country=" + country + "]";
	}
	
	
	
}
