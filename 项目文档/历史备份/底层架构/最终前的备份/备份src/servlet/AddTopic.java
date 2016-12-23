package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import operating.OperatingTopic;

import entity.Topic;
import entity.User;

public class AddTopic extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddTopic() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doDelete method of the servlet. <br>
	 *
	 * This method is called when a HTTP delete request is received.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doDelete(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("GBK");		//设置编码格式
		response.setCharacterEncoding("GBK");		//设置编码格式
		response.setContentType("text/html;charset=utf-8");		
		PrintWriter out = response.getWriter();		//获取输出流
		HttpSession session = request.getSession();		//获取session对象
		//User user = (User)session.getAttribute("user");		//获取用户对象
		
		String topic = request.getParameter("topic");		//获取帖子标题
		String node_id = request.getParameter("node_id");		//获取帖子所在版块id
		int sId = Integer.parseInt(node_id);
		//int uId = user.getId();		//获取发帖人id
		String contents = request.getParameter("contents");		//获取帖子内容
		
		Topic Topic = new Topic();
		Topic.setTopic(topic);
		Topic.setsId(sId);
		//Topic.setuId(uId);
		
		//OperatingTopic.insertATopic(Topic);
		
		out.println(topic);
		out.println("<br />");
		out.println(sId);
		out.println("<br />");
		out.println(contents);
		
		//response.sendRedirect("index.jsp");		//跳转到主页
	}

	/**
	 * The doPut method of the servlet. <br>
	 *
	 * This method is called when a HTTP put request is received.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Put your code here
	}

	/**
	 * Returns information about the servlet, such as 
	 * author, version, and copyright. 
	 *
	 * @return String information about this servlet
	 */
	public String getServletInfo() {
		return "This is my default servlet created by Eclipse";
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
