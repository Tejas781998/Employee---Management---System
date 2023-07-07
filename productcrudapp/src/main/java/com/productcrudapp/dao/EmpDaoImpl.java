package com.productcrudapp.dao;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.productcrudapp.entity.Address;
import com.productcrudapp.entity.Emp;

@Repository()
public class EmpDaoImpl implements EmpDao
{
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	
	@Transactional
	public int saveEmp(Emp emp) {
	    for (Address address : emp.getAddress()) {
	        address.setEmp(emp); // Set the employee for each address
	    }
	    int i = (Integer) hibernateTemplate.save(emp);
	    return i;
	}

	@Transactional
	public int saveAddress(Address address) {
		int i = (Integer) hibernateTemplate.save(address);
		return i;
	}
	
	public Emp getEmpById(int id) {
		Emp emp = hibernateTemplate.get(Emp.class, id);
		return emp;
	}

	public List<Emp> getAllEmp() {
		List<Emp> list = hibernateTemplate.loadAll(Emp.class);
		return list;
	}
	
	@Transactional
	public List<Emp> getAllEmpRowDetailsByEmail(String empEmail) {
	    String hql = "FROM Emp WHERE email = :empEmail";
	    Query<Emp> query = hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(hql, Emp.class);
	    query.setParameter("empEmail", empEmail);
	    List<Emp> list = query.list();

	    return list;
	}  

	
	
	/*
	 * public List<Emp> getAllEmp() { List<Emp> list =
	 * hibernateTemplate.loadAll(Emp.class); return list; }
	 */

	@Transactional
	public void update(Emp emp) {
	    Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
	    session.update(emp);
	}

	
	   		
	
	@Transactional
	public void deleteEmp(int id) {
		Emp emp = hibernateTemplate.get(Emp.class, id);
	//	Address address =  hibernateTemplate.get(Address.class, id);
		hibernateTemplate.delete(emp);
	//	hibernateTemplate.delete(address);

	}
	
	@Transactional
	  @Override 
	  public void deleteAddress(int addressId) {
	 
	  Address address = hibernateTemplate.get(Address.class, addressId);
      address.getEmp().getAddress().remove(address); // Remove the address from the employee's address list
	  hibernateTemplate.delete(address); 
	  }
	 

	
	public Emp loginUser(String email, String password, String userType)
	{
		
		String sql = "from Emp where email=:nm and password=:pwd and userType=:ut";
		
		Emp us = (Emp)hibernateTemplate.execute(s->
		{
			Query q = s.createQuery(sql);
			q.setString("nm",email);
			q.setString("pwd", password);
			q.setString("ut",userType);
			return q.uniqueResult();
		});
		
		return us;
	}

	@Override
	public boolean checkEmailExistence(String email) {
		String sql = "from Emp where email=:nm";
		
		
		Emp uk = (Emp)hibernateTemplate.execute(s->
		{
			Query q = s.createQuery(sql);
			q.setString("nm",email);
			return q.uniqueResult();
		});
		
		if(uk != null)
		{
			return true;
		}
		else
		{
			return false;
		}
		
	}

	

	
	

	

}

