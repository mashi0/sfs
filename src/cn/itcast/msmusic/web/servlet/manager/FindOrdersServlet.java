package cn.itcast.msmusic.web.servlet.manager;

import cn.itcast.msmusic.domain.Order;
import cn.itcast.msmusic.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/findOrders")
public class FindOrdersServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        OrderService service = new OrderService();
        List<Order> orders = service.findAllOrder();
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/admin/orders/list.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

}
