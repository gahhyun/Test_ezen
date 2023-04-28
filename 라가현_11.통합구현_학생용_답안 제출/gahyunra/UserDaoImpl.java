package com.earth.gahyunra;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	DataSource ds;
	
	final int FAIL = 0;

	@Override
	public User selectUser(String id) {
		User user = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			String sql = "select * from t_test where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				user = new User();
				user.setId(rs.getString(1));
				user.setPwd(rs.getString(2));
				user.setName(rs.getString(3));
				user.setEmail(rs.getString(4));
				user.setBirth(rs.getString(5));
			}			
		} catch (SQLException e) { e.printStackTrace();	
		
		} finally {

			close(rs, pstmt, conn);
		}
		
		
		return user;
	}

	private void close(AutoCloseable...closeables) {
		for (AutoCloseable autoCloseable : closeables) {
			if (autoCloseable != null) try { autoCloseable.close(); } catch (Exception e) { e.printStackTrace(); } 
		}		
	}

	@Override
	public int deleteUser(String id) {
		int rowCnt = FAIL;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ds.getConnection();
			String sql = "delete from t_test where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);	
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return FAIL;
		} finally {
			close(pstmt, conn);
		}			
	}

	@Override
	public void deleteAll() throws SQLException {
		Connection conn  = ds.getConnection();
		String sql = "delete from t_test";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();		
	}

	@Override
	public int updateUser(User user) {
		int rowCnt = FAIL;
		// try-with-resources
		
		String sql = "update t_test "
				+ "set pwd = ?, name = ?, email = ?,  birth = ?"
				+ "where id = ?";
		
		try(
				Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
		) {		
			pstmt.setString(1, user.getPwd());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getBirth() );
			pstmt.setString(5, user.getId());
			rowCnt = pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
			return FAIL;
		}
	
		return rowCnt;
	}

	@Override
	public int insertUser(User user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
	
			String sql = 
				"INSERT INTO t_test VALUES(?, ?, ?, ?,?)";
			pstmt = conn.prepareStatement(sql);
	
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPwd());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getBirth());
			
			return pstmt.executeUpdate();			//insert, update, delete
			
		} catch (SQLException e) {
			e.printStackTrace();
			return FAIL;
		} finally {
			close(pstmt, conn);
		}
		
	}

}







