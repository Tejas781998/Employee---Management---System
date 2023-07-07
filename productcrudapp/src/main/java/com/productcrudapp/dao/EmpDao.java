package com.productcrudapp.dao;

import java.util.List;

import com.productcrudapp.entity.Address;
import com.productcrudapp.entity.Emp;

public interface EmpDao 
{
	//Interface for all CRUD Operations
	
	//Method for saving employee
	public int saveEmp(Emp emp);
	
	//Method for saving address
	public int saveAddress(Address address);
	
	//Method for getting all employee details by email Id
	public Emp getEmpById (int id);
	
	//Method for getting all employee details
	public List<Emp> getAllEmp();
	
	//Method for update
	public void update(Emp emp);
	
	//Method for delete employee details along with all address associated with it.
	public void deleteEmp(int id);
	
	//Method for deleting addresses
	public void deleteAddress(int addressId);
	
	//Method for loginUSer
	public Emp loginUser (String email, String password, String userType);
	
	//Method for getting all details of a specific employee in form of list
	public List<Emp> getAllEmpRowDetailsByEmail(String userEmail);	
	
	//Method for checking if the email exists in the database or not.
	public boolean checkEmailExistence(String email);

}
