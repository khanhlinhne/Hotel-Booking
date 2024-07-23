  
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import jakarta.servlet.http.HttpServlet;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Room;

/**
 *
 * @author doan7
 */
public class RoomDBContext extends DBContext {

    public List<Room> getRooms() {
        List<Room> rooms = new ArrayList<>();
        try {
            String sql = "select * from Room";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Room r = new Room();
                r.setId(rs.getInt("id"));
                r.setName(rs.getString("name"));
                r.setImage(rs.getString("image"));
                r.setUserQuantity(rs.getInt("userQuantity"));
                r.setArea(rs.getFloat("area"));
                r.setQuantity(1);
                r.setPrice(rs.getFloat("price"));
                r.setIsActive(rs.getBoolean("isActive"));
                r.setDescription(rs.getString("description"));
                r.setHotelId(rs.getInt("hotel_id"));
                r.setTypeId(rs.getInt("type_id"));
                rooms.add(r);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rooms;
    }

    public List<Room> getRoomsByHotelId(int hotelId) {
        List<Room> rooms = new ArrayList<>();
        try {
            String sql = "select * from Room where hotel_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, hotelId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Room r = new Room();
                r.setId(rs.getInt("id"));
                r.setName(rs.getString("name"));
                r.setImage(rs.getString("image"));
                r.setUserQuantity(rs.getInt("userQuantity"));
                r.setArea(rs.getFloat("area"));
                r.setQuantity(1);
                r.setPrice(rs.getFloat("price"));
                r.setIsActive(rs.getBoolean("isActive"));
                r.setDescription(rs.getString("description"));
                r.setHotelId(rs.getInt("hotel_id"));
                r.setTypeId(rs.getInt("type_id"));
                rooms.add(r);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rooms;
    }

    public Room addRoom(Room room) {
        try {
            // Prepare an SQL insert statement
            String sql = "INSERT INTO Room (name, image, userQuantity, area, quantity, price, isActive, description, hotel_id, type_id) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            // Set the values for the insert statement
            stm.setString(1, room.getName());
            stm.setString(2, room.getImage());
            stm.setInt(3, room.getUserQuantity());
            stm.setFloat(4, room.getArea());
            stm.setInt(5, room.getQuantity());
            stm.setFloat(6, room.getPrice());
            stm.setBoolean(7, room.isIsActive());
            stm.setString(8, room.getDescription());
            stm.setInt(9, room.getHotelId());
            stm.setInt(10, room.getTypeId());

            // Execute the insert statement
            int rowsInserted = stm.executeUpdate();

            if (rowsInserted > 0) {
                // Retrieve the auto-generated ID of the newly added room
                ResultSet generatedKeys = stm.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int roomId = generatedKeys.getInt(1);
                    room.setId(roomId);
                } else {
                    // Handle the case where the ID was not generated
                    // You might throw an exception or log an error
                }
            } else {
                // Handle the case where the insert failed
                // You might throw an exception or log an error
            }
        } catch (SQLException ex) {
            // Handle the exception, e.g., log the error or throw a custom exception
            ex.printStackTrace();
            return null; // Return null if the insertion failed
        }

        return room; // Return the Room object with the assigned ID
    }

    public List<Room> getRoomsAvailability(Date checkInDate, Date checkOutDate, int numOfPeople, int type) {
        List<Room> rooms = new ArrayList<>();
        try {
            String sql = "select id , [name],image,userQuantity,area,price,isActive,description,hotel_id,type_id from Room where id NOT IN (select r.id  from Room r inner join Booking b on r.id = b.room_id  \n"
                    + "    WHERE (b.startDate <= ? AND b.endDate >= ?)) AND userQuantity = ? AND type_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, checkInDate);
            stm.setDate(2, checkOutDate);
            stm.setInt(3, numOfPeople);
            stm.setInt(4, type);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Room r = new Room();
                r.setId(rs.getInt("id"));
                r.setName(rs.getString("name"));
                r.setImage(rs.getString("image"));
                r.setUserQuantity(rs.getInt("userQuantity"));
                r.setArea(rs.getFloat("area"));
                r.setQuantity(1);
                r.setPrice(rs.getFloat("price"));
                r.setIsActive(rs.getBoolean("isActive"));
                r.setDescription(rs.getString("description"));
                r.setHotelId(rs.getInt("hotel_id"));
                r.setTypeId(rs.getInt("type_id"));
                rooms.add(r);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rooms;
    }

    public void deleteRoom(int hotelid, int roomid) {
        try {
            String sql = "delete from Room  where hotel_id = " + hotelid + " and id =" + roomid + "";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        System.out.println(new RoomDBContext().getRoomsAvailability(Date.valueOf("2023-10-04"), Date.valueOf("2023-09-29"), 4, 2));
    }

    public List<Room> getOtherRooms() {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Room> otherRooms = new ArrayList<>();

        try {
            connection = getConnection();
            String query = "SELECT * FROM rooms";
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Room room = new Room();
                room.setId(resultSet.getInt("id"));
                room.setName(resultSet.getString("name"));
                room.setPrice(resultSet.getFloat("price"));
                // Đọc thêm các thuộc tính khác của phòng
                // room.setImage(resultSet.getString("image"));
                // room.setDescription(resultSet.getString("description"));
                // ...
                otherRooms.add(room);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đóng kết nối và tài nguyên
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return otherRooms;
    }

    private Connection getConnection() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
