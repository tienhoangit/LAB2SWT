/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package java.dal;

import java.Util.Security;
import java.sql.*;
import java.util.ArrayList;
import java.model.*;
import java.sql.Connection;

public class CustomerDao extends DBContext {

    Connection con;
    PreparedStatement st;
    ResultSet rs;

    public CustomerDao() {
        con = connection;
    }

    public ArrayList<Customer> getCustomer() {
        String sql = "Select c.id, c.name, c.email,c.phone , c.pass,[role]  from customer c";
        ArrayList<Customer> list = new ArrayList<>();
        try {
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setEmail(rs.getString(3));
                c.setPhone(rs.getString(4));
                c.setPass(rs.getString(5));
                c.setRole(rs.getInt(6));

                list.add(c);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Customer> getUser() {
        String sql = "Select c.id, c.name, c.email,c.phone , c.pass,[role]  from customer c where role =0 ";
        ArrayList<Customer> list = new ArrayList<>();
        try {
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setEmail(rs.getString(3));
                c.setPhone(rs.getString(4));
                c.setPass(rs.getString(5));
                c.setRole(rs.getInt(6));

                list.add(c);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void addCustomeruser(Customer c) {
        Security s = new Security();
        String sql = "insert into Customer (name,email,phone,pass, [role]) values(?,?,?,?,?)";
        try {
            st = con.prepareStatement(sql);
            st.setString(1, c.getName());
            st.setString(2, c.getEmail());
            st.setString(3, c.getPhone());
            st.setString(4, s.encode(c.getPass()));
            st.setInt(5, 0);

            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public void addCustomeradmin(Customer c) {
        Security s = new Security();
        String sql = "insert into Customer (name,email,phone,pass, [role]) values(?,?,?,?,?)";
        try {
            st = con.prepareStatement(sql);
            st.setString(1, c.getName());
            st.setString(2, c.getEmail());
            st.setString(3, c.getPhone());
            st.setString(4, s.encode(c.getPass()));
                        st.setInt(5, 1);


            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public Customer getCustomerByid(int id) {
        String sql = "select* from Customer where  id = ?";
        try {
            st = con.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            while (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setEmail(rs.getString(3));
                c.setPhone(rs.getString(4));
                c.setPass(rs.getString(5));
                c.setRole(rs.getInt(6));
                return c;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<Customer> SearchCustomer(String name) {
        String sql = "select *  from Customer c where c.[name] LIKE '%" + name + "%'";
        ArrayList<Customer> list = new ArrayList<>();
        try {
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Customer c = new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6));
                list.add(c);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }

    public void deleteCustomer(int id) {
        String sql = "delete from Customer where id = ?";
        try {
            st = con.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateCustomer(Customer p) {
        Security s = new Security();
        String sql = "update Customer set [name] =?, email = ?,  phone =?,pass = ?,[role]=? where id = ?";
        try {
            st = con.prepareStatement(sql);
            st.setString(1, p.getName());
            st.setString(2, p.getEmail());
            st.setString(3, p.getPhone());
            st.setString(4, s.encode(p.getPass()));
            st.setInt(5, p.getRole());
            st.setInt(6, p.getId());
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateCustomerByEmaill(String email, String pass) {
        Security s = new Security();
        String sql = "update Customer set pass = ? where email = ?";
        try {
            st = con.prepareStatement(sql);
            st.setString(1, s.encode(pass));
            st.setString(2, email);

            st.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        CustomerDao dao = new CustomerDao();
        ArrayList<Customer> list = dao.getCustomer();
        System.out.println(list.get(0).getName());
    }
}
