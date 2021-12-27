package cn.itcast.msmusic.service;

import cn.itcast.msmusic.dao.UserDao;
import cn.itcast.msmusic.domain.User;

import javax.security.auth.login.LoginException;
import java.sql.SQLException;

public class UserService{
    private UserDao dao = new UserDao();
//    public void register(User user) throws RegisterException {
//        try {
//            //将用户信息添加到数据库
//            dao.addUser(user);
//            //发送激活邮件
//            String emailMsg = "感谢您注册Msmusic，点击"
//                    + "<a href='http://localhost:8080/Msmusic/activeUser?activeCode="
//                    + user.getActiveCode() + "'>&nbsp;激活&nbsp;</a>后使用。"
//                    + "<br />为保障您的账户安全，请在24小时内完成激活操作";
//            MailUtils.sendMail(user.getEmail(), emailMsg);
//        }catch (Exception e) {
//            e.printStackTrace();
//            throw new RegisterException("注冊失败");
//        }
//
//    }
    public void register(User user) throws SQLException {
        dao.addUser(user);
    }


    // 激活用户
//    public void activeUser(String activeCode) throws ActiveUserException {
//        try{
//            User user=dao.findUserByActiveCode(activeCode);
//            if(user==null){
//                throw new ActiveUserException("激活用户失败");
//            }
//            // 判断激活码是否过期 24小时内激活有效.
//            // 1.得到注册时间
//            Date registTime = user.getRegistTime();
//            // 2.判断是否超时
//            long time = System.currentTimeMillis() - registTime.getTime();
//            if (time / 1000 / 60 / 60 > 24){
//                throw new ActiveUserException("激活码过期");
//            }
//            //修改用户的state
//            dao.activeUser(activeCode);
//        }catch (SQLException e) {
//            e.printStackTrace();
//            throw new ActiveUserException("激活用户失败");
//        }
//    }

    public User login(String username, String password) throws LoginException {
        try{
            User user = dao.finduser_bynp(username, password);
            if(user!=null){
                return user;
            }
            throw new LoginException("用户名或密码错误");
        }catch (SQLException e) {
            e.printStackTrace();
            throw new LoginException("登录失败");
        }

    }

}
