/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hieunt.tblcomment;

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
public class CommentDAO implements Serializable {
    
    public List<CommentDTO> getCommentList(String postID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<CommentDTO> list = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT c.email, postID, c.date, comment, u.name "
                        + "FROM tblComment c join tblUser u on c.email = u.email "
                        + "WHERE postID = ? AND status = 1 "
                        + "ORDER BY date DESC ";
                ps = con.prepareStatement(sql);
                ps.setString(1, postID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    String email = rs.getString("email");
                    Timestamp date = rs.getTimestamp("date");
                    String comment = rs.getString("comment");
                    SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                    String d = format.format(date);
                    String name = rs.getString("name");
                    list.add(new CommentDTO(email, postID, d, comment, name));
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
    
    public boolean addComment(CommentDTO dto) throws SQLException, NamingException, ParseException {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                
                String sql = "INSERT INTO tblComment(email, postID, date, comment, status) "
                        + "VALUES (?, ?, ?, ?, ?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, dto.getEmail());
                ps.setString(2, dto.getPostID());
                java.util.Date date = new java.util.Date();
                Timestamp d = new Timestamp(date.getTime());
                ps.setTimestamp(3, d);
                ps.setString(4, dto.getComment());
                ps.setBoolean(5, true);
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
    
    public boolean deleteAllPostComment(String postID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                
                String sql = "UPDATE tblComment SET status = ? WHERE postID = ?";
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
                String sql = "SELECT email "
                        + "FROM tblComment "
                        + "WHERE postID = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, postID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    String name = rs.getString("email");
                    return name;
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
