/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hieunt.servlet;

import hieunt.tblnotification.NotificationDAO;
import hieunt.tblnotification.NotificationDTO;
import hieunt.util.PasswordEncryption;
import hieunt.util.SendEmail;
import hieunt.tbluser.UserDAO;
import hieunt.tbluser.UserDTO;
import hieunt.util.RandomCode;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.mail.MessagingException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HIEUNGUYEN
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    private final String LOGIN_PAGE = "login.jsp";
    private final String SEARCH_PAGE = "SearchServlet";
    private final String ACTIVE_PAGE = "activate.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = LOGIN_PAGE;
        try {
            String email = request.getParameter("txtEmail");
            String pass = request.getParameter("txtPassword");
            PasswordEncryption pe = new PasswordEncryption();
            String password = pe.toSHAString(pass);
            UserDAO dao = new UserDAO();
            UserDTO dto = dao.checkLogin(email, password);
            HttpSession s = request.getSession();
            if (dto != null) {
                s.setAttribute("INVALID", "");
                if (dto.getStatus().equalsIgnoreCase("A")) {
                    url = SEARCH_PAGE;
                    NotificationDAO nDAO = new NotificationDAO();
                    List<NotificationDTO> list = nDAO.getNotificationByEmail(email);
                    s.setAttribute("NOICE", list);
                    s.setAttribute("DTO", dto);

                } else if (dto.getStatus().equalsIgnoreCase("N")) {
                    url = ACTIVE_PAGE;
                    RandomCode rc = new RandomCode();
                    String code = rc.getRandomCode();
                    dao.addVerifyCode(email, code);
                    SendEmail.sendText(email, code);
                    s.setAttribute("DTO", dto);
                }
            } else {
                s.setAttribute("INVALID", "Invalid email or password");
            }
        } catch (SQLException ex) {
            log("LoginServlet_SQL_" + ex.getMessage());
        } catch (NamingException ex) {
            log("LoginServlet_Naming_" + ex.getMessage());
        } catch (MessagingException ex) {
            log("LoginServlet_Mess_" + ex.getMessage());
        } finally {
            response.sendRedirect(url);
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
