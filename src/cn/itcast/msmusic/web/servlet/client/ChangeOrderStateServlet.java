package cn.itcast.msmusic.web.servlet.client;

import cn.itcast.msmusic.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/orderstate")
public class ChangeOrderStateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String orderid = request.getParameter("orderid");
//        String paySuccess = "恭喜您支付成功！";
//        System.out.println(paySuccess);
//        if(orderid==null){
//            System.out.println("payfail!!!!!!!!!!");
//        }
//        if(orderid!=null){
//            OrderService service = new OrderService();
//            System.out.println("paysuccesss!!!!!!!!!!");
//            service.updateState(orderid);
//            request.setAttribute("paySuccess", paySuccess);
//            request.getRequestDispatcher("/client/paysuccess.jsp").forward(request,response);
//        }
        request.setCharacterEncoding("utf-8");
        String orderid = request.getParameter("orderid");
        System.out.println(orderid);
        if(orderid!=null){
            OrderService service = new OrderService();
            System.out.println("paysuccesss!!!!!!!!!!");
            service.updateState(orderid);
            request.getRequestDispatcher("/client/paysuccess.jsp").forward(request,response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

}
