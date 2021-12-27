package cn.itcast.msmusic.dao;

import cn.itcast.msmusic.domain.User;
import cn.itcast.msmusic.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

public class UserDao {
    //用户表中添加记录
    public void addUser(User user) throws SQLException {
        System.out.println("hello");
        String sql = "insert into user(username,password,email,telephone) values(?,?,?,?)";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        int row = runner.update(sql, user.getUsername(), user.getPassword(), user.getEmail(),
                user.getTelephone());
        System.out.println(row);
        if(row==0){
            throw new RuntimeException();
        }
    }
//    // 根据激活码查找用户
//    public User findUserByActiveCode(String activeCode) throws SQLException {
//        String sql = "select * from user where activecode=?";
//        QueryRunner runner = new QueryRunner((DataSourceUtils.getDataSource()));
//        return runner.query(sql, new BeanHandler<User>(User.class),activeCode);
//    }
//    //激活用户，设置状态为1
//    public void activeUser(String activeCode) throws SQLException {
//        String sql = "update user where username=? and activecode=? ";
//        QueryRunner runner = new QueryRunner((DataSourceUtils.getDataSource()));
//        runner.update(sql, 1,activeCode);
//    }

    public User finduser_bynp(String username,String password) throws SQLException {
        String sql = "select * from user where username=? and password=?";
        QueryRunner runner = new QueryRunner((DataSourceUtils.getDataSource()));
        return runner.query(sql, new BeanHandler<User>(User.class), username, password);
    }

}
