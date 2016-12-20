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

	// ����һ���Ự
	public static boolean insertASession(Session session) {
		session = ToolSession.completionTopic(session);
		int i = bbsDatabase.executeUpdate(ToolSession.entityToString(session).toString());
		return i > 0;
	}

	// ɾ��һ���Ự
	public static boolean deleteASession(Session session) {

		return false;
	}

	// �޸�һ���Ự
	public static boolean modifyASession(Session session) {

		return false;
	}

	// ����һ���򵥵ĻỰ��Ϣ��ȡһ����ϸ�ĻỰ��Ϣ
	public static Topic getASession(Session session) {

		return null;
	}

	//ͨ��idֵ��ȡsession
	public static Session getSessionById(int i) {
		ResultSet resultSet = bbsDatabase.executeQuery("select * from session where id=" + i  +";");
		List<Session> list = ToolSession.resultSetToList(resultSet);
		return list.isEmpty() ? null : list.get(0);
	}
	// ��ȡϵͳ���лỰ��Ϣ
	public static List<Session> getAllSession() {
		ResultSet resultSet = bbsDatabase.executeQuery("select * from session;");
		return ToolSession.resultSetToList(resultSet);
	}
}
