/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package java.dal;

import java.sql.*;
import java.util.ArrayList;
import java.model.*;
import java.sql.Connection;
import java.util.List;

public class ProductDao extends DBContext {

    Connection con;
    PreparedStatement st;
    ResultSet rs;

    public ProductDao() {
        con = connection;
    }

    public ArrayList<Product> getAllSortedByPrice(boolean ascending) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT p.id, p.[name], t.[name], p.sold, p.price, p.[des], p.img "
                + "FROM Product p JOIN [TYPE] t ON t.id = p.fType "
                + "ORDER BY p.price " + (ascending ? "ASC" : "DESC");
        try {
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getInt(4), rs.getFloat(5), rs.getString(6), rs.getString(7));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Product> getAllSortedByName(boolean ascending) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT p.id, p.[name], t.[name], p.sold, p.price, p.[des], p.img "
                + "FROM Product p JOIN [TYPE] t ON t.id = p.fType "
                + "ORDER BY p.[name] " + (ascending ? "ASC" : "DESC");
        try {
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getInt(4), rs.getFloat(5), rs.getString(6), rs.getString(7));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> pagingProduct(int index) {
        List<Product> listP = new ArrayList<>();
        String sql = "SELECT * FROM dbo.Product ORDER BY id OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
        try {
            st = con.prepareStatement(sql);
            st.setInt(1, (index - 1) * 12);
            rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getFloat(5), rs.getString(6), rs.getString(7));
                listP.add(p);

            }
        } catch (Exception e) {
        }
        return listP;
    }

    public static void main(String[] args) {
        ProductDao pd = new ProductDao();
        List<Product> listP = pd.pagingProduct(1);
        for (Product product : listP) {
            System.out.println(product);
        }

    }

    public int getTotalProduct() {
        String sql = "SELECT COUNT(*) FROM dbo.Product";
        try {
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public ArrayList<Product> getAll() {
        String sql = "select p.id, p.[name], t.[name], p.sold, p.price, p.[des], p.img  from Product p join [TYPE] T ON t.id=p.fType";
        ArrayList<Product> list = new ArrayList<>();
        try {
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getFloat(5), rs.getString(6), rs.getString(7));
                list.add(p);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }

    public ArrayList<Product> getAllbyType(int id) {
        String sql = "select p.id, p.[name], t.[name], p.sold, p.price, p.[des], p.img  from Product p join [TYPE] T ON t.id=p.fType where p.ftype =?";
        ArrayList<Product> list = new ArrayList<>();
        try {
            st = con.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getFloat(5), rs.getString(6), rs.getString(7));
                list.add(p);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }

    public ArrayList<Product> SearchProduct(String name) {
        String sql = "SELECT p.id, p.[name], t.[name], p.sold, p.price, p.[des], p.img "
                + "FROM Product p JOIN [TYPE] T ON t.id = p.fType "
                + "WHERE p.[name] LIKE ?";
        ArrayList<Product> list = new ArrayList<>();
        try {
            st = con.prepareStatement(sql);
            st.setString(1, "%" + name + "%"); // Sử dụng wildcard để tìm kiếm
            rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getFloat(5), rs.getString(6), rs.getString(7));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductById(int id) {
        String sql = "select*from Product where id =?";
        Product p = null;
        try {
            st = con.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            if (rs.next()) {
                p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getFloat(5), rs.getString(6), rs.getString(7));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return p;

    }

    public void deleteProduct(int id) {
        String sql = "delete from Product where id = ?";
        try {
            st = con.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void addProduct(Product p) {
        String sql = "insert into Product ([name], fType, sold,price,[des],img) values(?,?,?,?,?,?)";
        try {
            st = con.prepareStatement(sql);
            st.setString(1, p.getName());
            st.setInt(2, Integer.parseInt(p.getFid()));

            st.setInt(3, p.getSold());
            st.setFloat(4, p.getPrice());
            st.setString(5, p.getDes());
            st.setString(6, p.getImg());
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateProduct(Product p) {
        String sql = "update Product set [name] =?, fType = ?,sold = ?, price=?, [des] = ?, img =? where id = ?";
        try {
            st = con.prepareStatement(sql);
            st.setString(1, p.getName());
            st.setInt(2, Integer.parseInt(p.getFid()));
            st.setInt(3, p.getSold());
            st.setFloat(4, p.getPrice());
            st.setString(5, p.getDes());
            st.setString(6, p.getImg());
            st.setInt(7, p.getId());
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public ArrayList<Product> getProductsByBrands(String[] brands) {
        ArrayList<Product> list = new ArrayList<>();

        // Kiểm tra nếu mảng brands trống hoặc null
        if (brands == null || brands.length == 0) {
            return list; // Trả về danh sách rỗng nếu không có nhãn hiệu nào được chọn
        }

        StringBuilder sql = new StringBuilder("SELECT p.id, p.[name], t.[name], p.sold, p.price, p.[des], p.img "
                + "FROM Product p JOIN [TYPE] t ON t.id = p.fType "
                + "WHERE t.[name] IN (");

        // Xây dựng câu truy vấn cho các nhãn hiệu
        for (int i = 0; i < brands.length; i++) {
            sql.append("?");
            if (i < brands.length - 1) {
                sql.append(", ");
            }
        }
        sql.append(")");

        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            st = con.prepareStatement(sql.toString());
            for (int i = 0; i < brands.length; i++) {
                st.setString(i + 1, brands[i]);
            }

            rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getInt(4), rs.getFloat(5), rs.getString(6), rs.getString(7));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            // Đảm bảo đóng ResultSet và PreparedStatement
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
            } catch (Exception e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }

        return list;
    }

//    public ArrayList getFood() {
//        String sql = "select f.fid, f.fname, t.tname, f.sold,  f.instock, f.price, f.[desc], f.[image] from food f join foodType t on f.ftype = t.tid";
//        ArrayList<ListFood> list = new ArrayList<ListFood>();
//        try {
//            st = con.prepareStatement(sql);
//            rs = st.executeQuery();
//            while (rs.next()) {
//                ListFood f = new ListFood(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getDouble(6), rs.getString(7), rs.getString(8));
//                list.add(f);
//            }
//
//        } catch (SQLException e) {
//            System.out.println("");
//        }
//        return list;
//
//    }
//
//    public ArrayList getFoodById(int id) {
//        String sql = "select f.fid, f.fname, t.tname, f.sold,  f.instock, f.price, f.[desc], f.[image] from food f join foodType t on f.ftype = t.tid where t.tid = ?";
//        ArrayList<ListFood> list = new ArrayList<ListFood>();
//        try {
//            st = con.prepareStatement(sql);
//            st.setInt(1,id);
//            rs = st.executeQuery();
//            while (rs.next()) {
//                ListFood f = new ListFood(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getDouble(6), rs.getString(7), rs.getString(8));
//                list.add(f);
//            }
//
//        } catch (SQLException e) {
//            System.out.println("");
//        }
//        return list;
//
//    }
//    
//    public Food food(int id) {
//        String sql = "select f.fid, f.fname,f.ftype, f.sold,  f.instock, f.price, f.[desc], f.[image] from food f where f.fid = ?";
//        
//        try {
//            st = con.prepareStatement(sql);
//            st.setInt(1,id);
//            rs = st.executeQuery();
//            if (rs.next()) {
//                Food f = new Food(rs.getInt(1), rs.getString(2), rs.getInt(3),rs.getInt(4), rs.getInt(5), rs.getDouble(6), rs.getString(7), rs.getString(8));
//               return f;
//            }
//
//        } catch (SQLException e) {
//            System.out.println("");
//        }
//        return null;
//
//    }
//    
//    
//    public ArrayList<ListFood> SertFood(String name){
//        String sql = "select f.fid, f.fname, t.tname, f.sold,  f.instock, f.price, f.[desc], f.[image] from food f join foodType t on f.ftype = t.tid where f.fname LIKE '%"+name+"%'";
//        ArrayList<ListFood> list = new ArrayList<>();
//        try{
//            st = con.prepareStatement(sql);
//           
//            rs = st.executeQuery();
//            while(rs.next()){
//                ListFood u = new ListFood(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getInt(5),rs.getDouble(6),rs.getString(7),rs.getString(8));
//                list.add(u);
//            }
//            
//        }catch (SQLException e) {
//            System.out.println("");
//        }
//        return list;
//    }
//
//    public void AddFood(Food f) {
//        String sql = "Insert into food (fname, ftype,sold,instock,price,[desc],[image]) Values(?,?,?,?,?,?,?)";
//        try {
//            st = con.prepareStatement(sql);
//            st.setString(1, f.getName());
//            st.setInt(2, f.getType());
//            st.setInt(3, 0);
//            st.setInt(4, f.getInstock());
//            st.setDouble(5, f.getPrice());
//            st.setString(6, f.getDesc());
//            st.setString(7, f.getImg());
//            st.executeUpdate();
//
//        } catch (SQLException e) {
//            System.out.println("");
//
//        }
//    }
//
//    public ArrayList getType() {
//        String sql = "Select*from foodType ";
//        ArrayList<Type> list = new ArrayList<>();
//        try {
//            st = con.prepareStatement(sql);
//            rs = st.executeQuery();
//            while (rs.next()) {
//                Type t = new Type(rs.getInt(1), rs.getString(2));
//                list.add(t);
//            }
//        } catch (SQLException e) {
//            System.out.println("");
//        }
//        return list;
//    }
//
//    public void delete(int id) {
//        String sql = "delete from food where fid = ?";
//        try {
//            st = con.prepareStatement(sql);
//            st.setInt(1, id);
//            st.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println(e);
//
//        }
//    }
//
//    public void Update(ListFood u) {
//        String sql = "update food set fname =?,[desc] =?, instock = ?,price =?, sold =?, [image] = ? where fid=?";
//        try {
//            st = con.prepareStatement(sql);
//            st.setString(1, u.getName());
//            st.setString(2, u.getDesc());
//            st.setInt(3, u.getTock());
//            st.setDouble(4, u.getPrice());
//            st.setInt(5, u.getSold());
//            st.setString(6, u.getImg());
//            st.setInt(7, u.getId());
//            st.executeUpdate();
//
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//    }
////    
//
//    public ListFood getUser(int id) {
//        String sql = "select f.fid, f.fname, t.tname, f.sold, f.instock, f.price, f.[desc], f.[image] from food f join foodType t on f.ftype = t.tid where f.fid = ?";
//        ListFood u = null;
//        try {
//            st = con.prepareStatement(sql);
//            st.setInt(1, id);
//            rs = st.executeQuery();
//            if (rs.next()) {
//                u = new ListFood(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getDouble(6), rs.getString(7), rs.getString(8));
//            }
//
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return u;
//    }
}
