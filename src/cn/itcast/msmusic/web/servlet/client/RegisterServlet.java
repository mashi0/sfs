package cn.itcast.msmusic.web.servlet.client;

import cn.itcast.msmusic.domain.User;
import cn.itcast.msmusic.service.UserService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        User user = new User();
        try {
            BeanUtils.populate(user, request.getParameterMap());
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        UserService service = new UserService();
        try {
            service.register(user);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        // 注册成功，跳转到registersuccess.jsp
        response.sendRedirect(request.getContextPath()+"/client/registersuccess.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

}
