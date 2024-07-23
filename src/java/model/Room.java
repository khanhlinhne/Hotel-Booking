/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author doan7
 */

public class Room {
    
    private int id;
    private String name;
    private String image;
    private int userQuantity;
    private float area;
    private int quantity;
    private float price;
    private boolean isActive;
    private String description;
    private int hotelId;
    private int typeId;

    public Room() {
    }

    public Room(int id, String name, String image, int userQuantity, float area, int quantity, float price, boolean isActive, String description, int hotelId, int typeId) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.userQuantity = userQuantity;
        this.area = area;
        this.quantity = quantity;
        this.price = price;
        this.isActive = isActive;
        this.description = description;
        this.hotelId = hotelId;
        this.typeId = typeId;
    }

   

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getUserQuantity() {
        return userQuantity;
    }

    public void setUserQuantity(int userQuantity) {
        this.userQuantity = userQuantity;
    }

   

    public float getArea() {
        return area;
    }

    public void setArea(float area) {
        this.area = area;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }
    
    
    
    
}
