/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hieunt.tblemotion;

import java.io.Serializable;

/**
 *
 * @author HIEUNGUYEN
 */
public class EmotionDTO implements Serializable{
    private String postID;
    private String email;
    private String type;
    private String date;

    public EmotionDTO() {
    }

    public EmotionDTO(String postID, String email, String type, String date) {
        this.postID = postID;
        this.email = email;
        this.type = type;
        this.date = date;
    }

    public String getDate() {
        return date;
    }

    public String getEmail() {
        return email;
    }

    public String getPostID() {
        return postID;
    }

    public String getType() {
        return type;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPostID(String postID) {
        this.postID = postID;
    }

    public void setType(String type) {
        this.type = type;
    }
    
}
