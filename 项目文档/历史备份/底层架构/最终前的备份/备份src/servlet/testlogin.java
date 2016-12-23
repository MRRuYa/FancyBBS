package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpSession;

import operating.OperatingUser;
import entity.User;

public class testlogin extends GenericServlet {

	@Override
	public void service(ServletRequest request, ServletResponse response)	throws ServletException, IOException {
		request.setCharacterEncoding("GBK");		//设置编码格式
		response.setCharacterEncoding("GBK");		//设置编码格式
		
		response.setContentType("text/html;charset=utf-8");		
		PrintWriter out = response.getWriter();
		
		User user=new User();		//创建用户对象，用于判断
		
		//HttpSession session = request
		user.setAccount(request.getParameter("BUAccount"));
		user.setPassword(request.getParameter("BUAccount"));
		
		if (OperatingUser.verificationAUser(user)) {
			
		}
	}

}
