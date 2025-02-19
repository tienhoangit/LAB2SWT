/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package java.model;


public class Product {
    private int id;
    private String name;
    private String fid;
    private int sold;
    private float price;
    private String des;
    private String img;

    public Product() {
    }

    public Product(int id, String name, String fid,  int sold, float price, String des, String img) {
        this.id = id;
        this.name = name;
        this.fid = fid;
      
        this.sold = sold;
        this.price = price;
        this.des = des;
        this.img = img;
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

    public String getFid() {
        return fid;
    }

    public void setFid(String fid) {
        this.fid = fid;
    }

    

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    @Override
    public String toString() {
        return "Product{" +
               "id=" + id +
               ", name='" + name + '\'' +
               ", fid='" + fid + '\'' +
               ", sold=" + sold +
               ", price=" + price +
               ", des='" + des + '\'' +
               ", imageUrl='" + img + '\'' +
               '}';
    }
}
