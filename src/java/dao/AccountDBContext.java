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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author doan7
 */
public class AccountDBContext extends DBContext{
    
    public List<Account> getAllAccounts(){
        List<Account> accs = new ArrayList<>();
        try {
            String sql = "select * from Account";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            
             ResultSet result = stm.executeQuery();

        while (result.next()) {
            String username = result.getString("username");
            String password = result.getString("password");
            String phone = result.getString("phone");
            String email = result.getString("email");
            String role = result.getString("role");
            

            Account account = new Account(username, password, phone, email, role);
            accs.add(account);
        }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return accs;
    }
    
    public List<Account> searchAllAccounts(String username1){
        List<Account> accs = new ArrayList<>();
        try {
            String sql = "select * from Account where username like ?";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username1);
             ResultSet result = stm.executeQuery();

        while (result.next()) {
            String username = result.getString("username");
            String password = result.getString("password");
            String phone = result.getString("phone");
            String email = result.getString("email");
            String role = result.getString("role");
            

            Account account = new Account(username, password, phone, email, role);
            accs.add(account);
        }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return accs;
    }
    
    public Account getAccountByUsername(Account acc){
         try {
        String sql = "SELECT * FROM Account WHERE username = ?";

      
        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setString(1, acc.getUsername());

        ResultSet result = stm.executeQuery();

        if (result.next()) {
            String username = result.getString("username");
            String password = result.getString("password");
            String phone = result.getString("phone");
            String email = result.getString("email");
            String role = result.getString("role");
            

            return new Account(username, password, phone, email, role);
        }
    } catch (SQLException ex) {
        Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
    } 
    

    return null;
    }
    
    
    public Account getAccount(Account acc){
         try {
        String sql = "SELECT * FROM Account WHERE username = ? AND password = ?";

      
        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setString(1, acc.getUsername());
        stm.setString(2, acc.getPassword());

        ResultSet result = stm.executeQuery();

        if (result.next()) {
            String username = result.getString("username");
            String password = result.getString("password");
            String phone = result.getString("phone");
            String email = result.getString("email");
            String role = result.getString("role");
            

            return new Account(username, password, phone, email, role);
        }
    } catch (SQLException ex) {
        Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
    } 
    

    return null;
    }
    
    
    public static void main(String[] args) {
        AccountDBContext a = new AccountDBContext();
        Account acc = new Account();
        acc.setUsername("qwer");
        acc.setPassword("123a");
        acc.setPhone("012345678");
        acc.setEmail("sdfsdf@sdfsdf");
        
        System.out.println(a.getAccountByUsername(acc));
    }
    
    
    public Account addAccount(Account acc){
         try {
        String sql = "INSERT INTO Account (username, password, phone, email, role) VALUES (?, ?, ?, ?, ?)";

        // Ensure that you've established a database connection

        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setString(1, acc.getUsername());
        stm.setString(2, acc.getPassword());
        stm.setString(3, acc.getPhone());
        stm.setString(4, acc.getEmail());
        stm.setString(5, acc.getRole());

             int rowsAffected = stm.executeUpdate();

        if (rowsAffected > 0) {
            // Account was successfully added, so we return the added account
            return acc;
        }
    } catch (SQLException ex) {
        Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
    } 

    return null; 
    }
    
    public Account updateAccount(Account acc){
        try {
        String sql = "UPDATE Account SET password = ?, phone = ?, email = ?, role = ? WHERE username = ?";

     
        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setString(1, acc.getPassword());
        stm.setString(2, acc.getPhone());
        stm.setString(3, acc.getEmail());
        stm.setString(4, acc.getRole());
        stm.setString(5, acc.getUsername());

        int rowsAffected = stm.executeUpdate();

        if (rowsAffected > 0) {
            // Account was successfully updated, so we return the updated account
            return acc;
        }
    } catch (SQLException ex) {
        Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
    } 
    return null; // Return null if the account couldn't be updated
    }
    
    public void ChangeRole(String username, String role){
        try {
        String sql = "UPDATE Account SET  role = ? WHERE username = ?";

     
        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setString(1, role);
        stm.setString(2, username);
       

        stm.executeUpdate();

      
    } catch (SQLException ex) {
        Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
    } 
    
    }
    
    
    
}
