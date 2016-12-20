package operating;

import java.sql.ResultSet;
import java.util.List;

import database.BBSDatabase;
import entity.Session;
import entity.Topic;
import tool.ToolTopic;

public class OperatingTopic {
	private static BBSDatabase bbsDatabase = BBSDatabase.getDatabase();

	// ����һ������
	public static boolean insertATopic(Topic topic) {
		topic = ToolTopic.completionTopic(topic);
		int i = bbsDatabase.executeUpdate(ToolTopic.entityToString(topic).toString());
		return i > 0;
	}

	// ɾ��һ������
	public static boolean deleteATopic(Topic topic) {

		return false;
	}

	// �޸�һ������
	public static boolean modifyATopic(Topic topic) {

		return false;
	}

	// ����һ���򵥵Ļ�����Ϣ��ȡһ����ϸ�Ļ�����Ϣ
	public static Topic getATopic(Topic topic) {

		return null;
	}

	// ��ȡϵͳ���л�����Ϣ
	public static List<Topic> getAllTopic() {
		ResultSet resultSet = bbsDatabase.executeQuery("select * from topic;");
		return ToolTopic.resultSetToList(resultSet);
	}
	//��ȡ���id��Ϊi����������
	public static List<Topic> getTopicBySession(Session session) {
		ResultSet resultSet = bbsDatabase.executeQuery("select * from topic where sId="+session.getId()+";");
		return ToolTopic.resultSetToList(resultSet);
	}
}
