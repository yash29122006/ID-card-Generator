
package login_logout;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.DBConnect;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    		String role = request.getParameter("role");

    		if (role == null) {
    		    request.setAttribute("error", "Please select Student or Admin");
    		    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
    		    rd.forward(request, response);
    		    return;
    		}
	
	        try {
	            Connection con = DBConnect.getConnection();
	            if ("admin".equals(role)) {

	                String username = request.getParameter("username");
	                String password = request.getParameter("adminPassword");

	                String sql = "SELECT * FROM admin_login WHERE username=? AND password=?";
	                PreparedStatement ps = con.prepareStatement(sql);
	                ps.setString(1, username);
	                ps.setString(2, password);

	                ResultSet rs = ps.executeQuery();

	                if (rs.next()) {
	                    HttpSession session = request.getSession();
	                    session.setAttribute("username", username);
	                    response.sendRedirect("adminDashboard.jsp");
	                } else {
	                    request.setAttribute("error", "Invalid Admin Credentials!");
	                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
	                    rd.forward(request, response);
	                }

	            } else if ("student".equals(role)) {

	                String id = request.getParameter("id");
	                String password = request.getParameter("studentPassword");
	                if ("student".equals(role)) {
	            	    if (id == null || password == null || id.isEmpty() || password.isEmpty()) {
	            	        request.setAttribute("error", "Student ID and password required");
	            	        request.getRequestDispatcher("login.jsp").forward(request, response);
	            	        return;
	            	    }
	            	}

	                String sql = "SELECT * FROM student_login WHERE student_id=? AND password=?";
	                PreparedStatement ps = con.prepareStatement(sql);
	                ps.setString(1, id);
	                ps.setString(2, password);

	                ResultSet rs = ps.executeQuery();

	                if (rs.next()) {
	                	HttpSession session = request.getSession();
	                	session.setAttribute("studentId", id);  
	                	response.sendRedirect("studentDashboard");

	                } else {
	                    request.setAttribute("error", "Invalid Student Credentials!");
	                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
	                    rd.forward(request, response);
	                }
	            }
	            con.close();
	
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
    	
    }
}
