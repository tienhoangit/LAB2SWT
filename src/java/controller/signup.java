/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package java.controller;

import java.dal.AddCart;
import java.dal.CustomerDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.model.Customer;

public class signup extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet signup</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet signup at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/user/signup.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CustomerDao dao = new CustomerDao();
        ArrayList<Customer> list = dao.getCustomer();

        // Lấy thông tin từ form
        String email = request.getParameter("email");
        String pass1 = request.getParameter("pass1");
        String pass2 = request.getParameter("pass2");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone"); // Lấy số điện thoại từ form

        // Kiểm tra nếu bất kỳ thông tin nào bị thiếu
        if (email.isEmpty() || pass1.isEmpty() || pass2.isEmpty() || name.isEmpty() || phone.isEmpty()) {
            request.setAttribute("err", "You must fill in all information!");
            request.getRequestDispatcher("view/user/signup.jsp").forward(request, response);

        } else {
            // Kiểm tra xem email đã tồn tại hay chưa
            for (Customer c : list) {
                if (c.getEmail().compareTo(email) == 0) {
                    String text = "Email already exists!";
                    request.setAttribute("err", text);
                    request.getRequestDispatcher("view/user/signup.jsp").forward(request, response);
                    return; // Thoát khỏi vòng lặp và tránh thêm tiếp khách hàng
                }

                if (c.getPhone() != null && c.getPhone().compareTo(phone) == 0) {
                    String text = "Phone number already exists!";
                    request.setAttribute("err", text);
                    request.getRequestDispatcher("view/user/signup.jsp").forward(request, response);
                    return; // Thoát khỏi vòng lặp và tránh thêm tiếp khách hàng
                }
            }

            // Kiểm tra nếu mật khẩu không khớp
            if (!pass1.equals(pass2)) {
                String text = "Passwords do not match";
                request.setAttribute("err", text);
                request.getRequestDispatcher("view/user/signup.jsp").forward(request, response);
                //Kiểm tra sđt hợp lệ ko
            } else if (!phone.matches("\\d{10}")) {
                String text = "Invalid Phone Number !";
                request.setAttribute("err", text);
                request.getRequestDispatcher("view/user/signup.jsp").forward(request, response);

            } else {
                // Tạo đối tượng khách hàng mới và thêm vào cơ sở dữ liệu
                AddCart cartDao = new AddCart();
                Customer newCustomer = new Customer( name, email, phone, pass2, 0); // Bao gồm cả số điện thoại
                dao.addCustomeruser(newCustomer);
                cartDao.AddCartbyCid(cartDao.getuId(newCustomer.getPhone()));
                

                // Chuyển đến trang đăng nhập
                request.getRequestDispatcher("view/user/login.jsp").forward(request, response);
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
