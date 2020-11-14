/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hieunt.tblcomment;

import java.io.Serializable;

/**
 *
 * @author HIEUNGUYEN
 */
public class CommentDTO implements Serializable{
    private String email;
    private String postID;
    private String date;
    private String comment;
    private String name;

    public CommentDTO() {
    }

    public CommentDTO(String email, String postID, String date, String comment, String name) {
        this.email = email;
        this.postID = postID;
        this.date = date;
        this.comment = comment;
        this.name = name;
    }

    public String getComment() {
        return comment;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public void setComment(String comment) {
        this.comment = comment;
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
    
}
