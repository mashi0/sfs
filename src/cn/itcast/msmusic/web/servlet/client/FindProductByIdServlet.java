package cn.itcast.msmusic.web.servlet.client;

import cn.itcast.msmusic.domain.Product;
import cn.itcast.msmusic.exception.FindProductByIdException;
import cn.itcast.msmusic.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/findProductyId")
public class FindProductByIdServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        //type用于区别普通用户和超级用户
        String type = request.getParameter("type");
        ProductService service = new ProductService();
        try {
            Product p = service.findProductById(id);
            request.setAttribute("p",p);
            // 普通用户默认不传递type值，会跳转到info.jsp页面
            if(type==null){
                request.getRequestDispatcher("/client/info.jsp").forward(request,response);
                return;
            }
            request.getRequestDispatcher("/admin/products/edit.jsp").forward(request,response);
            return;
        } catch (FindProductByIdException e) {
            e.printStackTrace();
        }



    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

}
