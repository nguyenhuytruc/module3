package com.example.product_discount_calculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet (name = "DiscountServlet", value = "/display-discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String product_description = req.getParameter("product_description");
        float list_price = Float.parseFloat(req.getParameter("list_price"));
        float discount_percent = Float.parseFloat(req.getParameter("discount_percent"));

        float discount_amount = (float) (list_price * discount_percent * 0.01);

        PrintWriter writer = resp.getWriter();
        writer.println("<html>");
        writer.println("<h1>Product Description: " + product_description + "</h1>");
        writer.println("<h1>List Price: " + list_price + "</h1>");
        writer.println("<h1>Discount amount: " + discount_amount + "</h1>");
        writer.println("</html>");
    }
}
