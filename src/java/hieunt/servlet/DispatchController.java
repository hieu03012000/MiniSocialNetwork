/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hieunt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "DispatchController", urlPatterns = {"/DispatchController"})
public class DispatchController extends HttpServlet {

    private final String LOGIN_PAGE = "login.jsp";
    private final String LOGIN_SERVLET = "LoginServlet";
    private final String NEW_ACCOUNT_SERVLET = "CreateNewAccountServlet";
    private final String LOGOUT_SERVLET = "LogoutServlet";
    private final String SEARCH_SERVLET = "SearchServlet";
    private final String SHOW_POST_DETAIL = "ShowPostDetailServlet";
    private final String COMMENT_SERVLET = "CommentServlet";
    private final String NEW_POST_SERVLET = "NewPostServlet";
    private final String SHOW_OWN_POST = "ShowOwnPostServlet";
    private final String DELETE_POST_SERVET = "DeletePostServlet";
    private final String EMOTION_SERVLET = "EmotionServlet";
    private final String ACTIVATE_ACCOUNT = "ActiveServlet";

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
        String button = request.getParameter("btAction");
        String url = LOGIN_PAGE;
        try {
            if (button == null) {

            } else if (button.equals("Login")) {
                url = LOGIN_SERVLET;
            } else if (button.equals("Create New Account")) {
                url = NEW_ACCOUNT_SERVLET;
            } else if (button.equals("logout")) {
                url = LOGOUT_SERVLET;
            } else if (button.equals("Search")) {
                url = SEARCH_SERVLET;
            } else if (button.equals("readMore")) {
                url = SHOW_POST_DETAIL;
            } else if (button.equals("Comment")) {
                url = COMMENT_SERVLET;
            } else if (button.equals("Post")) {
                url = NEW_POST_SERVLET;
            } else if (button.equals("showOwnPost")) {
                url = SHOW_OWN_POST;
            } else if (button.equals("deletePost")) {
                url = DELETE_POST_SERVET;
            } else if (button.contains("Like") || button.contains("Dislike")) {
                url = EMOTION_SERVLET;
            } else if (button.equals("Activate")) {
                url = ACTIVATE_ACCOUNT;
            }

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
