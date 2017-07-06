package cn.edu.xmu.servlet;
import java.util.List;

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
 * 用户登录
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao = new UserDaoImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		//得到用户名和密码
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username+password);
		List<User> list = userDao.isLogin(username, password);
		 //获取表单的验证码
        String code = request.getParameter("verificationCode");
        //获取session中的验证码
        String randstr=(String)request.getSession().getAttribute("rdStr");
		PrintWriter out = response.getWriter();
		if(list.isEmpty())
		{
			out.print(-1);
		}
		else
		{
			if(!code.equals(randstr)){
				out.print(-2);
			}else{
				//将得到的user放入session
				list.get(0).setRole("normaluser");
				request.getSession().setAttribute("user", list.get(0));
				out.print(1);
			}

		}
	}

}
