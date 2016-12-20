package operating;

import java.sql.ResultSet;
import java.util.List;

import database.BBSDatabase;
import entity.Session;
import entity.Topic;
import entity.User;
import tool.ToolSession;
import tool.ToolUser;

public class OperatingSession {
	private static BBSDatabase bbsDatabase = BBSDatabase.getDatabase();

	// 插入一个会话
	public static boolean insertASession(Session session) {
		session = ToolSession.completionTopic(session);
		int i = bbsDatabase.executeUpdate(ToolSession.entityToString(session).toString());
		return i > 0;
	}

	// 删除一个会话
	public static boolean deleteASession(Session session) {

		return false;
	}

	// 修改一个会话
	public static boolean modifyASession(Session session) {

		return false;
	}

	// 根据一个简单的会话信息获取一个详细的会话信息
	public static Topic getASession(Session session) {

		return null;
	}

	//通过id值获取session
	public static Session getSessionById(int i) {
		ResultSet resultSet = bbsDatabase.executeQuery("select * from session where id=" + i  +";");
		List<Session> list = ToolSession.resultSetToList(resultSet);
		return list.isEmpty() ? null : list.get(0);
	}
	// 获取系统所有会话信息
	public static List<Session> getAllSession() {
		ResultSet resultSet = bbsDatabase.executeQuery("select * from session;");
		return ToolSession.resultSetToList(resultSet);
	}
}
