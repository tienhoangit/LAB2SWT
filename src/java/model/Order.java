package java.model;


public class Order {
    private int uid;
    private float total;
    private String address;
    private String date;

    public Order() {
    }

    public Order( int uid, float total, String address, String date) {
        this.uid = uid;
        this.total = total;
        this.address = address;
        this.date = date;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
    
    
}
