/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hieunt.tblnotification;

import java.io.Serializable;

/**
 *
 * @author HIEUNGUYEN
 */
public class NotificationDTO implements Serializable{
    private String sender;
    private String title;
    private String date ;
    private String type;
    private String postID;

    public NotificationDTO() {
    }

    public NotificationDTO(String sender, String title, String date, String type, String postID) {
        this.sender = sender;
        this.title = title;
        this.date = date;
        this.type = type;
        this.postID = postID;
    }

    public String getDate() {
        return date;
    }

    public String getPostID() {
        return postID;
    }

    public String getSender() {
        return sender;
    }

    public String getTitle() {
        return title;
    }

    public String getType() {
        return type;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setPostID(String postID) {
        this.postID = postID;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    
}
