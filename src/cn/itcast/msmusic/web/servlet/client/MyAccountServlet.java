package cn.itcast.msmusic.web.servlet.client;

import cn.itcast.msmusic.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/myAccount")
public class MyAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * 1.用户未登录，进入登录页面
     * 2.用户已登录
     *  a、超级用户，进入到后台系统
     *  b、普通用户，登录到我的账户
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        User user = (User)request.getSession().getAttribute("user");
        if(user ==null){
            response.sendRedirect(request.getContextPath()+"client/login.jsp");
            return;
        }
        if(user.getRole().equals("超级用户")){
            response.sendRedirect(request.getContextPath()+"/admin/login/home.jsp");
        }else{
            response.sendRedirect(request.getContextPath() + "/client/myAccount.jsp");
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

}
