/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ProductDAO;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "UpdateProduct", urlPatterns = {"/updateproduct"})
public class UpdateProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String product_id = request.getParameter("product_id");
        request.setAttribute("product_id", product_id); // Đặt product_id vào request attribute
        ProductDAO pd = new ProductDAO();
        try {
            Product p = pd.getProductById(product_id);
            request.setAttribute("product", p);
            request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Retrieve parameters from the request
        String product_id = request.getParameter("product_id");
        String product_name = request.getParameter("product_name");
        String product_picture = request.getParameter("product_picture");
        float price;
        String category_id = request.getParameter("category_id");

        try {
            // Convert price parameter to float
            price = Float.parseFloat(request.getParameter("price"));

            // Create a Product object with the updated information
            ProductDAO pd = new ProductDAO();
            Product pNew = new Product(product_id, product_name, product_picture, price, category_id);

            // Call the updateProduct method with the new Product object
            pd.updateProduct(pNew); // Update product
            response.sendRedirect("admin");
        } catch (Exception e) {
            System.out.println(e);
        }

        // Redirect back to the admin page after processing
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

