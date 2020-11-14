/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hieunt.servlet;

import hieunt.tblarticle.ArticleDAO;
import hieunt.tblarticle.ArticleDTO;
import hieunt.tbluser.UserDTO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author HIEUNGUYEN
 */
@WebServlet(name = "NewPostServlet", urlPatterns = {"/NewPostServlet"})
public class NewPostServlet extends HttpServlet {

//    private final String MY_POST_PAGE = "ShowOwnPostServlet";
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
        HttpSession s = request.getSession();
        Boolean isSearchPage = false;
        UserDTO uDTO = (UserDTO) s.getAttribute("DTO");
        String url = "DispatchController?"
                + "btAction=showOwnPost";
        try {
            boolean isMutilPart = ServletFileUpload.isMultipartContent(request);
            if (!isMutilPart) {

            } else {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = null;
                try {
                    items = upload.parseRequest(request);
                } catch (FileUploadException e) {
                    log("NewPostServlet_FileUpload_" + e.getMessage());
                }
                Iterator iter = items.iterator();
                Hashtable params = new Hashtable();
                String fileName = null;
                while (iter.hasNext()) {
                    FileItem item = (FileItem) iter.next();
                    if (item.isFormField()) {
                        params.put(item.getFieldName(), item.getString());
                    } else {
                        try {
                            String itemName = item.getName();
                            fileName = itemName.substring(items.lastIndexOf("\\") + 1);
                            String realPath = getServletContext().getRealPath("/") + "img\\" + fileName;
                            File savedFile = new File(realPath);
                            item.write(savedFile);
                        } catch (Exception ex) {
                            log("NewPostServlet_" + ex.getMessage());
                        }
                    }
                }
                String title = ((String) params.get("txtTitle")).trim();
                String description = "";
                if (params.get("txtDescription") != null) {
                    description = (String) params.get("txtDescription");
                }
                String image = "";
                if (fileName != null && !fileName.trim().equals("")) {
                    int dot = fileName.lastIndexOf(".");
                    String type = fileName.substring(dot + 1);
                    if (type.equals("jpg") || type.equals("gif") || type.equals("png")) {
                        image = "./img/" + fileName;
                    }
                }
                if ((title != null && !title.equals("")) && (!image.trim().equals("") || !description.trim().equals(""))) {
                    ArticleDAO dao = new ArticleDAO();
                    int num = dao.getMaxID() + 1;
                    String postID = "P" + num;
                    ArticleDTO dto = new ArticleDTO(postID, title, description, image, "", uDTO.getEmail(), "");
                    dao.addArtcal(dto);
                }
                String isSaerch = (String) params.get("isSearchPage");
                if (isSaerch.equals("yes")) {
                    url = "DispatchController?"
                            + "txtSearch=&"
                            + "btAction=Search";
                    isSearchPage = true;

                }
            }
        } catch (SQLException ex) {
            log("NewPostServlet_SQL_" + ex.getMessage());
        } catch (NamingException ex) {
            log("NewPostServlet_Naming_" + ex.getMessage());

        } catch (ParseException ex) {
            log("NewPostServlet_Parse_" + ex.getMessage());

        } finally {
            if (isSearchPage) {
                response.sendRedirect(url);
            } else {
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
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
