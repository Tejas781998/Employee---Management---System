package com.productcrudapp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.productcrudapp.dao.EmpDao;
import com.productcrudapp.entity.Address;
import com.productcrudapp.entity.Emp;

import jakarta.validation.Valid;

@Controller
public class HomeController {
	@Autowired
	private EmpDao empDao;

	@RequestMapping("/index")
	public String index() {

		return "index";
	}

	// API for calling loginSignUp page.
	@RequestMapping("/loginsignup")
	public String loginsignup() {

		return "loginsignup";
	}

	// API for register page.
	@RequestMapping("/register")
	public String register() {

		return "register";
	}

	// API for homepage for admin.
	@RequestMapping("/home")
	public String home(Model m) {
		List<Emp> list = empDao.getAllEmp();
		m.addAttribute("empList", list);
		return "Home";
	}

	// API for adding a new employee by admin
	@RequestMapping("/addEmp")
	public String addEmp() {
		return "addEmp";
	}

	// API for checking if mail is already present in the database.
	@RequestMapping(path = "/checkEmailExistence", method = RequestMethod.POST)
	@ResponseBody
	public boolean checkEmailExistence(@RequestParam("email") String email) {
		return empDao.checkEmailExistence(email);
	}

	/*
	 * @RequestMapping(path = "/createEmp", method = RequestMethod.POST) public
	 * String createEmp(@Valid @ModelAttribute Emp emp, BindingResult bindingResult,
	 * HttpSession session) { // Validate the form input if
	 * (bindingResult.hasErrors()) { // If there are validation errors, handle them
	 * return "addEmp"; // Return the form view to display the errors }
	 * 
	 * // Proceed with saving the employee int i = empDao.saveEmp(emp);
	 * session.setAttribute("msg", "Registered Successfully"); return
	 * "redirect:/addEmp"; }
	 */

	// API for creating a new employee by Admin
	@Transactional
	@RequestMapping(path = "/createEmp", method = RequestMethod.POST)
	public String createEmp(@Valid @ModelAttribute Emp emp, @ModelAttribute Address address, HttpSession session) {
		// Validate the form input

		String email = emp.getEmail();
		boolean emailExists = empDao.checkEmailExistence(email);
		if (emailExists) {
			session.setAttribute("msg", "Email already exists");
			return "addEmp";
		}
		// Password validation
		String password = emp.getPassword();
		if (password == null || password.isEmpty()) {
			session.setAttribute("msg", "Password is required");
			return "addEmp";
		} else if (password.length() < 8 || password.length() > 20) {
			session.setAttribute("msg", "Password must be between 8 to 20 characters");
			return "addEmp";
		} else if (!password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*|?.,])[A-Za-z\\d!@#$%^&*|?.,]+$")) {
			session.setAttribute("msg",
					"Password must contain at least one uppercase letter, lowercase letter, digit, and special character");
			return "addEmp";
		}

