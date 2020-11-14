/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hieunt.servlet;

import hieunt.tblarticle.ArticleDAO;
import hieunt.tblemotion.EmotionDAO;
import hieunt.tblemotion.EmotionDTO;
import hieunt.tblnotification.NotificationDAO;
import hieunt.tblnotification.NotificationDTO;
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
@WebServlet(name = "EmotionServlet", urlPatterns = {"/EmotionServlet"})
public class EmotionServlet extends HttpServlet {

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
        String emotion = request.getParameter("btAction");
        String email = request.getParameter("txtMail");
        String postID = request.getParameter("txtPostID");
        String search = request.getParameter("txtSearch");
        String url = "DispatchController?"
                + "btAction=readMore&"
                + "txtSearch=" + search
                + "&txtPostID=" + postID;
        try {
            EmotionDAO dao = new EmotionDAO();
            int type = dao.getTypeEmotionOfEmail(postID, email); //1:like; -1;dislike; 0:nothing
            if ((emotion.contains("Like") && type == 1) || (emotion.contains("Dislike") && type == -1)) {
                dao.deleteEmotion(postID, email);
            } else {
                if (type != 0) {
                    dao.deleteEmotion(postID, email);
                }
                String e;
                if(emotion.contains("Dislike")) {
                    e = "Dislike";
                } else {
                    e = "Like";
                }
                dao.addEmotion(new EmotionDTO(postID, email, e, ""));
                HttpSession s = request.getSession();
                UserDTO dto = (UserDTO) s.getAttribute("DTO");
                NotificationDAO nDAO = new NotificationDAO();
                ArticleDAO aDAO = new ArticleDAO();
                String receiver = aDAO.getEmail(postID);
                if (!receiver.equals(email)) {
                    boolean result = nDAO.addNotification(receiver, email, emotion.toLowerCase(), postID);
                    if (result) {
                        List<NotificationDTO> list = nDAO.getNotificationByEmail(dto.getEmail());
                        s.setAttribute("NOICE", list);
                    }
                }
            }
        } catch (SQLException ex) {
            log("EmotionServlet_SQL_" + ex.getMessage());
        } catch (NamingException ex) {
            log("EmotionServlet_naming_" + ex.getMessage());
        } catch (ParseException ex) {
            log("EmotionServlet_parse_" + ex.getMessage());
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
