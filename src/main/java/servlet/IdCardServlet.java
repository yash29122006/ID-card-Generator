package servlet;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.*;
import logic.IdLogic;
import model.IdDetails;
@WebServlet("/SaveStudent")
public class IdCardServlet extends HttpServlet {
	 private IdLogic dao = new IdLogic();

	    @Override
	    protected void doPost(HttpServletRequest req, HttpServletResponse res)
	            throws ServletException, IOException {

	        String action = req.getParameter("action");

	        if ("update".equals(action)) {

	        	String id = req.getParameter("id");
	        	int rollNo = Integer.parseInt(req.getParameter("roll_no"));
	            String name = req.getParameter("name").trim();
	            String email = req.getParameter("email");
	            String mobile = req.getParameter("mobile_no");
	            String department = req.getParameter("department");
	            String year = req.getParameter("year");
	            String div = req.getParameter("div");
	            String blood = req.getParameter("blood_group");
	            String city = req.getParameter("city");
	            int pincode = Integer.parseInt(req.getParameter("pincode"));
	            String state = req.getParameter("state");

	            boolean error = false;

	            if (name.isBlank()) {
	                error = true;
	                req.setAttribute("error", "Only spaces not allowed");
	            } else {
	                for (char c : name.toCharArray()) {
	                    if (!Character.isLetter(c) && c != ' ') {
	                        error = true;
	                        req.setAttribute("error", "Only letters allowed");
	                        break;
	                    }
	                }
	            }

	            if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
	                error = true;
	                req.setAttribute("error", "Invalid email");
	            }

	            if (error) {
	                req.setAttribute("error", req.getParameterMap());
	                RequestDispatcher rd = req.getRequestDispatcher("updateDetails.jsp");
	                rd.forward(req, res);
	                return;
	            }

	            IdDetails s = new IdDetails();
	            s.setId(id);
	            s.setRoll_no(rollNo);
	            s.setName(name);
	            s.setEmail(email);
	            s.setMobile_no(mobile);
	            s.setDepartment(department);
	            s.setYear(year);
	            s.setDiv(div);
	            s.setBlood_group(blood);
	            s.setCity(city);
	            s.setPincode(pincode);
	            s.setState(state);

	            dao.updateIdDetails(s);
	            res.sendRedirect("adminDashboard.jsp");
	        }

	        else {

	        	String id = req.getParameter("id").trim();
	        	int rollNo = Integer.parseInt(req.getParameter("roll_no"));
	        	String name = req.getParameter("name").trim();
	        	String email = req.getParameter("email");
	        	String mobile = req.getParameter("mobile_no");
	        	String department = req.getParameter("department");
	        	String year = req.getParameter("year");
	        	String division = req.getParameter("division");
	        	String blood = req.getParameter("blood_group");
	        	String city = req.getParameter("city");
	        	int pincode = Integer.parseInt(req.getParameter("pincode"));
	        	String state = req.getParameter("state");

	        	boolean error = false;

	        	if (name.isBlank()) {
	        	    error = true;
	        	    req.setAttribute("nameError", "Only spaces not allowed in Name");
	        	} else {
	        	    for (char c : name.toCharArray()) {
	        	        if (!Character.isLetter(c) && c != ' ') {
	        	            error = true;
	        	            req.setAttribute("nameError", "Name can contain only letters");
	        	            break;
	        	        }
	        	    }
	        	}

	        	if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
	        	    error = true;
	        	    req.setAttribute("error", "Invalid email format");
	        	}

	        	if (error) {
	        	    req.setAttribute("idValue", id);
	        	    req.setAttribute("rollValue", rollNo);
	        	    req.setAttribute("nameValue", name);
	        	    req.setAttribute("emailValue", email);
	        	    req.setAttribute("mobileValue", mobile);
	        	    req.setAttribute("departmentValue", department);
	        	    req.setAttribute("yearValue", year);
	        	    req.setAttribute("divisionValue", division);
	        	    req.setAttribute("bloodValue", blood);
	        	    req.setAttribute("cityValue", city);
	        	    req.setAttribute("pincodeValue", pincode);
	        	    req.setAttribute("stateValue", state);

	        	    RequestDispatcher rd = req.getRequestDispatcher("addDetails.jsp");
	        	    rd.forward(req, res);
	        	    return;
	        	}

	        	IdDetails s = new IdDetails();

	        	s.setId(id);
	        	s.setRoll_no(rollNo);
	        	s.setName(name);
	        	s.setEmail(email);
	        	s.setMobile_no(mobile);
	        	s.setDepartment(department);
	        	s.setYear(year);
	        	s.setDiv(division);
	        	s.setBlood_group(blood);
	        	s.setCity(city);
	        	s.setPincode(pincode);
	        	s.setState(state);

	        	dao.saveStudent(s);

	        	res.sendRedirect("adminDashboard.jsp");
	    }
	    }
	    
	    protected void doGet(HttpServletRequest req, HttpServletResponse res)
	            throws ServletException, IOException {

	        String action = req.getParameter("action");

	        if ("delete".equals(action)) {
	            String id = req.getParameter("id");
	            dao.deleteIdDetails(id);
	            res.sendRedirect("viewDetails.jsp");
	        }

	    }


}