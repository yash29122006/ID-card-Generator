
package logic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.IdDetails;
import util.DBConnect;

public class IdLogic {

	public void saveStudent(IdDetails s) {

	    String sql = "INSERT INTO student (id, roll_no, name, email, mobile_no, department, year, division, blood_group, city, pincode, state) "
	               + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

	    try (Connection con = DBConnect.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setString(1, s.getId());
	        ps.setInt(2, s.getRoll_no());
	        ps.setString(3, s.getName());
	        ps.setString(4, s.getEmail());
	        ps.setString(5, s.getMobile_no());
	        ps.setString(6, s.getDepartment());
	        ps.setString(7, s.getYear());
	        ps.setString(8, s.getDiv());
	        ps.setString(9, s.getBlood_group());
	        ps.setString(10, s.getCity());
	        ps.setInt(11, s.getPincode());
	        ps.setString(12, s.getState());

	        ps.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	
	public List<IdDetails> getAllStudents() {

	    List<IdDetails> list = new ArrayList<>();
	    String sql = "SELECT * FROM student";

	    try (Connection con = DBConnect.getConnection();
	         Statement st = con.createStatement();
	         ResultSet rs = st.executeQuery(sql)) {

	        while (rs.next()) {

	        	IdDetails s = new IdDetails(
	        		    rs.getInt("roll_no"),
	        		    rs.getString("name"),
	        		    rs.getString("email"),
	        		    rs.getString("mobile_no"),
	        		    rs.getString("department"),
	        		    rs.getString("year"),
	        		    rs.getString("division"),
	        		    rs.getString("blood_group"),
	        		    rs.getString("city"),
	        		    rs.getInt("pincode"),
	        		    rs.getString("state")
	        		);
	        	s.setId(rs.getString("id"));

	            list.add(s);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	
	public IdDetails getStudentById(String id) {

	    IdDetails s = null;
	    String sql = "SELECT * FROM student WHERE id=?";

	    try (Connection con = DBConnect.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setString(1, id);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {

	            s = new IdDetails();

	            s.setId(rs.getString("id"));
	            s.setRoll_no(rs.getInt("roll_no"));
	            s.setName(rs.getString("name"));
	            s.setEmail(rs.getString("email"));
	            s.setMobile_no(rs.getString("mobile_no"));
	            s.setDepartment(rs.getString("department"));
	            s.setYear(rs.getString("year"));
	            s.setDiv(rs.getString("division"));
	            s.setBlood_group(rs.getString("blood_group"));
	            s.setCity(rs.getString("city"));
	            s.setPincode(rs.getInt("pincode"));
	            s.setState(rs.getString("state"));
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return s;
	}

	
	public void updateIdDetails(IdDetails s) {

		String sql = "UPDATE student SET name=?, email=?, mobile_no=?, department=?, year=?, division=?, blood_group=?, city=?, pincode=?, state=? WHERE id=?";

	    try (Connection con = DBConnect.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setString(1, s.getName());
	        ps.setString(2, s.getEmail());
	        ps.setString(3, s.getMobile_no());
	        ps.setString(4, s.getDepartment());
	        ps.setString(5, s.getYear());
	        ps.setString(6, s.getDiv());
	        ps.setString(7, s.getBlood_group());
	        ps.setString(8, s.getCity());
	        ps.setInt(9, s.getPincode());
	        ps.setString(10, s.getState());
	        ps.setString(11, s.getId()); 

	        ps.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}


	public void deleteIdDetails(String id) {

	    String sql = "DELETE FROM student WHERE id = ?";

	    try (Connection con = DBConnect.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setString(1, id);
	        ps.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}



}
