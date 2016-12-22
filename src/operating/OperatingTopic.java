package operating;

import java.sql.ResultSet;
import java.util.List;
import database.BBSDatabase;
import entity.Session;
import entity.Topic;
import entity.User;
import tool.ToolTopic;

public class OperatingTopic {
	private static BBSDatabase bbsDatabase = BBSDatabase.getDatabase();

	// ����һ������
	public static boolean insertATopic(Topic topic) {
		topic = ToolTopic.completionTopic(topic);
		int i = bbsDatabase.executeUpdate(ToolTopic.entityToStringInsert(topic).toString());
		return i > 0;
	}

	// ɾ��һ������
	public static boolean deleteATopic(Topic topic) {
		int i = bbsDatabase.executeUpdate("delete form topic where id='" + topic.getId() + "';");
		return i > 0;
	}

	// �޸�һ������
	public static boolean modifyATopic(Topic topic) {
		int i = bbsDatabase.executeUpdate(ToolTopic.entityToStringModify(topic).toString());
		return i > 0;
	}

	// ����ID��ѯ����
	public static Topic getATopicById(Topic topic) {
		ResultSet resultSet = bbsDatabase.executeQuery("select * from topic where id='" + topic.getId() + "';");
		return ToolTopic.resultSetToList(resultSet).get(0);
	}

	// ��ȡϵͳ���л�����Ϣ
	public static List<Topic> getAllTopic() {
		ResultSet resultSet = bbsDatabase.executeQuery("select * from topic order by id desc;");	//����
		return ToolTopic.resultSetToList(resultSet);
	}
	
	// ͨ��idֵ��ȡtopic
	public static Topic getATopicById(int i) {
		ResultSet resultSet = bbsDatabase.executeQuery("select * from topic where id=" + i + ";");
		List<Topic> list = ToolTopic.resultSetToList(resultSet);
		return list.isEmpty() ? null : list.get(0);
	}
	
	// ͨ��һ���û���ȡtopic ����
	public static List<Topic> getAllTopicByAUser(User user) {
		int i = user.getId();
		ResultSet resultSet = bbsDatabase.executeQuery("select * from topic where uId='" + i + "' order by id desc;");
		return ToolTopic.resultSetToList(resultSet);
	}
	
	//��ȡ���id��Ϊi����������
	public static List<Topic> getTopicBySession(Session session) {
		ResultSet resultSet = bbsDatabase.executeQuery("select * from topic where sId="+session.getId()+" order by id desc;");
		return ToolTopic.resultSetToList(resultSet);
	}
	
	//���������ö�
	public static boolean setTopTopic(Topic topic) {
		topic =getATopicById(topic);
		topic.setFlag(1);
		return modifyATopic(topic);
	}
	
	//��������ȡ���ö�
	public static boolean cancelTopTopic(Topic topic) {
		topic =getATopicById(topic);
		topic.setFlag(0);
		return modifyATopic(topic);
	}
	
}
