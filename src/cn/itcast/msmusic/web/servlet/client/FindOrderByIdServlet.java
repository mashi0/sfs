package cn.itcast.msmusic.web.servlet.client;

import cn.itcast.msmusic.domain.Order;
import cn.itcast.msmusic.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/findOrderById")
public class FindOrderByIdServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String type = request.getParameter("type");
        String id = request.getParameter("id");
        OrderService service = new OrderService();
        Order order = service.findOrderById(id);
        request.setAttribute("order",order);
        //管理员
        if(type!=null){
            request.getRequestDispatcher("/admin/orders/view.jsp").forward(request,response);
            return;
        }
        request.getRequestDispatcher("/client/orderInfo.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

}