		// Proceed with saving the employee
		int i = empDao.saveEmp(emp);
		// int j = empDao.saveAddress(address);
		session.setAttribute("msg", "Registered Successfully");
		return "addEmp";
	}

	// API for registration of a new employee
	@RequestMapping(path = "/registerUser", method = RequestMethod.POST)
	public String registerPage(@Valid @ModelAttribute Emp emp, @ModelAttribute Address address, HttpSession session) {

		// Email Validation

		String email = emp.getEmail();
		boolean emailExists = empDao.checkEmailExistence(email);
		if (emailExists) {
			session.setAttribute("msg", "Email already exists");
			return "register";
		}

		// Password validation
		String password = emp.getPassword();
		if (password == null || password.isEmpty()) {
			session.setAttribute("msg", "Password is required");
			return "register";
		} else if (password.length() < 8 || password.length() > 20) {
			session.setAttribute("msg", "Password must be between 8 to 20 characters");
			return "register";
		} else if (!password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*|?.,])[A-Za-z\\d!@#$%^&*|?.,]+$")) {
			session.setAttribute("msg",
					"Password must contain at least one uppercase letter, lowercase letter, digit, and special character");
			return "register";
		}

		int i = empDao.saveEmp(emp);
		// int j = empDao.saveAddress(address);
		session.setAttribute("msg", "Registered Successfully");
		return "register";
	}

	// For Admin
	@RequestMapping("/editEmp/{id}")
	public String editEmp(@PathVariable int id, HttpSession session) {
		Emp emp = empDao.getEmpById(id);
		// System.out.println("Edit Emp 2nd method " + emp.getAddress());
		session.setAttribute("emp", emp);
		return "editEmp";
	}

	// For User
	@RequestMapping("/editUser/{id}")
	public String editUser(@PathVariable int id, Model m) {
		Emp emp = empDao.getEmpById(id);
		m.addAttribute("emp", emp);

		return "editUser";
	}

	// For updating a new user or employee
	@RequestMapping(path = "/updateUser", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute Emp emp, @ModelAttribute Address address, HttpSession session) {
		// Email Validation
		String oldEmail1 = (String) session.getAttribute("email");
		String newEmail1 = emp.getEmail();
		boolean emailExists1 = empDao.checkEmailExistence(newEmail1);

		if (!oldEmail1.equals(newEmail1)) {
			if (emailExists1) {
				session.setAttribute("msg", "Email already exists");
				return "editUser";
			}
		}

		// Password validation
		String password = emp.getPassword();
		if (password == null || password.isEmpty()) {
			session.setAttribute("msg", "Password is required");
			return "editUser";
		} else if (password.length() < 8 || password.length() > 20) {
			session.setAttribute("msg", "Password must be between 8 to 20 characters");
			return "editUser";
		} else if (!password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*|?.,])[A-Za-z\\d!@#$%^&*|?.,]+$")) {
			session.setAttribute("msg",
					"Password must contain at least one uppercase letter, lowercase letter, digit, and special character");
			return "editUser";
		}

		List<Address> addresses = emp.getAddress();
		if (addresses != null && !addresses.isEmpty()) {
			for (Address add : addresses) {
				add.setEmp(emp);
			}
		}
		System.out.println(emp.getUserType());

		int j = empDao.saveAddress(address);
		
		empDao.update(emp);
		session.setAttribute("msg", "Updated Successfully");
		session.setAttribute("updateduser", emp);

		List<Emp> list = empDao.getAllEmpRowDetailsByEmail(newEmail1);
		session.setAttribute("empList", list);
		//String userType = emp.getUserType();
		if("user".equals(userTypeString))
				{
		return "/profile";
				}
		else {
			return "redirect:/home";
		}
	}

	// For Admin
	/*@RequestMapping(path = "/updateEmp", method = RequestMethod.POST)
	public String updateEmp(@ModelAttribute Emp emp, HttpSession session) {
		// Password validation
		String password = emp.getPassword();
		if (password == null || password.isEmpty()) {
			session.setAttribute("msg", "Password is required");
			return "editEmp";
		} else if (password.length() < 8 || password.length() > 20) {
			session.setAttribute("msg", "Password must be between 8 to 20 characters");
			return "editEmp";
		} else if (!password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*|?.,])[A-Za-z\\d!@#$%^&*|?.,]+$")) {
			session.setAttribute("msg",
					"Password must contain at least one uppercase letter, lowercase letter, digit, and special character");
			return "editEmp";
		}
		
		List<Address> addresses = emp.getAddress();
		if (addresses != null && !addresses.isEmpty()) {
			for (Address add : addresses) {
				add.setEmp(emp);
			}
		}

		// int j = empDao.saveAddress(address);
		System.out.println(emp.getUserType());
		empDao.update(emp);

		session.setAttribute("msg", "Updated Successfully");
		return "redirect:/home";
	}
*/
	@RequestMapping("/deleteEmp/{id}")
	public String deleteEMp(@PathVariable int id, HttpSession session) {
		empDao.deleteEmp(id);

		session.setAttribute("msg", "Employee deleted Successfully");

		return "redirect:/home";
	}

	@RequestMapping("/deleteAddress/{addressId}")
	public String deleteAddress(@PathVariable int addressId, HttpSession session) {
		empDao.deleteAddress(addressId);
			System.out.println( "Address Id is" + addressId);
			System.out.println("Before delete  message");
		session.setAttribute("msg", "Address deleted Successfully");
		System.out.println("After delete  message");

		return "editEmp";	}
	
	/*
	 * @DeleteMapping ("/deleteAddress/{addressId}")
	 * 
	 * @ResponseBody public String deleteAddress(@PathVariable int
	 * addressId, @ModelAttribute Address address, HttpSession session) {
	 * address.getAddressId(); System.out.println("AddressId:"+addressId); //
	 * System.out.println("Address ID is " +addressId);
	 * 
	 * empDao.deleteAddress(addressId); // System.out.println("Address ID is "
	 * +addressId);
	 * 
	 * session.setAttribute("msg", "address deleted Successfully");
	 * 
	 * 
	 * return "redirect:/home"; }
	 */
	 

	@RequestMapping("/login")
	public String loginPage() {

		return "login";
	}

	String email;
	String userTypeString;
	
// API for login functionality for admin and user
	@RequestMapping(path = "/userlogin", method = RequestMethod.POST)
	public String userLogin(@RequestParam("email") String em, @RequestParam("password") String pwd,
			@RequestParam("userType") String ut, HttpSession session, Model m) {
		Emp user = empDao.loginUser(em, pwd, ut);
		if (ut.equals("admin") && user != null) {
			session.setAttribute("loginuser", user);
			List<Emp> list = empDao.getAllEmp();
			m.addAttribute("empList", list);
			return "Home";
		} else if (user != null) {
			session.setAttribute("loginuser", user);
			List<Emp> list = empDao.getAllEmpRowDetailsByEmail(em);
			m.addAttribute("empList", list);

			// Store the email in a session attribute
			session.setAttribute("email", em);
			email = em;
			userTypeString = ut;
			return "profile";

		} else {
			session.setAttribute("msg", "invalid Email or Password");
			return "redirect:/login";
		}

	}

	// API for viewing a profile of user
	@RequestMapping("/myProfile")
	public String myProfile(Model m) {
		List<Emp> list = empDao.getAllEmpRowDetailsByEmail(email);
		m.addAttribute("empList", list);

		return "profile";
	}

	// API for logout for user / admin
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginuser");
		session.setAttribute("msg", "Logout Successfully");
		return "login";
	}

	@RequestMapping(path = "/userAddress", method = RequestMethod.POST)
	public ResponseEntity<String> userData(@ModelAttribute Emp emp, HttpSession session) {

		return ResponseEntity.ok("Data Insert");

	}

}
