package cn.itcast.msmusic.web.servlet.client;

import cn.itcast.msmusic.domain.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

//变更购物车
@WebServlet("/changeCart")
public class changeCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        int count = Integer.parseInt(request.getParameter("count"));
        HttpSession session = request.getSession();
        Map<Product, Integer> cart = (Map<Product, Integer>)session.getAttribute("cart");
        Product p = new Product();
        p.setId(id);
        //如果数目为0，则将该商品从购物车删除
        if(count!=0){
            cart.put(p,count);
        }else{
            cart.remove(p);
        }
        response.sendRedirect(request.getContextPath()+"/client/cart.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

}
