package cn.edu.xmu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.xmu.dao.UserDao;
import cn.edu.xmu.daoimpl.UserDaoImpl;
import cn.edu.xmu.entity.User;
import cn.edu.xmu.table.UserTable;

/**
 * @author luowz
 * @date 20170608 
 * 修改密码
 * Servlet implementation class ModifyServlet
 */
@WebServlet("/ModifyServlet")
public class ModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;Charset=UTF-8");
		String oldPassword = request.getParameter("oldpassword");
		String newPassword = request.getParameter("newpassword");
		String newPasswordagain = request.getParameter("newpasswordagain");
		User user = (User) request.getSession().getAttribute("user");
		UserDao userDao = new UserDaoImpl();
		PrintWriter out = response.getWriter();
		if(oldPassword.equals(user.getPassword())){
			Map<String, String> param1 = new HashMap<String, String>();
			param1.put(UserTable.U_PASSWORD,newPassword);
			Map<String, String> param2 = new HashMap<String, String>();
			param2.put(UserTable.U_ID, user.getId()+"");
			int result  = userDao.updateRecord(UserTable.TABLE_NAME, param1, param2);
			if(result==1){
				out.print(1);
				System.out.println("修改成功");
			}
		}
		else{
			out.print(-1);
		}
	}

}
