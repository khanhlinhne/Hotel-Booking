/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.User;

/**
 *
 * @author doan7
 */
public class UserDBContext extends DBContext{
    
    public User getUserbyUsername(Account acc){
       
        try {
            String sql = "SELECT * FROM [User] WHERE username = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, acc.getUsername()); // Assuming you have a getUsername method in the Account class

            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                // User found, create a User object with the retrieved data
                int id = rs.getInt("id");
                String name = rs.getString("name");
                Date dob = rs.getDate("dob");
                boolean gender = rs.getBoolean("gender");
                String address = rs.getString("address");
               
                // Retrieve other user properties here

                User user = new User(id, name, dob, gender, address, acc.getUsername());
                        return user;
                        
            }   } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }
    
    public User updateUser(User user){
             try {
            // Prepare an SQL update statement to update user information
            String sql = "UPDATE [User] SET name = ?, dob = ?, gender = ?, address = ? WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            // Set the values to be updated in the SQL statement
            stm.setString(1, user.getName());
            stm.setDate(2, user.getDob());
            stm.setBoolean(3, user.isGender());
            stm.setString(4, user.getAddress());
            stm.setInt(5, user.getId()); // Assuming you have a 'id' field in the User class

            // Execute the update
            int rowsUpdated = stm.executeUpdate();

            // Check if any rows were updated
            return user;
          
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            // Handle the exception, e.g., log the error or throw a custom exception
           
        }
     
        return null; // Update failed
    }
    
     public User addUser(User user) {

        try {
            // Assuming you have a database table named "users" with appropriate columns.
            String sql = "INSERT INTO [User] (name, dob, gender, address, username) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setDate(2, user.getDob());
            preparedStatement.setBoolean(3, user.isGender());
            preparedStatement.setString(4, user.getAddress());
            preparedStatement.setString(5, user.getUsername());

            int rowsInserted = preparedStatement.executeUpdate();
            if (rowsInserted > 0) {
                // Insertion was successful.
                System.out.println("User added to the database.");
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } 

        return null; // Insertion failed
    }
    
    
    
    
    public static void main(String[] args) {
        Account acc = new Account();
        acc.setUsername("qwer");
        acc.setPassword("123a");
        acc.setPhone("012345678");
        acc.setEmail("sdfsdf@sdfsdf");
        System.out.println(new UserDBContext().getUserbyUsername(acc));
    }
    
}
