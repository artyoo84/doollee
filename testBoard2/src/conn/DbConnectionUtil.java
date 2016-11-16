package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnectionUtil {
	private static DbConnectionUtil instance;

	private DbConnectionUtil() {
	} // end constructor

	public static synchronized DbConnectionUtil getInstance() {
		if (instance == null)
			instance = new DbConnectionUtil();
		return instance;
	} // end Method getInstance()

	public  Connection getConnection(String dbType) {

		Connection conn = null;
		try {
			if ("oracle".equals(dbType)) {

			} else {
				Class.forName("com.mysql.jdbc.Driver");

				conn = DriverManager
						.getConnection("jdbc:mysql://222.231.33.171:44006/acms?"
								+ "user=acms&password=!doollee1028");

			} // end if()
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// end try
		return conn;
	} // end method getConnection

}
