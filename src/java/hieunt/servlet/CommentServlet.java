/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hieunt.servlet;

import hieunt.tblarticle.ArticleDAO;
import hieunt.tblcomment.CommentDAO;
import hieunt.tblcomment.CommentDTO;
import hieunt.tblnotification.NotificationDAO;
import hieunt.tblnotification.NotificationDTO;
import hieunt.tbluser.UserDAO;
import hieunt.tbluser.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
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
@WebServlet(name = "CommentServlet", urlPatterns = {"/CommentServlet"})
public class CommentServlet extends HttpServlet {

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
        String comment = request.getParameter("txtComment");
        String email = request.getParameter("txtEmail");
        String postID = request.getParameter("txtPostID");
        String search = request.getParameter("txtSearch");
        String url = "DispatchController?"
                + "btAction=readMore&"
                + "txtSearch=" + search
                + "&txtPostID=" + postID;
        try {
            if (comment != null) {
                if (!comment.trim().equals("")) {
                    CommentDAO dao = new CommentDAO();
                    UserDAO uDAO = new UserDAO();
                    String name = uDAO.getUserName(email);
                    dao.addComment(new CommentDTO(email, postID, "", comment, name));
                    HttpSession s = request.getSession();
                    ArticleDAO aDAO = new ArticleDAO();
                    String receiver = aDAO.getEmail(postID);
                    if (!receiver.equals(email)) {
                        NotificationDAO nDAO = new NotificationDAO();
                        boolean result = nDAO.addNotification(receiver, email, "comment", postID);
                        if (result) {
                            UserDTO dto = (UserDTO) s.getAttribute("DTO");
                            List<NotificationDTO> list = nDAO.getNotificationByEmail(dto.getEmail());
                            s.setAttribute("NOICE", list);
                        }
                    }
                }
            }
        } catch (SQLException ex) {
            log("CommentServlet_SQL_" + ex.getMessage());
        } catch (NamingException ex) {
            log("CommentServlet_Naming_" + ex.getMessage());
        } catch (ParseException ex) {
            log("CommentServlet_Parse_" + ex.getMessage());
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
