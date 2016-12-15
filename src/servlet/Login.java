package servlet;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import operating.OperatingUser;

import entity.User;

@SuppressWarnings("serial")
public class Login extends GenericServlet {

	@Override
	public void service(ServletRequest servletRequest,
			ServletResponse servletResponse) throws ServletException,
			IOException {
			User user=new User();
			user.setAccount(servletRequest.getParameter("account"));
			user.setPassword(servletRequest.getParameter("password"));
			if (OperatingUser.verificationAUser(user)) {
				servletRequest.getRequestDispatcher("/success.jsp").forward(servletRequest, servletResponse);
				return;
			}
			servletRequest.getRequestDispatcher("/failure.jsp").forward(servletRequest, servletResponse);
	}

}
