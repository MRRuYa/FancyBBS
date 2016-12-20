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
		request.setCharacterEncoding("GBK");		//���ñ����ʽ
		response.setCharacterEncoding("GBK");		//���ñ����ʽ
		response.setContentType("text/html;charset=utf-8");		
		PrintWriter out = response.getWriter();		//��ȡ�����
		HttpSession session = request.getSession();		//��ȡsession����
		//User user = (User)session.getAttribute("user");		//��ȡ�û�����
		
		String topic = request.getParameter("topic");		//��ȡ���ӱ���
		String node_id = request.getParameter("node_id");		//��ȡ�������ڰ��id
		int sId = Integer.parseInt(node_id);
		//int uId = user.getId();		//��ȡ������id
		String contents = request.getParameter("contents");		//��ȡ��������
		
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
		
		//response.sendRedirect("index.jsp");		//��ת����ҳ
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