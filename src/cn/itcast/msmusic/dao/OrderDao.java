package cn.itcast.msmusic.dao;

import cn.itcast.msmusic.domain.Order;
import cn.itcast.msmusic.domain.User;
import cn.itcast.msmusic.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {

    /**
     * 生成订单
     * @param order
     * @throws SQLException
     */
    public void addProduct(Order order) throws SQLException {
        String sql = "insert into orders values(?,?,?,?,?,0,null,?)";
        QueryRunner runner = new QueryRunner();
        runner.update(DataSourceUtils.getconnnection(),sql, order.getId(),
                order.getMoney(),order.getReceiverAddress(),order.getReceiverName(),
                order.getReceiverPhone(),order.getUser().getId());

    }

    /**
     * 根据用户查询订单
     * @param user
     * @return
     * @throws SQLException
     */
    public List<Order> findOrderByUser(final User user) throws SQLException {
        String sql = "select * from orders where user_id=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new ResultSetHandler<List<Order>>() {
            @Override
            public List<Order> handle(ResultSet resultSet) throws SQLException {
                List<Order> orders = new ArrayList<Order>();
                while (resultSet.next()){
                    Order order = new Order();
                    order.setId(resultSet.getString("id"));
                    order.setMoney(resultSet.getDouble("money"));
                    order.setOrdertime(resultSet.getDate("ordertime"));
                    order.setPaystate(resultSet.getInt("paystate"));
                    order.setReceiverAddress(resultSet.getString("receiverAddress"));
                    order.setReceiverName(resultSet.getString("receiverName"));
                    order.setReceiverPhone(resultSet.getString("receiverPhone"));
                    order.setUser(user);
                    orders.add(order);
                }
                return orders;
            }
        }, user.getId());
    }

    /**
     * 根据订单号查询订单
     * @param id
     * @return
     * @throws SQLException
     */
    public Order findOrderById(String id) throws SQLException {
        String sql = "select * from orders,user where orders.user_id=user.id and orders.id=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new ResultSetHandler<Order>() {
            @Override
            public Order handle(ResultSet resultSet) throws SQLException {
                Order order = new Order();
                while (resultSet.next()) {
                    order.setId(resultSet.getString("orders.id"));
                    order.setMoney(resultSet.getDouble("orders.money"));
                    order.setOrdertime(resultSet.getDate("orders.ordertime"));
                    order.setPaystate(resultSet.getInt("orders.paystate"));
                    order.setReceiverAddress(resultSet.getString("orders.receiverAddress"));
                    order.setReceiverName(resultSet.getString("orders.receiverName"));
                    order.setReceiverPhone(resultSet.getString("orders.receiverPhone"));

                    User user = new User();
                    user.setId(resultSet.getInt("user.id"));
                    user.setEmail(resultSet.getString("user.email"));
                    user.setPassword(resultSet.getString("user.password"));
                    user.setRegistTime(resultSet.getDate("user.registtime"));
                    user.setRole(resultSet.getString("user.role"));
                    user.setTelephone(resultSet.getString("user.telephone"));
                    user.setUsername(resultSet.getString("user.username"));
                    order.setUser(user);
                }
                return order;
            }
        }, id);
    }

    /**
     * 修改订单状态
     * @param id
     * @throws SQLException
     */
    public void updateOrderState(String id) throws SQLException {
        String sql = "update orders set paystate=1 where id=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        runner.update(sql, id);
    }

    /**
     * 根据id删除订单
     * @param id
     */
    public void delOrderById(String id) throws SQLException {
        String sql="delete from orders where id=?";
        QueryRunner runner = new QueryRunner();
        runner.update(DataSourceUtils.getconnnection(),sql,id);
    }

    /**
     * 查找所有订单
     * @return
     * @throws SQLException
     */
    public List<Order> findAllOrder() throws SQLException {
        String sql = "select orders.*,user.* from orders,user where user.id=orders.user_id order by orders.user_id";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new ResultSetHandler<List<Order>>() {
            @Override
            public List<Order> handle(ResultSet rs) throws SQLException {
                //创建订单集合
                List<Order> orders = new ArrayList<Order>();
                //循环遍历订单和用户信息
                while (rs.next()){
                    Order order = new Order();
                    order.setId(rs.getString("orders.id"));
                    order.setMoney(rs.getDouble("orders.money"));
                    order.setOrdertime(rs.getDate("orders.ordertime"));
                    order.setPaystate(rs.getInt("orders.paystate"));
                    order.setReceiverAddress(rs.getString("orders.receiverAddress"));
                    order.setReceiverName(rs.getString("orders.receiverName"));
                    order.setReceiverPhone(rs.getString("orders.receiverPhone"));
                    orders.add(order);

                    User user = new User();
                    user.setId(rs.getInt("user.id"));
                    user.setEmail(rs.getString("user.email"));
                    user.setPassword(rs.getString("user.password"));
                    user.setRegistTime(rs.getDate("user.registtime"));
                    user.setRole(rs.getString("user.role"));
                    user.setTelephone(rs.getString("user.telephone"));
                    user.setUsername(rs.getString("user.username"));
                    order.setUser(user);
                }
                return orders;
            }
        });
    }



}
