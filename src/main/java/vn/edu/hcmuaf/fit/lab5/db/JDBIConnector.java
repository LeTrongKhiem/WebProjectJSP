package vn.edu.hcmuaf.fit.lab5.db;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;

import java.sql.SQLException;

import static vn.edu.hcmuaf.fit.lab5.db.DBProperties.*;

public class JDBIConnector {
    private static Jdbi jdbi;

    public static void makeConnect() {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setURL("jdbc:mysql://" + getHost() + ":" + getPort() + "/" + getDatabaseName());
        dataSource.setUser(getUsername());
        dataSource.setPassword(getPassword());
        try {
            dataSource.setUseCompression(true);
            dataSource.setAutoReconnect(true);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            throw new RuntimeException(throwables);
        }
        jdbi = jdbi.create(dataSource);


    }

    private JDBIConnector() {

    }

    public static Jdbi get() {
        if (jdbi == null) makeConnect();
        return jdbi;
    }
}
