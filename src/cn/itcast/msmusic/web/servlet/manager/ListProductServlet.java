package cn.itcast.msmusic.web.servlet.manager;

import cn.itcast.msmusic.domain.Product;
import cn.itcast.msmusic.exception.ListProductException;
import cn.itcast.msmusic.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 查询所有的商品信息
 */
@WebServlet("/listProduct")
public class ListProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        ProductService service = new ProductService();
        try {
            List<Product> ps = service.listAll();
            request.setAttribute("ps", ps);
            request.getRequestDispatcher("/admin/products/list.jsp").forward(request, response);
        } catch (ListProductException e) {
            e.printStackTrace();
            response.getWriter().write(e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

}
