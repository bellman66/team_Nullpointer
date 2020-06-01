package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTemplate {

	private String driver;
	private String url;
	private String user;
	private String password;

	private JDBCTemplate() {

		driver = "oracle.jdbc.driver.OracleDriver";
		url = "jdbc:oracle:thin:@localhost:1521:xe";
		user = "tn";
		password = "tne";
	}

	private static class JdbcTemplateHolder {

		private static final JDBCTemplate instance = new JDBCTemplate();
	}

	public static JDBCTemplate getInstance() {
		return JdbcTemplateHolder.instance;
	}

	public Connection getConnection() {

		Connection con = null;
		String url = this.url;
		String user = this.user;
		String password = this.password;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			con.setAutoCommit(false);
		} catch (SQLException e) {

			e.printStackTrace();
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}

		return con;
	}

	public void close(Connection conn) {

		try {
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void close(Statement stmt) {

		try {
			if (stmt != null)
				stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void close(ResultSet rs) {

		try {
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void close(ResultSet rs, Statement stmt) {

		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void close(ResultSet rs, Statement stmt, Connection con) {

		try {
			if (con != null)
				con.close();
			if (rs != null)
				rs.close();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void commit(Connection conn) {

		try {
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void rollback(Connection conn) {

		try {
			conn.rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
