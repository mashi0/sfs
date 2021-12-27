package cn.itcast.msmusic.service;

import cn.itcast.msmusic.dao.OrderDao;
import cn.itcast.msmusic.dao.OrderItemDao;
import cn.itcast.msmusic.dao.ProductDao;
import cn.itcast.msmusic.domain.Order;
import cn.itcast.msmusic.domain.OrderItem;
import cn.itcast.msmusic.domain.User;
import cn.itcast.msmusic.utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class OrderService {
    private OrderDao odao = new OrderDao();
    private OrderItemDao oidao = new OrderItemDao();
    private ProductDao pdao = new ProductDao();
    //添加订单
    public void addOrder(Order order){
        try {
            //开启事务
            DataSourceUtils.startTransaction();
            //向orders表中添加数据
            odao.addProduct(order);
            //向orderitems表中添加数据
            oidao.addOrderItem(order);
            //修改products表数据（修改库存数量）
            pdao.changeProductNum(order);
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                //回滚事务
                DataSourceUtils.rollback();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }finally {
            //关闭，释放以及提交事务
            try {
                DataSourceUtils.releaseAndCloseConnection();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    // 根据用户查找订单
    public List<Order> findOrderByUser(User user){
        List<Order> orders = null;
        try {
            orders = odao.findOrderByUser(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    // 根据用户查找订单
    public Order findOrderById(String id){
        Order order = null;
        try {
            order = odao.findOrderById(id);
            List<OrderItem> items = oidao.findOrderItemByOrder(order);
            order.setOrderItems(items);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    //支付成功后修改订单状态
    public void updateState(String id){
        try {
            odao.updateOrderState(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //根据id删除订单 管理员删除订单
    public void delOrderById(String id){
        try {
            DataSourceUtils.startTransaction();
            oidao.delOrderItems(id);
            odao.delOrderById(id);
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                DataSourceUtils.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }finally {
            try {
                DataSourceUtils.releaseAndCloseConnection();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    // 查找所有订单
    public List<Order> findAllOrder(){
        List<Order> orders = null;
        try {
            orders = odao.findAllOrder();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }


}
