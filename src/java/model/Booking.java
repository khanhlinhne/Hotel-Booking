/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author doan7
 */
public class Booking {
    
    private int id;
    private int roomId;
    private int userId;
    private Date startDate;
    private Date endDate;
    

    public Booking() {
    }

    public Booking(int id, int roomId, int userId, Date startDate, Date endDate) {
        this.id = id;
        this.roomId = roomId;
        this.userId = userId;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

   
    
    

    @Override
    public String toString() {
        return "Booking{" + "id=" + id + ", roomId=" + roomId + ", userId=" + userId + ", startDate=" + startDate + ", endDate=" + endDate + '}';
    }
    
    
    
    
    
    
    
}
