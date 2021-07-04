/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package locdq.dtos;

import java.util.Date;

/**
 *
 * @author test
 */
public class OrderDTO {
    private Date date;
    private float total;
    private String userID;

    public OrderDTO() {
    }

    public OrderDTO(Date date, float total, String userID) {
        this.date = date;
        this.total = total;
        this.userID = userID;
    }

    /**
     * @return the date
     */
    public Date getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(Date date) {
        this.date = date;
    }

    /**
     * @return the total
     */
    public float getTotal() {
        return total;
    }

    /**
     * @param total the total to set
     */
    public void setTotal(float total) {
        this.total = total;
    }

    /**
     * @return the userID
     */
    public String getUserID() {
        return userID;
    }

    /**
     * @param userID the userID to set
     */
    public void setUserID(String userID) {
        this.userID = userID;
    }

    @Override
    public String toString() {
        return "OrderDTO{" + "date=" + date + ", total=" + total + ", userID=" + userID + '}';
    }

   
    
    
}
