/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hieunt.tblnotification;

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
public class NotificationDAO implements Serializable{
    public List<NotificationDTO> getNotificationByEmail(String email) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<NotificationDTO> list = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT DISTINCT TOP 20 u.name, n.date, n.type, a.title, n.postID "
                        + "FROM tblUser u JOIN tblNotification n ON u.email = n.sender "
                        + "JOIN tblArticle a ON a.postID = n.postID "
                        + "WHERE n.receiver = ? "
                        + "ORDER BY date DESC ";
                ps = con.prepareStatement(sql);
                ps.setString(1, email);
                rs = ps.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    String name = rs.getString("name");
                    String title = rs.getString("title");
                    Timestamp date = rs.getTimestamp("date");
                    SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                    String d = format.format(date);
                    String type = rs.getString("type");
                    String postID = rs.getString("postID");
                    list.add(new NotificationDTO(name, title, d, type, postID));
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
    
    public boolean addNotification(String email, String sendMail, String type, String postID) throws SQLException, NamingException, ParseException {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {

                String sql = "INSERT INTO tblNotification(receiver, sender, date, type, postID) "
                        + "VALUES (?, ?, ?, ?, ?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, email);
                ps.setString(2, sendMail);
                java.util.Date date = new java.util.Date();
                Timestamp d = new Timestamp(date.getTime());
                ps.setTimestamp(3, d);
                ps.setString(4, type);
                ps.setString(5, postID);
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
}
