/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hieunt.tblarticle;

import java.io.Serializable;

/**
 *
 * @author HIEUNGUYEN
 */
public class ArticleDTO implements Serializable{
    private String postID;
    private String title;
    private String description;
    private String image;
    private String date;
    private String mail;
    private String name;
    

    public ArticleDTO() {
    }

    public ArticleDTO(String postID, String title, String description, String image, String date, String mail, String name) {
        this.postID = postID;
        this.title = title;
        this.description = description;
        this.image = image;
        this.date = date;
        this.mail = mail;
        this.name = name;
    }

    public String getPostID() {
        return postID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    

    public void setPostID(String postID) {
        this.postID = postID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }
    
}
