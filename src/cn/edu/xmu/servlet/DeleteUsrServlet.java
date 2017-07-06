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
import cn.edu.xmu.table.UserTable;

/**
 * @author luowz
 * @date 20170608 
 * 删除用户
 * Servlet implementation class DeleteUsrServlet
 */
@WebServlet("/DeleteUsrServlet")
public class DeleteUsrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUsrServlet() {
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
		PrintWriter out = response.getWriter();
		String userid = request.getParameter("userid");
		if(null!=userid){
			UserDao userDao = new UserDaoImpl();
			Map<String,String> params= new HashMap<String, String>();
			params.put(UserTable.U_ID, userid);
			int result = userDao.deleteRecord(UserTable.TABLE_NAME, params);
			out.print(result);
			System.out.println("删除用户纪录的结果"+result);
		}else{
			out.print(-1);
			System.out.println("删除用户记录为空");
		}
	}

}
