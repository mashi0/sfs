package cn.itcast.msmusic.dao;

import cn.itcast.msmusic.domain.Order;
import cn.itcast.msmusic.domain.OrderItem;
import cn.itcast.msmusic.domain.Product;
import cn.itcast.msmusic.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    //根据id查找商品
    public Product finProductById(String id) throws SQLException {
        String sql = "select * from products where id=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new BeanHandler<Product>(Product.class), id);
    }

    //获取总条数
    public int findAllCount(String category) throws SQLException {
        //String sql = "select count(*) from products";
        String sql = null;
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        if(!category.equals("全部商品")){
            //sql += " where category=?";
            sql = "select count(*) from products where category=? ";
            Long count = (Long)runner.query(sql, new ScalarHandler(), category);
            return count.intValue();
        }else{
            sql = "select count(*) from products";
            Long count = (Long)runner.query(sql, new ScalarHandler());
            return count.intValue();
        }
    }

    //获取当前页数据
    public List<Product> findByPage(int currentPage, int currentCount,
                                    String category) throws SQLException {
        String sql = null;
        Object[] obj = null;
        // 如果category不为null,代表是按分类查找
        if(!category.equals("全部商品")){
            sql = "select * from products where category=? limit ?,?";
            obj = new Object[]{category, (currentPage-1)*currentCount,
            currentCount,};
        }else{
            sql = "select * from products limit ?,?";
            obj = new Object[]{ (currentPage-1)*currentCount,
                    currentCount,};
        }
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql,new BeanListHandler<Product>(Product.class),obj);
    }

    //提交订单后，减少商品库存数量
    public void changeProductNum(Order order) throws SQLException {
        String sql = "update products set pnum=pnum-? where id=?";
        QueryRunner runner = new QueryRunner();
        List<OrderItem> items = order.getOrderItems();

        Object[][] params = new Object[items.size()][2];
        for (int i = 0; i < params.length; i++) {
            params[i][0] = items.get(i).getBuynum();
            params[i][1] = items.get(i).getP().getId();
        }

        runner.batch(DataSourceUtils.getconnnection(),sql,params);
    }

    //查找所有商品(管理员)
    public List<Product> listAll() throws SQLException {
        String sql = "select * from products";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new BeanListHandler<Product>(Product.class));
    }

    //多条件查询（管理员）
    public List<Product> findProductByManyCondition(String id, String name, String category, String minprice, String maxprice) throws SQLException {
        List<Object> list = new ArrayList<>();
        String sql = "select * from products where 1=1 ";

        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

        if (id != null && id.trim().length() > 0){
            sql += " and id=?";
            list.add(id);
        }

        if(name!=null && name.trim().length()>0){
            sql += " and name=?";
            list.add(name);
        }

        if (category != null && category.trim().length() > 0) {
            sql += " and category=?";
            list.add(category);
        }

        if (minprice != null && maxprice != null
                && minprice.trim().length() > 0 && maxprice.trim().length() > 0){
            sql += " and price between ? and ?";
            list.add(minprice);
            list.add(maxprice);
        }
        System.out.println(list);
        Object[] params = list.toArray();
        System.out.println(sql);
        return runner.query(sql, new BeanListHandler<Product>(Product.class),params );
    }

    //添加商品（管理员）
    public void addProduct(Product p) throws SQLException {
        String sql = "insert into products values(?,?,?,?,?,?,?)";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        runner.update(sql, p.getId(), p.getName(), p.getPrice(),
                p.getCategory(), p.getPnum(), p.getImgurl(), p.getDescription());
    }

    // 修改商品信息(admin)
    public void editProduct(Product p) throws SQLException {
        //1.创建集合并将商品信息添加到集合中
        List<Object> obj = new ArrayList<>();
        obj.add(p.getName());
        obj.add(p.getPrice());
        obj.add(p.getCategory());
        obj.add(p.getPnum()) ;
        obj.add(p.getDescription());
        String sql  = "update products " +
                "set  name=?,price=?,category=?,pnum=?,description=? ";
        if(p.getImgurl()!=null && p.getImgurl().trim().length()>0){
            sql += " ,imgurl=?";
            obj.add(p.getImgurl());
        }
        sql += " where id=?";
        obj.add(p.getId());

        System.out.println(sql);
        System.out.println(obj);

        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        runner.update(sql, obj.toArray());
    }

    //后台系统，根据id删除商品信息
    public void deleteProduct(String id) throws SQLException {
        String sql = "DELETE FROM products WHERE id = ?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        runner.update(sql, id);
    }

}
