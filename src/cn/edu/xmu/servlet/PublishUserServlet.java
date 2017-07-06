package cn.edu.xmu.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.xmu.dao.UserDao;
import cn.edu.xmu.daoimpl.UserDaoImpl;
import cn.edu.xmu.entity.User;

/**
 * @author luowz
 * @date 20170608 
 * 增加用户
 * Servlet implementation class PublishUserServlet
 */
@WebServlet("/PublishUserServlet")
public class PublishUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PublishUserServlet() {
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
		PrintWriter out = response.getWriter();
		String name = request.getParameter("u_name");
		String password = request.getParameter("u_password");
		String sex = request.getParameter("u_sex");
		String phone = request.getParameter("u_phone");
		String email = request.getParameter("u_email");
		UserDao userDao = new UserDaoImpl();
		User user = new User(name, password,sex,phone,email);
		int result = 0;
		result = userDao.addNewRecord(user);
		if(result==1){
			response.sendRedirect("./admin/getalluser.jsp");
		}
		
	}

}
