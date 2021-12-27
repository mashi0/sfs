package cn.itcast.msmusic.service;

import cn.itcast.msmusic.dao.ProductDao;
import cn.itcast.msmusic.domain.PageBean;
import cn.itcast.msmusic.domain.Product;
import cn.itcast.msmusic.exception.AddProductException;
import cn.itcast.msmusic.exception.FindProductByIdException;
import cn.itcast.msmusic.exception.ListProductException;

import java.sql.SQLException;
import java.util.List;

public class ProductService {
    private ProductDao dao = new ProductDao();

    //根据id查找商品
    public Product findProductById(String id) throws FindProductByIdException {
        //调用dao层
        try {
            return dao.finProductById(id);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new FindProductByIdException("根据ID查找商品失败");
        }
    }

    //下载销售榜单
//    public List<Object[]> download(String year, String month){
//        List<Object[]> salesList = null;
//
//    }


    /**
     *
     * @param currentPage 当前页码
     * @param currentCount 每页条数
     * @param category 类别
     * @return 当前页数据
     */
    //
    public PageBean findProductByPage(int currentPage, int currentCount,
                                     String category){
        PageBean bean = new PageBean();
        //每页显示数据条数
        bean.setCurrentCount(currentCount);
        //当前页码
        bean.setCurrentPage(currentPage);
        //当前查找类别
        bean.setCategory(category);
        try {
            //获取总条数
            int totalCount = dao.findAllCount(category);
            bean.setTotalCount(totalCount);
            //获取总页数(向上取整）
            int totalPage = (int)Math.ceil(totalCount *1.0/currentCount);
            bean.setTotalPage(totalPage);
            //获取当前页数据
            List<Product> ps = dao.findByPage(currentPage,currentCount,category);
            bean.setPs(ps);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bean;
    }

    //查询所有商品（管理员）
    public List<Product> listAll() throws ListProductException {
        try {
            return dao.listAll();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ListProductException("查询商品失败");
        }
    }
    //多条件查询（管理员）
    public List<Product> findProductByManyCondition(String id, String name, String category, String minprice, String maxprice){
        List<Product> ps = null;
        try {
            ps = dao.findProductByManyCondition(id,name,category,minprice,maxprice);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ps;
    }

    // 添加商品(admin)
    public void addProduct(Product p) throws AddProductException{
        try {
            dao.addProduct(p);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new AddProductException("添加商品失败");
        }
    }

    // 修改商品信息(admin)
    public void editProduct(Product p){
        try {
            dao.editProduct(p);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //后台系统，根据id删除商品信息
    public void deleteProduct(String id){
        try {
            dao.deleteProduct(id);
        } catch (SQLException e) {
            throw new RuntimeException("后台系统根据id删除商品信息失败！");
        }
    }

}
