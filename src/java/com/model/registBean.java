/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model;

import java.util.Date;
import java.util.regex.Pattern;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

/**
 *
 * @author Usuario
 */
@ManagedBean
@RequestScoped
public class registBean {
    
  
    private String name;
    private String lastname;
    private String email;
    private Date dob;
    
    

    /**
     * Creates a new instance of registBean
     */
    public registBean() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getdob() {
        return dob;
    }

    public void setdob(String date) {
        this.dob = dob;
    }
    
    
    
}
