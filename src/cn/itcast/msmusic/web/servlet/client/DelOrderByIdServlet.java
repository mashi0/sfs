package cn.itcast.msmusic.web.servlet.client;

import cn.itcast.msmusic.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delOrderById")
public class DelOrderByIdServlet extends HttpServlet {
    private static final long serialVersionUID = -742965707205621644L;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        // 已支付的订单带有type值为client的参数
        String type = request.getParameter("type");
        OrderService service = new OrderService();
        if(type!=null && type.trim().length()>0 ){
            service.delOrderById(id);

        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

}
