package cn.itcast.msmusic.web.servlet.client;

import cn.itcast.msmusic.domain.Order;
import cn.itcast.msmusic.domain.OrderItem;
import cn.itcast.msmusic.domain.Product;
import cn.itcast.msmusic.domain.User;
import cn.itcast.msmusic.service.OrderService;
import cn.itcast.msmusic.utils.IdUtils;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/creatOrder")
public class CreatOrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Map<Product,Integer> cart = (Map<Product,Integer>)session.getAttribute("cart");

        Order order = new Order();
        try {
            BeanUtils.populate(order, request.getParameterMap());
            System.out.println(order);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        order.setId(IdUtils.getUUID());
        order.setUser(user);
        for(Product p:cart.keySet()){
            OrderItem item = new OrderItem();
            item.setOrder(order);
            item.setBuynum(cart.get(p));
            item.setP(p);
            order.getOrderItems().add(item);
        }
        System.out.println(order);
        OrderService service = new OrderService();
        //调用service添加订单
        service.addOrder(order);
        //重定向到下单成功页面
        response.sendRedirect(request.getContextPath()+"/client/createOrderSuccess.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

}
