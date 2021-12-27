package cn.itcast.msmusic.web.servlet.client;

import cn.itcast.msmusic.domain.User;
import cn.itcast.msmusic.service.UserService;

import javax.security.auth.login.LoginException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class loginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String checkcode = request.getParameter("checkcode");
//        System.out.println(checkcode);
        HttpSession session = request.getSession();

//        Object checkcode_session = session.getAttribute("checkcode_session");
        //System.out.println(checkcode_session);

        UserService service = new UserService();
        //System.out.println(checkcode_session.equals(checkcode));
        //if(checkcode_session.equals(checkcode)){
            //判断用户名和密码是否正确
            try{
                User user = service.login(username, password);
                //登录成功，将用户存储到session中
                session.setAttribute("user",user);
                //判断用户角色
                String role = user.getRole();
                if(role.equals("超级用户")){
                    response.sendRedirect(request.getContextPath()+"/admin/login/home.jsp");
                }else{
                    response.sendRedirect(request.getContextPath()+"/client/myAccount.jsp");
                }
            }catch (LoginException e) {
                // 如果出现问题，将错误信息存储到request范围，并跳转回登录页面显示错误信息
                e.printStackTrace();
                request.setAttribute("register_message", e.getMessage());
                request.getRequestDispatcher("/client/login.jsp").forward(request, response);
            }

        }
//        else{
//            //验证码不一致
//            //存储信息到request
//
//            request.setAttribute("cc","验证码错误");
//            request.getRequestDispatcher("/client/login.jsp").forward(request,response);
//
//        }
//    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

}
