package cn.itcast.msmusic.web.servlet.client;

import cn.itcast.msmusic.domain.Order;
import cn.itcast.msmusic.domain.User;
import cn.itcast.msmusic.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/findOrderByUser")
public class FindOrderByUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        User user = (User) request.getSession().getAttribute("user");
        OrderService service = new OrderService();
        List<Order> orders = service.findOrderByUser(user);
        System.out.println(orders);
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/client/orderlist.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

}
