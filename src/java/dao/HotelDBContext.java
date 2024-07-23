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
import model.Hotel;

/**
 *
 * @author doan7
 */
public class HotelDBContext extends DBContext{
    
    public List<Hotel> getHotels(){
     List<Hotel> hotels = new ArrayList<>();
        
        try {
            // Prepare an SQL query to select hotels from the database
            String sql = "SELECT * FROM Hotel";
            PreparedStatement stm = connection.prepareStatement(sql);

            // Execute the query and retrieve the results
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String image = rs.getString("image");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                float rating = rs.getFloat("rating");
                boolean isActive = rs.getBoolean("isActive");
                String description = rs.getString("description");
                String feedback = rs.getString("feedback");

                // Create a Hotel object with the retrieved data
                Hotel hotel = new Hotel(id, name, image, address, phone, rating, isActive, description, feedback);

                // Add the hotel to the list
                hotels.add(hotel);
            }

        } catch (SQLException ex) {
            // Handle the exception, e.g., log the error or throw a custom exception
            ex.printStackTrace();
        }

        return hotels;
    }
    
    public Hotel addHotel(Hotel hotel){
         try {
            // Prepare an SQL insert statement to add a new hotel
            String sql = "INSERT INTO Hotel (name, image, address, phone, rating, isActive, description, feedback) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

            // Set the values to be inserted in the SQL statement
            stm.setString(1, hotel.getName());
            stm.setString(2, hotel.getImage());
            stm.setString(3, hotel.getAddress());
            stm.setString(4, hotel.getPhone());
            stm.setFloat(5, hotel.getRating());
            stm.setBoolean(6, hotel.isIsActive());
            stm.setString(7, hotel.getDescription());
            stm.setString(8, hotel.getFeedback());

            // Execute the insert statement
            int rowsInserted = stm.executeUpdate();

            if (rowsInserted > 0) {
                // Retrieve the generated keys (e.g., auto-generated ID) of the newly added hotel
                ResultSet generatedKeys = stm.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int generatedId = generatedKeys.getInt(1);
                    hotel.setId(generatedId); // Set the ID of the added hotel
                    return hotel;
                }
            }
        } catch (SQLException ex) {
            // Handle the exception, e.g., log the error or throw a custom exception
            ex.printStackTrace();
        }

        return null; // Return null if the hotel couldn't be added
    }
    
    public Hotel getHotelById(int id) {
        Hotel hotel = null;

        try {
            // Prepare an SQL query to select a hotel by ID
            String sql = "SELECT * FROM Hotel WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);

            // Execute the query and retrieve the result
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                String name = rs.getString("name");
                String image = rs.getString("image");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                float rating = rs.getFloat("rating");
                boolean isActive = rs.getBoolean("isActive");
                String description = rs.getString("description");
                String feedback = rs.getString("feedback");

                // Create a Hotel object with the retrieved data
                hotel = new Hotel(id, name, image, address, phone, rating, isActive, description, feedback);
            }
        } catch (SQLException ex) {
            // Handle the exception, e.g., log the error or throw a custom exception
            ex.printStackTrace();
        }

        return hotel;
    }
    
   public Hotel updateHotel(Hotel hotel) {
        try {
            // Prepare an SQL update statement to update a hotel's information
            String sql = "UPDATE Hotel SET name = ?, image = ?, address = ?, phone = ?, rating = ?, isActive = ?, description = ?, feedback = ? WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            // Set the updated values in the SQL statement
            stm.setString(1, hotel.getName());
            stm.setString(2, hotel.getImage());
            stm.setString(3, hotel.getAddress());
            stm.setString(4, hotel.getPhone());
            stm.setFloat(5, hotel.getRating());
            stm.setBoolean(6, hotel.isIsActive());
            stm.setString(7, hotel.getDescription());
            stm.setString(8, hotel.getFeedback());
            stm.setInt(9, hotel.getId());

            // Execute the update statement
            int rowsUpdated = stm.executeUpdate();

            if (rowsUpdated > 0) {
                return hotel; // Return the updated hotel object
            }
        } catch (SQLException ex) {
            // Handle the exception, e.g., log the error or throw a custom exception
            ex.printStackTrace();
        }

        return null; // Return null if the update failed
    }
    
    public static void main(String[] args) {
        System.out.println(new HotelDBContext().getHotelById(2));
    }
    
}
