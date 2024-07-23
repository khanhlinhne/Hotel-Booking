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
public class Bill {
    private int id;
    private float discount;
    private Date paymentDate;
    private boolean paymentMode;
    private int bookingId;
    private float total;

    public Bill() {
    }

    public Bill(int id, float discount, Date paymentDate, boolean paymentMode, int bookingId, float total) {
        this.id = id;
        this.discount = discount;
        this.paymentDate = paymentDate;
        this.paymentMode = paymentMode;
        this.bookingId = bookingId;
        this.total = total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public boolean isPaymentMode() {
        return paymentMode;
    }

    public void setPaymentMode(boolean paymentMode) {
        this.paymentMode = paymentMode;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Bill{" + "id=" + id + ", discount=" + discount + ", paymentDate=" + paymentDate + ", paymentMode=" + paymentMode + ", bookingId=" + bookingId + ", total=" + total + '}';
    }
    
    
    
    
    
}
