/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Booking;
import model.User;
import java.sql.Date;

/**
 *
 * @author doan7
 */
public class BookingDBContext extends DBContext {

    public List<Booking> getBookings() {
        List<Booking> bookings = new ArrayList<>();

        try {
            // Create and execute a SQL query to retrieve bookings
            String query = "SELECT id, room_id, user_id, startDate, endDate FROM Booking";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            // Iterate through the result set and create Booking objects
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int roomId = resultSet.getInt("room_id");
                int userId = resultSet.getInt("user_id");
                Date startDate = resultSet.getDate("startDate");
                Date endDate = resultSet.getDate("endDate");

                Booking booking = new Booking(id, roomId, userId, startDate, endDate);
                bookings.add(booking);
            }

        } catch (SQLException e) {
            // Handle any database-related exceptions here
            e.printStackTrace();
        }

        return bookings;
    }

    public List<Booking> getBookingsByUser(User user) {
        List<Booking> bookings = new ArrayList<>();

        try {
            // Create and execute a SQL query to retrieve bookings
            String query = "SELECT id, room_id, user_id,startDate,endDate FROM Booking where user_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, user.getId());
            ResultSet resultSet = preparedStatement.executeQuery();

            // Iterate through the result set and create Booking objects
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int roomId = resultSet.getInt("room_id");
                int userId = resultSet.getInt("user_id");
                Date startDate = resultSet.getDate("startDate");
                Date endDate = resultSet.getDate("endDate");

                Booking booking = new Booking(id, roomId, userId, startDate, endDate);

                bookings.add(booking);
            }

        } catch (SQLException e) {
            // Handle any database-related exceptions here
            e.printStackTrace();
        }

        return bookings;
    }

    public Booking getBooking(Booking b) {
        Booking booking = null;

        try {
            // Create and execute a SQL query to retrieve a booking by its ID
            String query = "SELECT id, room_id, user_id, startDate, endDate FROM Booking WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, b.getId()); // Set the booking ID as a parameter

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int id = resultSet.getInt("id");
                int roomId = resultSet.getInt("room_id");
                int userId = resultSet.getInt("user_id");
                Date startDate = resultSet.getDate("startDate");
                Date endDate = resultSet.getDate("endDate");

                booking = new Booking(id, roomId, userId, startDate, endDate);
            }
        } catch (SQLException e) {
            // Handle any database-related exceptions here
            e.printStackTrace();
        }

        return booking;
    }

    public Booking addBooking(Booking b) {
        try {
            // Create and execute an SQL query to insert a new booking
            String query = "INSERT INTO Booking (room_id, user_id, startDate, endDate) VALUES (?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setInt(1, b.getRoomId());
            preparedStatement.setInt(2, b.getUserId());
            preparedStatement.setDate(3, new java.sql.Date(b.getStartDate().getTime()));
            preparedStatement.setDate(4, new java.sql.Date(b.getEndDate().getTime()));

            preparedStatement.executeUpdate();
            return b;
        } catch (SQLException e) {
            // Handle any database-related exceptions here

        }

        return null;
    }

    public Booking updateBooking(Booking b) {
        try {
            // Create and execute an SQL query to update an existing booking
            String query = "UPDATE Booking SET room_id = ?, user_id = ?, startDate = ?, endDate = ? WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setInt(1, b.getRoomId());
            preparedStatement.setInt(2, b.getUserId());
            preparedStatement.setDate(3, new java.sql.Date(b.getStartDate().getTime()));
            preparedStatement.setDate(4, new java.sql.Date(b.getEndDate().getTime()));
            preparedStatement.setInt(5, b.getId());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // Handle any database-related exceptions here
            e.printStackTrace();
        }

        return b;
    }

    public Booking deleteBooking(Booking b) {
        boolean success = false;

        try {
            // Create and execute an SQL query to delete a booking by its ID
            String query = "DELETE FROM Booking WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setInt(1, b.getId());

            int rowsAffected = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // Handle any database-related exceptions here
            e.printStackTrace();
        }

        return b;

    }

    public void cancelBooking(int bookingId) {
        try {
            // Giả sử rằng mỗi mục đặt chỗ được lưu trong bảng BookingItems với cột booking_id và item_id
            String query = "DELETE FROM Booking WHERE id = ? ";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, bookingId);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
        BookingDBContext a = new BookingDBContext();
        a.cancelBooking(487);
    }

}
