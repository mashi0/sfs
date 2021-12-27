package cn.itcast.msmusic.web.servlet.manager;

import cn.itcast.msmusic.domain.Product;
import cn.itcast.msmusic.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/findProductByManyCondition")
public class FindProductByManyConditionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id"); // 商品id
        String name = request.getParameter("name"); // 商品名称
        String category = request.getParameter("category"); // 商品类别
        String minprice = request.getParameter("minprice"); // 最小价格
        String maxprice = request.getParameter("maxprice"); // 最大价格

        System.out.println(name);

        ProductService service = new ProductService();
        List<Product> ps = service.findProductByManyCondition(id,name,category,minprice,maxprice);
        request.setAttribute("ps", ps);
        request.getRequestDispatcher("/admin/products/list.jsp").forward(
                request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

}
