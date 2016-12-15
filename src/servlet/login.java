package servlet;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import operating.OperatingUser;
import entity.User;


public class login extends GenericServlet {

	@Override
	public void service(ServletRequest request, ServletResponse response)
			throws ServletException, IOException {
		User user=new User();
		user.setAccount(request.getParameter("BUAccount"));
		user.setPassword(request.getParameter("BUAccount"));
		if (OperatingUser.verificationAUser(user)) {
			
		}
	}

}
