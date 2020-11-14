/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hieunt.tblemotion;

import hieunt.util.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.naming.NamingException;

/**
 *
 * @author HIEUNGUYEN
 */
public class EmotionDAO implements Serializable {

    public int getLike(String postID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT count(emotionID) AS count "
                        + "FROM tblEmotion "
                        + "WHERE postID = ? AND type = ? AND status = 1 ";
                ps = con.prepareStatement(sql);
                ps.setString(1, postID);
                ps.setString(2, "Like");
                rs = ps.executeQuery();
                if (rs.next()) {
                    return rs.getInt("count");
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

    public int getDislike(String postID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT count(emotionID) AS count "
                        + "FROM tblEmotion "
                        + "WHERE postID = ? AND type = ?  AND status = 1 ";
                ps = con.prepareStatement(sql);
                ps.setString(1, postID);
                ps.setString(2, "Dislike");
                rs = ps.executeQuery();
                if (rs.next()) {
                    return rs.getInt("count");
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

    public boolean deleteAllPostEmotion(String postID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {

                String sql = "UPDATE tblEmotion SET status = ? WHERE postID = ?";
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

    public int getTypeEmotionOfEmail(String postID, String email) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT type "
                        + "FROM tblEmotion "
                        + "WHERE postID = ? AND email = ?  AND status = 1 ";
                ps = con.prepareStatement(sql);
                ps.setString(1, postID);
                ps.setString(2, email);
                rs = ps.executeQuery();
                if (rs.next()) {
                    String type = rs.getString("type");
                    if (type.equalsIgnoreCase("like")) {
                        return 1;
                    } else {
                        return -1;
                    }
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

    public boolean addEmotion(EmotionDTO dto) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO tblEmotion(postID, email, type, emotionDate, status) "
                        + "VALUES (?, ?, ?, ?, ?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, dto.getPostID());
                ps.setString(2, dto.getEmail());
                ps.setString(3, dto.getType());
                java.util.Date date = new java.util.Date();
                Timestamp d = new Timestamp(date.getTime());
                ps.setTimestamp(4, d);
                ps.setBoolean(5, true);
                int row = ps.executeUpdate();
                if(row > 0) {
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
    
    public boolean deleteEmotion(String postID, String email) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "DELETE FROM tblEmotion "
                        + "WHERE postID = ? AND email = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, postID);
                ps.setString(2, email);
                int row = ps.executeUpdate();
                if(row > 0) {
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
}
