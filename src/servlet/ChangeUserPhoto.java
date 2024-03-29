package servlet;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ChangeUserPhoto extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ChangeUserPhoto() {
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
	public void doDelete(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

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
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 设置编码格式
		response.setCharacterEncoding("utf-8"); // 设置编码格式
		response.setContentType("text/html;charset=utf-8");
		
		int uId = Integer.parseInt(request.getParameter("uId")); // 获取用户id
		String photoUrl = request.getParameter("avatar_file");		//获取文件名
		System.out.println(photoUrl);
		
		HttpSession session = request.getSession(); // 获取session对象
		PrintWriter out = response.getWriter(); // 获取输出流

		int MAX_SIZE = 102400 * 102400; // 定义上载文件的最大字节
		String rootPath; // 创建根路径的保存变量
		DataInputStream in = null; // 声明文件读入类
		FileOutputStream fileOut = null;
		String remoteAddr = request.getRemoteAddr(); // 取得客户端的网络地址
		String serverName = request.getServerName(); // 获得服务器的名字
		String realPath = request.getRealPath("/");// 取得互联网程序的绝对地址
		realPath = realPath.substring(0, realPath.lastIndexOf("\\"));
		//rootPath = "F:\\githubproject\\FancyBBS\\WebRoot\\img\\UserPhoto"; // 创建文件的保存目录
		rootPath = realPath + "\\img\\UserPhoto\\"; // 创建文件的保存目录
		out.println("上传文件保存目录为" + rootPath);
		
		String contentType = request.getContentType(); // 取得客户端上传的数据类型
		try {
			if (contentType.indexOf("multipart/form-data") >= 0) {
				in = new DataInputStream(request.getInputStream()); // 读入上传的数据
				int formDataLength = request.getContentLength();
				if (formDataLength > MAX_SIZE) {
					out.println("<P>上传的文件字节数不可以超过" + MAX_SIZE + "</p>");
					return;
				}
				byte dataBytes[] = new byte[formDataLength]; // 保存上传文件的数据
				int byteRead = 0;
				int totalBytesRead = 0;
				while (totalBytesRead < formDataLength) { // 上传的数据保存在byte数组
					byteRead = in.read(dataBytes, totalBytesRead,
							formDataLength);
					totalBytesRead += byteRead;
				}
				String file = new String(dataBytes); // 根据byte数组创建字符串
				String saveFile = file	.substring(file.indexOf("filename=\"") + 10); // 取得上传的数据的文件名
				saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
				saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,	saveFile.indexOf("\""));
				int lastIndex = contentType.lastIndexOf("=");
				String boundary = contentType.substring(lastIndex + 1,contentType.length());// 取得数据的分隔字符串
				String fileName = rootPath + saveFile;
				int pos;
				pos = file.indexOf("filename=\"");
				pos = file.indexOf("\n", pos) + 1;
				pos = file.indexOf("\n", pos) + 1;
				pos = file.indexOf("\n", pos) + 1;
				int boundaryLocation = file.indexOf(boundary, pos) - 4;
				int startPos = ((file.substring(0, pos)).getBytes()).length;// 取得文件数据的开始的位置
				int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length; // 取得文件数据的结束的位置
				File checkFile = new File(fileName); // 检查上载文件是否存在
				if (checkFile.exists()) {
					out.println("<p>" + saveFile + "文件已经存在.</p>");
				}
				File fileDir = new File(rootPath);// 检查上载文件的目录是否存在
				if (!fileDir.exists()) {
					fileDir.mkdirs();
				}
				fileOut = new FileOutputStream(fileName); // 创建文件的写出类
				fileOut.write(dataBytes, startPos, (endPos - startPos)); // 保存文件的数据
				fileOut.close();
				out.println("<P><font color=red size=5>" + saveFile
						+ "文件成功上传.</font></p>");
			} else {
				String content = request.getContentType();
				out.println("<p>上传的数据类型不是是multipart/form-data</p>");
			}
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
/*
		response.getWriter().print("forward:<br />"); // 跳转到主页面
		getServletConfig().getServletContext().getRequestDispatcher("/usermessage2.jsp?uId=" + uId).forward(request, response);
*/
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
	public void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

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
