package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import operating.OperatingSession;
import operating.OperatingTopic;
import tool.ToolSession;
import tool.ToolTopic;

import entity.Session;
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
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 设置编码格式
		response.setCharacterEncoding("utf-8"); // 设置编码格式
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter(); // 获取输出流
		HttpSession session = request.getSession(); // 获取session对象
		User user = (User) session.getAttribute("user"); // 获取发帖用户对象

		String topic = request.getParameter("topic"); // 获取帖子标题
		String node_id = request.getParameter("node_id"); // 获取帖子所在版块id
		int sId = Integer.parseInt(node_id);

		int uId = user.getId(); // 获取发帖人id
		String contents = request.getParameter("contents"); // 获取帖子内容

		Topic topic1 = new Topic();

		topic1.setsId(sId);
		topic1.setuId(uId);
		topic1.setReplyCount(0);
		topic1.setTopic(topic);
		topic1.setContents(contents);
		topic1.setTime(new Timestamp(System.currentTimeMillis()));
		topic1.setFlag(0);
		topic1.setClickCount(0);
		topic1.setLastReplyUseID(sId);
		topic1.setLastReplayTime(new Timestamp(System.currentTimeMillis()));

		Session session2 = OperatingSession.getASessionByATopic(topic1);
		int topicCount = session2.getTopicCount();
		session2.setTopicCount(topicCount + 1);

		OperatingTopic.insertATopic(topic1); // 插入帖子
		// System.out.println(ToolTopic.entityToStringModify(topic1).toString());
		// //输出测试
		// System.out.println(ToolSession.entityToStringModify(session2).toString());
		// //输出测试
		OperatingSession.modifyASession(session2); // 更新帖子

		response.getWriter().print("forward:<br />"); // 跳转到帖子所在版块
		getServletConfig().getServletContext().getRequestDispatcher("/article.jsp?sId=" + sId).forward(request, response);

		out.flush();
		out.close();
	}

	/**
	 * The doPut method of the servlet. <br>
	 * 
	 * This method is called when a HTTP put request is received.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Put your code here
	}

	/**
	 * Returns information about the servlet, such as author, version, and
	 * copyright.
	 * 
	 * @return String information about this servlet
	 */
	public String getServletInfo() {
		return "This is my default servlet created by Eclipse";
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
