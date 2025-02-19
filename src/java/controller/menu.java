/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDao;
import dal.TypeDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.Type;

public class menu extends HttpServlet {

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
            out.println("<title>Servlet menu</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet menu at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Khởi tạo DAO
    ProductDao dao = new ProductDao();
    TypeDao daot = new TypeDao();

    ArrayList<Type> t = daot.getAllType();

    String indexPage = request.getParameter("index");
    int index = (indexPage == null) ? 1 : Integer.parseInt(indexPage);

    // Lấy các tham số sort, query và brand từ request
    String sort = request.getParameter("sort");
    String query = request.getParameter("query");
    String[] brands = request.getParameterValues("brand");
    if (brands == null) {
        brands = new String[0];  // Khởi tạo mảng rỗng nếu không có nhãn hiệu nào được chọn
    }
    
    // Lưu các nhãn hiệu đã chọn vào request
    List<String> selectedBrands = (brands != null) ? List.of(brands) : new ArrayList<>();
    request.setAttribute("selectedBrands", selectedBrands); // Lưu vào request

    // Lấy danh sách sản phẩm dựa trên các nhãn hiệu đã chọn
    List<Product> list;
    if (query != null && !query.trim().isEmpty()) {
        list = dao.SearchProduct(query);
    } else if (brands != null && brands.length > 0) {
        // Nếu có các nhãn hiệu được chọn, tìm sản phẩm của các nhãn hiệu đã chọn
        list = dao.getProductsByBrands(brands);
    } else {
        // Nếu không có nhãn hiệu nào được chọn, lấy tất cả sản phẩm
        list = dao.getAll();
    }

    // Sắp xếp danh sách sản phẩm nếu có yêu cầu sort
    if (sort != null && !sort.isEmpty()) {
        switch (sort) {
            case "price-asc":
                list.sort((p1, p2) -> Float.compare(p1.getPrice(), p2.getPrice()));
                break;
            case "price-desc":
                list.sort((p1, p2) -> Float.compare(p2.getPrice(), p1.getPrice()));
                break;
            case "name-asc":
                list.sort((p1, p2) -> p1.getName().compareToIgnoreCase(p2.getName()));
                break;
            case "name-desc":
                list.sort((p1, p2) -> p2.getName().compareToIgnoreCase(p1.getName()));
                break;
        }
    }

    // Tính toán số trang
    int count = list.size();
    int endPage = (count % 12 == 0) ? count / 12 : (count / 12) + 1;

    // Phân trang
    int start = Math.max(0, (index - 1) * 12);  // Đảm bảo chỉ số start không nhỏ hơn 0
    int end = Math.min(start + 12, count);  // Đảm bảo chỉ số end không vượt quá kích thước danh sách

    // Kiểm tra nếu start lớn hơn hoặc bằng count để tránh lỗi subList
    List<Product> paginatedList = (start < count) ? list.subList(start, end) : new ArrayList<>();

    // Lưu các thông tin vào session hoặc request để hiển thị trên JSP
    HttpSession session = request.getSession();
    session.setAttribute("t", t);  // Lưu danh sách loại sản phẩm
    request.setAttribute("list", paginatedList); // Lưu danh sách sản phẩm hiện tại
    request.setAttribute("endPage", endPage);
    request.setAttribute("sort", sort);
    request.setAttribute("query", query);
    request.setAttribute("selectedBrands", selectedBrands);  // Lưu các nhãn hiệu đã chọn để giữ trạng thái của checkbox

    // Lưu lại các nhãn hiệu đã chọn vào một chuỗi để sử dụng trong liên kết phân trang
    StringBuilder brandParams = new StringBuilder();
    for (String brand : brands) {
        brandParams.append("&brand=").append(URLEncoder.encode(brand, "UTF-8"));
    }
    request.setAttribute("brandParams", brandParams.toString());

    // Forward đến trang hiển thị
    request.getRequestDispatcher("view/user/menu.jsp").forward(request, response);
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
        processRequest(request, response);
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
