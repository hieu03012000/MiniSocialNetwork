/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hieunt.tblarticle;

import hieunt.util.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author HIEUNGUYEN
 */
public class ArticleDAO implements Serializable {

    public List<ArticleDTO> getArticalList(String searchValue, int index) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<ArticleDTO> list = null;
        int num = (index - 1) * 20;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT DISTINCT postID, title, description, image, date, mail , name "
                        + "FROM tblArticle join tblUser on tblArticle.mail = tblUser.email "
                        + "WHERE title LIKE ? AND status = 1 "
                        + "ORDER BY date DESC "
                        + "OFFSET ? ROWS "
                        + "FETCH NEXT 20 ROWS ONLY ";
                ps = con.prepareStatement(sql);
                ps.setString(1, "%" + searchValue + "%");
                ps.setInt(2, num);
                rs = ps.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    String postID = rs.getString("postID");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    String image = rs.getString("image");
                    Timestamp date = rs.getTimestamp("date");
                    String mail = rs.getString("mail");
                    String name = rs.getString("name");
                    SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                    String d = format.format(date);
                    list.add(new ArticleDTO(postID, title, description, image, d, mail, name));
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public int pageCount(String searchValue) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT count(postID) AS row "
                        + "FROM tblArticle "
                        + "WHERE title LIKE ? AND status = 1";
                ps = con.prepareStatement(sql);
                ps.setString(1, "%" + searchValue + "%");
                rs = ps.executeQuery();
                if (rs.next()) {
                    int count = (rs.getInt("row") - 1) / 20;
                    return count + 1;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return 0;
    }

    public ArticleDTO getDetail(String postID, String name) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT postID, title, description, image, date, mail "
                        + "FROM tblArticle "
                        + "WHERE postID = ? ";
                ps = con.prepareStatement(sql);
                ps.setString(1, postID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    String id = rs.getString("postID");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    String image = rs.getString("image");
                    SimpleDateFormat fm = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                    String d = fm.format(rs.getTimestamp("date"));
                    String mail = rs.getString("mail");
                    return new ArticleDTO(id, title, description, image, d, mail, name);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }

    public boolean addArtcal(ArticleDTO dto) throws SQLException, NamingException, ParseException {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {

                String sql = "INSERT INTO tblArticle(postID, title, description, image, date, mail, status) "
                        + "VALUES (?, ?, ?, ?, ?, ?, ?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, dto.getPostID());
                ps.setString(2, dto.getTitle());
                ps.setString(3, dto.getDescription());
                ps.setString(4, dto.getImage());
                java.util.Date date = new java.util.Date();
                Timestamp d = new Timestamp(date.getTime());
                ps.setTimestamp(5, d);
                ps.setString(6, dto.getMail());
                ps.setBoolean(7, true);
                int row = ps.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public int getMaxID() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT TOP 1 (postID) "
                        + "FROM tblArticle "
                        + "ORDER BY date DESC";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                if (rs.next()) {
                    String numString = rs.getString("postID").substring(1);
                    return Integer.parseInt(numString);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return 0;
    }

    public List<ArticleDTO> getArticalListByEmail(String email) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<ArticleDTO> list = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT postID, title, description, image, date, mail "
                        + "FROM tblArticle "
                        + "WHERE mail = ? AND status = 1 "
                        + "ORDER BY date DESC ";
                ps = con.prepareStatement(sql);
                ps.setString(1, email);
                rs = ps.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    String postID = rs.getString("postID");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    String image = rs.getString("image");
                    Timestamp date = rs.getTimestamp("date");
                    SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                    String d = format.format(date);
                    list.add(new ArticleDTO(postID, title, description, image, d, email, ""));
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public boolean deletePost(String postID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {

                String sql = "UPDATE tblArticle SET status = ? WHERE postID = ?";
                ps = con.prepareStatement(sql);
                ps.setBoolean(1, false);
                ps.setString(2, postID);
                int row = ps.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public String getEmail(String postID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {

                String sql = "SELECT mail FROM tblArticle WHERE postID = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, postID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return rs.getString("mail");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }
}
