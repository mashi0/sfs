package cn.itcast.msmusic.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class DataSourceUtils {
    private static DataSource dataSource = new ComboPooledDataSource();
    private static ThreadLocal<Connection> tl = new ThreadLocal<Connection>();
    public static DataSource getDataSource() {
        return dataSource;
    }

    /**
     * 获得连接
     * @return
     * @throws SQLException
     */
    public static Connection getconnnection() throws SQLException {
        Connection con = tl.get();
        if(con == null){
            con = dataSource.getConnection();
            tl.set(con);
        }
        return con;
    }

    /**
     * 开启事务
     * @throws SQLException
     */
    public static void startTransaction() throws SQLException {
        Connection con = getconnnection();
        if(con!=null){
            con.setAutoCommit(false);
        }
    }

    /**
     * 从ThreadLocal中释放并且关闭Connection,并结束事务
     * @throws SQLException
     */
    public static void releaseAndCloseConnection() throws SQLException {
        Connection con = getconnnection();
        if(con!=null){
            con.commit();
            tl.remove();
            con.close();
        }
    }

    /**
     * 事务回滚
     * @throws SQLException
     */
    public static void rollback() throws SQLException {
        Connection con = getconnnection();
        if(con!=null){
            con.rollback();
        }
    }


}
