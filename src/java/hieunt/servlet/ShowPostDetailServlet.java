/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hieunt.servlet;

import hieunt.tblarticle.ArticleDAO;
import hieunt.tblarticle.ArticleDTO;
import hieunt.tblcomment.CommentDAO;
import hieunt.tblcomment.CommentDTO;
import hieunt.tblemotion.EmotionDAO;
import hieunt.tbluser.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HIEUNGUYEN
 */
@WebServlet(name = "ShowPostDetailServlet", urlPatterns = {"/ShowPostDetailServlet"})
public class ShowPostDetailServlet extends HttpServlet {

    private final String SHOW_POST_PAGE = "postDetail.jsp";

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
        String url = SHOW_POST_PAGE;
        String postID = request.getParameter("txtPostID");
        String search = request.getParameter("txtSearch");
        String isSearchPage = request.getParameter("isSearchPage");
        try {
            ArticleDAO aDAO = new ArticleDAO();
            UserDAO uDAO = new UserDAO();
            String name = uDAO.getUserName(aDAO.getEmail(postID));
            ArticleDTO aDTO = aDAO.getDetail(postID, name);
            CommentDAO cDAO = new CommentDAO();
            List<CommentDTO> cList = cDAO.getCommentList(postID);
            EmotionDAO eDAO = new EmotionDAO();
            int like = eDAO.getLike(postID);
            int dislike = eDAO.getDislike(postID);
            if (aDTO != null) {
                request.setAttribute("DETAIL", aDTO);
                request.setAttribute("COMMENT_LIST", cList);
                request.setAttribute("LIKE", like);
                request.setAttribute("DISLIKE", dislike);
                request.setAttribute("SEARCH_VALUE", search);
                if(isSearchPage.equals("yes")) {
                    request.setAttribute("IS_SEARCH", "yes");
                }
            }
        } catch (SQLException ex) {
            log("ShowPostDetailServlet_SQL_" + ex.getMessage());
        } catch (NamingException ex) {
            log("ShowPostDetailServlet_Naming_" + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
