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


public class TypeDao extends DBContext {
     Connection con;
    PreparedStatement st;
    ResultSet rs;

    public TypeDao() {
        con = connection;
    }
    
    public ArrayList<Type> getAllType(){
        String spl = "select*from Type";
        ArrayList<Type> list = new ArrayList<>();
        try {
            st = con.prepareStatement(spl);
            rs = st.executeQuery();
            while(rs.next()){
                Type t = new Type(rs.getInt(1), rs.getString(2),rs.getString(3));
                list.add(t);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
      public Type getTypebyID(int id){
        String spl = "select*from Type where id = ?";
       Type t = null;
        try {
            st = con.prepareStatement(spl);
            st.setInt(1, id);
            rs = st.executeQuery();
            while(rs.next()){
               t = new Type(rs.getInt(1), rs.getString(2),rs.getString(3));
                
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return t;
    }
      
}
