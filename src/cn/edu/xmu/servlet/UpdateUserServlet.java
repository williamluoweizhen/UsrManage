package cn.edu.xmu.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.xmu.dao.UserDao;
import cn.edu.xmu.daoimpl.UserDaoImpl;
import cn.edu.xmu.table.UserTable;

/**
 * @author luowz
 * @date 20170608 
 * 修改用户
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		String u_id = request.getParameter("u_id");
		String u_name = request.getParameter("u_name");
		String u_password = request.getParameter("u_password");
		String u_sex = request.getParameter("u_sex");
		String u_phone = request.getParameter("u_phone");
		String u_email = request.getParameter("u_email");
		
		UserDao userDao = new UserDaoImpl();
		Map<String, String> param1 = new HashMap<String, String>();
		param1.put(UserTable.U_NAME,u_name);
		param1.put(UserTable.U_PASSWORD,u_password);
		param1.put(UserTable.U_SEX,u_sex);
		param1.put(UserTable.U_PHONE,u_phone);
		param1.put(UserTable.U_EMAIL,u_email);
		Map<String, String> param2 = new HashMap<String, String>();
		param2.put(UserTable.U_ID, u_id);
		int result  = userDao.updateRecord(UserTable.TABLE_NAME, param1, param2);
		if(result==1){
			response.sendRedirect("./admin/getalluser.jsp");
			System.out.println("修改成功");
		}
	}

}
