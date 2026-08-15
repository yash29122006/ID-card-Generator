package servlet;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import logic.IdLogic;
import model.IdDetails;

import org.apache.pdfbox.pdmodel.*;
import org.apache.pdfbox.pdmodel.font.PDType1Font;

@WebServlet("/downloadIdCard")
public class DownloadIdCardServlet extends HttpServlet {

    private IdLogic dao = new IdLogic();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PDDocument document = null;
        PDPageContentStream cs = null;

        try {
            HttpSession session = request.getSession(false);

            if (session == null || session.getAttribute("studentId") == null) {
                response.getWriter().println("Session expired");
                return;
            }

            String id = (String) session.getAttribute("studentId");
            IdDetails s = dao.getStudentById(id);

            if (s == null) {
                response.getWriter().println("Student not found");
                return;
            }

            String fileName = s.getId() + "-ID-details.pdf";

            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition",
                    "attachment; filename=\"" + fileName + "\"");

            document = new PDDocument();
            PDPage page = new PDPage();
            document.addPage(page);

            cs = new PDPageContentStream(document, page);

            cs.beginText();
            cs.setFont(PDType1Font.HELVETICA_BOLD, 18);
            cs.newLineAtOffset(170, 750);
            cs.showText("STUDENT ID CARD");

            cs.newLineAtOffset(-100, -50);

            cs.setFont(PDType1Font.HELVETICA_BOLD, 14);
            cs.showText("Personal Details");

            cs.newLineAtOffset(0, -20);
            cs.setFont(PDType1Font.HELVETICA, 12);

            cs.showText("ID: " + s.getId());
            cs.newLineAtOffset(0, -18);
            cs.showText("Name: " + s.getName());
            cs.newLineAtOffset(0, -18);
            cs.showText("Email: " + s.getEmail());
            cs.newLineAtOffset(0, -18);
            cs.showText("Mobile: " + s.getMobile_no());
            cs.newLineAtOffset(0, -18);
            cs.showText("Blood Group: " + s.getBlood_group());

            cs.newLineAtOffset(0, -30);
            cs.setFont(PDType1Font.HELVETICA_BOLD, 14);
            cs.showText("Academic Details");

            cs.newLineAtOffset(0, -20);
            cs.setFont(PDType1Font.HELVETICA, 12);

            cs.showText("Roll No: " + s.getRoll_no());
            cs.newLineAtOffset(0, -18);
            cs.showText("Department: " + s.getDepartment());
            cs.newLineAtOffset(0, -18);
            cs.showText("Year: " + s.getYear());
            cs.newLineAtOffset(0, -18);
            cs.showText("Division: " + s.getDiv());

            cs.newLineAtOffset(0, -30);
            cs.setFont(PDType1Font.HELVETICA_BOLD, 14);
            cs.showText("Address Details");

            cs.newLineAtOffset(0, -20);
            cs.setFont(PDType1Font.HELVETICA, 12);

            cs.showText("City: " + s.getCity());
            cs.newLineAtOffset(0, -18);
            cs.showText("State: " + s.getState());
            cs.newLineAtOffset(0, -18);
            cs.showText("Pincode: " + s.getPincode());

            cs.endText();
            cs.close();
            cs = null;

            OutputStream out = response.getOutputStream();
            document.save(out);
            document.close();
            out.flush();
            out.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/plain");
            response.getWriter().println("ERROR: " + e.getMessage());
        } finally {
            try {
                if (cs != null) cs.close();
                if (document != null) document.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}