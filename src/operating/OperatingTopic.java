package operating;

import java.sql.ResultSet;
import java.util.List;

import database.BBSDatabase;
import entity.Session;
import entity.Topic;
import tool.ToolSession;
import tool.ToolTopic;

public class OperatingTopic {
	private static BBSDatabase bbsDatabase = BBSDatabase.getDatabase();

	// 插入一个话题
	public static boolean insertATopic(Topic topic) {
		topic = ToolTopic.completionTopic(topic);
		int i = bbsDatabase.executeUpdate(ToolTopic.entityToString(topic).toString());
		return i > 0;
	}

	// 删除一个话题
	public static boolean deleteATopic(Topic topic) {

		return false;
	}

	// 修改一个话题
	public static boolean modifyATopic(Topic topic) {

		return false;
	}

	// 根据一个简单的话题信息获取一个详细的话题信息
	public static Topic getATopic(Topic topic) {

		return null;
	}

	// 获取系统所有话题信息
	public static List<Topic> getAllTopic() {
		ResultSet resultSet = bbsDatabase.executeQuery("select * from topic order by id desc;");	//降序
		return ToolTopic.resultSetToList(resultSet);
	}
	
	// 通过id值获取topic
	public static Topic getATopicById(int i) {
		ResultSet resultSet = bbsDatabase.executeQuery("select * from topic where id=" + i + ";");
		List<Topic> list = ToolTopic.resultSetToList(resultSet);
		return list.isEmpty() ? null : list.get(0);
	}
	
	//获取板块id号为i的所有帖子
	public static List<Topic> getTopicBySession(Session session) {
		ResultSet resultSet = bbsDatabase.executeQuery("select * from topic where sId="+session.getId()+" order by id desc;");
		return ToolTopic.resultSetToList(resultSet);
	}
}
