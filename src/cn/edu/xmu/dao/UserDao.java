package cn.edu.xmu.dao;

import java.util.List;
import java.util.Map;

import cn.edu.xmu.entity.User;

/*
 * @author luowz
 * @date 20170608 
 */

public interface UserDao extends BaseDao<User> {
	public int alterUser(Map<String,String> value,int id);
	
	public List<User> findAll();
	
	public List<User> isLogin(String u_name,String u_password);
	
	public int addNewRecord(User user);
	
	public int getUserCount(Map queryParams);
	
	public List<User> findForPage(int start, int end, String sort,
			String order, Map queryParams);
	
	public User getUserRecordById(String value);
	
	public int getIdByUsername(String name);
	
	public int HaveUsername(String name);
}
