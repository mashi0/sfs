package cn.itcast.msmusic.dao;

import cn.itcast.msmusic.domain.Order;
import cn.itcast.msmusic.domain.OrderItem;
import cn.itcast.msmusic.domain.Product;
import cn.itcast.msmusic.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderItemDao {
    //添加订单项
    public void addOrderItem(Order order) throws SQLException {
        String sql = "insert into orderItem values(?,?,?)";
        QueryRunner runner = new QueryRunner();
        List<OrderItem> items = order.getOrderItems();

        Object[][] params = new Object[items.size()][3];
        for (int i = 0; i < params.length; i++) {
            params[i][0] = items.get(i).getOrder().getId();
            params[i][1] = items.get(i).getP().getId();
            params[i][2] = items.get(i).getBuynum();
        }

        runner.batch(DataSourceUtils.getconnnection(),sql,params);
    }

    // 根据订单查找订单项
    public List<OrderItem> findOrderItemByOrder(final  Order order) throws SQLException {
        String sql = "select * from orderItem,Products where products.id=orderItem.product_id and order_id=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new ResultSetHandler<List<OrderItem>>() {
            @Override
            public List<OrderItem> handle(ResultSet rs) throws SQLException {
                List<OrderItem> items = new ArrayList<OrderItem>();
                while(rs.next()){
                    OrderItem item = new OrderItem();
                    item.setOrder(order);
                    item.setBuynum(rs.getInt("buynum"));

                    Product p = new Product();
                    p.setCategory(rs.getString("id"));
                    p.setDescription(rs.getString("description"));
                    p.setImgurl(rs.getString("imgurl"));
                    p.setName(rs.getString("name"));
                    p.setPnum(rs.getInt("pnum"));
                    p.setPrice(rs.getDouble("price"));

                    item.setP(p);

                    items.add(item);
                }
                return items;
            }
        },order.getId());
    }

    //根据订单id删除订单项
    public void delOrderItems(String id) throws SQLException {
        String sql="delete from orderItem where order_id=?";
        QueryRunner runner = new QueryRunner();
        runner.update(DataSourceUtils.getconnnection(),sql,id);
    }



}
