
package servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import logic.IdLogic;
import model.IdDetails;

@WebServlet("/studentDashboard")
public class StudentDashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("studentId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String id = (String) session.getAttribute("studentId");

        IdLogic dao = new IdLogic();
        IdDetails student = dao.getStudentById(id);

        request.setAttribute("studentData", student);

        RequestDispatcher rd = request.getRequestDispatcher("studentDashboard.jsp");
        rd.forward(request, response);
    }
}
