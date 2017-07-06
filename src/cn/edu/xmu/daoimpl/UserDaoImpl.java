package cn.edu.xmu.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import cn.edu.xmu.dao.UserDao;
import cn.edu.xmu.entity.User;
import cn.edu.xmu.table.UserTable;
import cn.edu.xmu.util.DBUtil;
/*
 * @author luowz
 * @date 20170608 
 */
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {

	public List<User> findAll() {
		List<User> list= new ArrayList<User>();
		String sql="select * from u_user";
		System.out.println(sql);
		ResultSet rs = null;
		try {
			rs = DBUtil.executeQuery(sql);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			while (rs.next()) {
				User a = new User(rs.getInt("u_id"),rs.getString("u_name"),rs.getString("u_password"));
				list.add(a);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int addNewRecord(User user) {
        int result = 0;
		String sql = "insert into "+UserTable.TABLE_NAME+"("
				+UserTable.U_NAME+","+UserTable.U_PASSWORD+","+UserTable.U_SEX+","+UserTable.U_PHONE+","+UserTable.U_EMAIL+")values(?,?,?,?,?)";
		System.out.println("添加账户"+sql);
		Connection connection = DBUtil.openConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getSex());
			pstmt.setString(4, user.getPhone());
			pstmt.setString(5, user.getEmail());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			result = -1;
		}finally{
			try {
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				result = -1;
			}
		}
		return result;
	}

	public List<User> findForPage(int start, int end, String sort,
			String order, Map queryParams) {
		String sql = " select tmp.* from ( " +
				" select * from "+UserTable.TABLE_NAME +" where 1=1 " ;
		for ( Object object : queryParams.keySet()) {
			String key = object.toString();
			String value = queryParams.get(key).toString();
			sql += String.format(" and %s = '%s'", key,value);
		}
		sql += " order by " + sort +" "+order+
				" ) tmp limit "+ start +
				" ," + end;
		
		System.out.println(sql);
		
		Connection connection  = DBUtil.openConnection();
		
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		List<User> resultList = new ArrayList<User>();
		try {
			pstmt = connection.prepareStatement(sql);
			resultSet = pstmt.executeQuery();
			while (resultSet.next()) {
				int u_id = resultSet.getInt(UserTable.U_ID);
				String u_name = resultSet.getString(UserTable.U_NAME);
				String u_password = resultSet.getString(UserTable.U_PASSWORD);
				String u_sex = resultSet.getString(UserTable.U_SEX);
				String u_phone = resultSet.getString(UserTable.U_PHONE);
				String u_email = resultSet.getString(UserTable.U_EMAIL);
				User user = new User(u_id, u_name, u_password, u_sex, u_phone, u_email);
				resultList.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				resultSet.close();
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				return null;
			}
		}
		return resultList;
	}

	public User getUserRecordById(String value) {
		String sql = "select * from "+UserTable.TABLE_NAME
				+" where "+UserTable.U_ID+" = "+value;
	System.out.println(sql);
	Connection connection = DBUtil.openConnection();
	PreparedStatement pstmt = null;
	ResultSet resultSet = null;
	try {
		pstmt = connection.prepareStatement(sql);
		resultSet = pstmt.executeQuery();
		while(resultSet.next()){
			int u_id = resultSet.getInt(UserTable.U_ID);
			String u_name = resultSet.getString(UserTable.U_NAME);
			String u_password = resultSet.getString(UserTable.U_PASSWORD);
			String u_phone = resultSet.getString(UserTable.U_PHONE);
			String u_email = resultSet.getString(UserTable.U_EMAIL);
			String u_sex =  resultSet.getString(UserTable.U_SEX);
			User user=new User(u_id,u_name,u_password,u_sex,u_phone,u_email);
			return user;
		}
	} catch (SQLException e) {
		e.printStackTrace();
		return null;
	}finally{
		try {
			resultSet.close();
			pstmt.close();
			connection.close();
		} catch (Exception e2) {
			return null;
		}
	}
	return null;
	}

	public int getIdByUsername(String name) {
		
		String sql = "select * from u_user where "+"u_name"+"='"+name+"'";
		System.out.println(sql);
		ResultSet rs = null;
		try {
			rs = DBUtil.executeQuery(sql);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			while (rs.next()) {
				User a = new User(rs.getInt("u_id"),rs.getString("u_name"),rs.getString("u_password"));
				return a.getId();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int alterUser(Map<String, String> value, int id) {
		return 0;
	}

	@Override
	public int getUserCount(Map queryParams) {
	int count  = 0;
		
		String sql = "select count(*) from " + UserTable.TABLE_NAME +" where 1 = 1"; 
		for ( Object object : queryParams.keySet()) {
			String key = object.toString();
			String value = queryParams.get(key).toString();
			sql += String.format(" and  %s = '%s' ", key,value);
		}
		System.out.println(sql);
		Connection connection  = DBUtil.openConnection();
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		try {
			pstmt = connection.prepareStatement(sql);
			resultSet = pstmt.executeQuery();
			while(resultSet.next()){
				count = resultSet.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			count = -1;
		}finally{
			try {
				pstmt.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
				count = -1;
			}
		}
		
		System.out.println(count);
		return count;
	}

	@Override
	public List<User> isLogin(String u_name, String u_password) {
		Connection connection = DBUtil.openConnection();
		PreparedStatement pstmt = null;
		List<User> list = new ArrayList<User>();
		String sql = "select * from u_user where "+UserTable.U_NAME+"= ? and " +UserTable.U_PASSWORD+"= ?";
		System.out.println(sql);
		ResultSet rs = null;
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, u_name);
			pstmt.setString(2, u_password);
			rs = pstmt.executeQuery();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			while (rs.next()) {
				User a = new User(rs.getInt("u_id"),rs.getString("u_name"),rs.getString("u_password"));
				list.add(a);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int HaveUsername(String name) {
		String sql = "select * from u_user where "+"u_name"+"='"+name+"'";
		System.out.println(sql);
		ResultSet rs = null;
		try {
			rs = DBUtil.executeQuery(sql);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			while (rs.next()) {
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
