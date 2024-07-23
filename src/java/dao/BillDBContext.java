/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Bill;
import model.Booking;

/**
 *
 * @author doan7
 */
public class BillDBContext extends DBContext{
    
    public List<Bill> getAllBills() {
    List<Bill> bills = new ArrayList<>();

    // Define the SQL query to fetch bills from the database
    String sql = "SELECT id, discount, paymentDate, paymentMode, booking_id, total FROM Bill";

    try {
         PreparedStatement statement = connection.prepareStatement(sql);
         ResultSet resultSet = statement.executeQuery(); 

        // Iterate through the result set and create Bill objects
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            float discount = resultSet.getFloat("discount");
            Date paymentDate = resultSet.getDate("paymentDate");
            boolean paymentMode = resultSet.getBoolean("paymentMode");
            int bookingId = resultSet.getInt("booking_id");
            float total = resultSet.getFloat("total");

            Bill bill = new Bill(id, discount, paymentDate, paymentMode, bookingId, total);
            bills.add(bill);
        }
    } catch (SQLException e) {
        // Handle any database-related exceptions here
        e.printStackTrace();
    }

    return bills;
}
    
    public Bill addBill(Bill bill) {
    // Define the SQL query to insert a new bill record into the database
    String sql = "INSERT INTO Bill (discount, paymentDate, paymentMode, booking_id, total) " +
                 "VALUES (?, ?, ?, ?, ?)";

    try {

       PreparedStatement statement = connection.prepareStatement(sql);
        statement.setFloat(1, bill.getDiscount());
        statement.setDate(2, bill.getPaymentDate());
        statement.setBoolean(3, bill.isPaymentMode());
        statement.setInt(4, bill.getBookingId());
        statement.setFloat(5, bill.getTotal());

        // Execute the SQL query to insert the new record
         statement.executeUpdate();
    
    } catch (SQLException e) {
        // Handle any database-related exceptions here
        e.printStackTrace();
        // You might want to throw your own custom exception here or log the error
    }

    return bill; // Return the Bill object with the updated ID (if auto-generated)
}
    
}
