package cn.itcast.msmusic.web.servlet.client;

import cn.itcast.msmusic.domain.Product;
import cn.itcast.msmusic.exception.FindProductByIdException;
import cn.itcast.msmusic.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@WebServlet("/addCart")
public class AddCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //获得商品id
        String id = request.getParameter("id");
        //调用Porductservice层方法，根据id查找商品
        ProductService service = new ProductService();
        try {
            Product p = service.findProductById(id);
            //将商品加到购物车
            HttpSession session = request.getSession();
            //--从session中获取购物车对象
            Map<Product, Integer> cart = (Map<Product, Integer>)session.getAttribute("cart");
            //--如果购物车为null,说明没有商品存储在购物车中，创建出购物车
            if(cart==null){
                System.out.println("cart is null.....................");
                cart = new HashMap<Product, Integer>();
            }
            Set<Product> set = cart.keySet();
            if(set.isEmpty()){
                System.out.println("购物车中没有商品..........");
            }
            for(Product p0 : set) {
                System.out.println(cart + " " + cart.get(p0));
            }
            //--购物车中添加商品
            if(cart.containsKey(p)){
                cart.put(p, cart.get(p)+1);
            }else{
                cart.put(p,1);
            }

            session.setAttribute("cart", cart);
            response.sendRedirect(request.getContextPath()+"/client/cart.jsp");

        } catch (FindProductByIdException e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

}
