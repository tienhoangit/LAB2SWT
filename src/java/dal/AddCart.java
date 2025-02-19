/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package java.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.model.*;


public class AddCart extends DBContext {

    Connection con;
    PreparedStatement st;
    ResultSet rs;

    public AddCart() {
        con = connection;
    }

    public void AddCartbyCid(int c) {
        String sql = "insert into Cart (uid) values(?)";
        try {
            st = con.prepareStatement(sql);
            st.setInt(1, c);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void AddCartDetail(CartDetail c) {
        String sql = "insert into CartDetail (cid,pid, quantity) values(?,?,?)";
        try {
            st = con.prepareStatement(sql);
            st.setInt(1, c.getCid());
            st.setInt(2, c.getPid());
            st.setInt(3, c.getQuantity());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteCartDetail(int pid) {
        String sql = "delete CartDetail  where pid =? ";
        try {
            st = con.prepareStatement(sql);
            st.setInt(1, pid);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public void deleteCartbyuid(int uid) {
        String sql = "delete Cart  where uid =?";
        try {
            st = con.prepareStatement(sql);
            st.setInt(1, uid);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteCartDetailbycid(int cid) {
        String sql = "delete CartDetail  where cid =?";
        try {
            st = con.prepareStatement(sql);
            st.setInt(1, cid);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void deleteCartDetailByCidAndPid(int cid,int pid) {
        String sql = "DELETE FROM dbo.CartDetail WHERE cid = ? AND pid = ?";
        try {
            st = con.prepareStatement(sql);
            st.setInt(1, cid);
            st.setInt(2, pid);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public ArrayList<ProductCart> getPC(int cid) {
        String sql = "Select p.id, p.name, p.img, d.quantity, p.price, (p.price*d.quantity) as total from CartDetail d join Product p on d.pid = p.id where d.cid =?";
        ArrayList<ProductCart> list = new ArrayList<>();
        try {
            st = con.prepareStatement(sql);
            st.setInt(1, cid);
            rs = st.executeQuery();
            while (rs.next()) {
                ProductCart p = new ProductCart(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getFloat(5), rs.getFloat(6));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<CartDetail> getCartDetail(int cid) {
        String sql = "select*from CartDetail where cid = ?";
        ArrayList<CartDetail> list = new ArrayList<>();
        try {
            st = con.prepareStatement(sql);
            st.setInt(1, cid);
            rs = st.executeQuery();
            while (rs.next()) {
                CartDetail c = new CartDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3));
                list.add(c);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Cart getCartById(int uid) {
        String sql = "select* from cart where uid = ?";
        Cart c = new Cart();
        try {
            st = con.prepareStatement(sql);
            st.setInt(1, uid);
            rs = st.executeQuery();
            if (rs.next()) {
                 c = new Cart(rs.getInt(1), rs.getInt(2));
                return c;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return c;
    }
    
    public int getuId(String phoneNum) {
        String sql = "SELECT * FROM dbo.Customer WHERE phone = ?";
        try {
            st = con.prepareStatement(sql);
            st.setString(1, phoneNum);
            rs = st.executeQuery();
            if (rs.next()) {
                int c = rs.getInt(1);
                return c;
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }

    public static void main(String[] args) {
        AddCart dao = new AddCart();
        Cart c = dao.getCartById(14);

        ArrayList<ProductCart> list = dao.getPC(c.getCid());
        System.out.println(list.get(0).getName());
    }

    public void updateCartDetail(int quantity, int pid) {
        String sql = "update CartDetail set quantity = ?  where pid = ?";
        try {
            st = con.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setInt(2, pid);
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    
public boolean isCartExistByUid(int uid) {
    String sql = "SELECT COUNT(*) FROM Cart WHERE uid = ?";
    try {
        st = con.prepareStatement(sql);
        st.setInt(1, uid);
        rs = st.executeQuery();
        if (rs.next()) {
            int count = rs.getInt(1);  // Lấy số lượng giỏ hàng với uid tương ứng
            return count > 0;  // Trả về true nếu có ít nhất 1 giỏ hàng
        }
    } catch (Exception e) {
        System.out.println(e);
    }
    return false;  // Trả về false nếu không có giỏ hàng
}
public Integer getCustomerIdByCidAndPid(int cid, int pid) {
    String sql = "SELECT c.uid " +
                 "FROM Cart c " +
                 "JOIN CartDetail d ON c.id = d.cid " +
                 "WHERE d.cid = ? AND d.pid = ?";
    try {
        st = con.prepareStatement(sql);
        st.setInt(1, cid);
        st.setInt(2, pid);
        rs = st.executeQuery();
        if (rs.next()) {
            return rs.getInt("uid");  // Trả về uid (ID của khách hàng)
        }
    } catch (Exception e) {
        System.out.println(e);
    }
    return null;  // Trả về null nếu không tìm thấy
}
}
