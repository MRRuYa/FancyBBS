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

	// 插入一个话题
	public static boolean insertATopic(Topic topic) {
		topic = ToolTopic.completionTopic(topic);
		int i = bbsDatabase.executeUpdate(ToolTopic.entityToStringInsert(topic).toString());
		return i > 0;
	}

	// 删除一个话题
	public static boolean deleteATopic(Topic topic) {
		int i = bbsDatabase.executeUpdate("delete form topic where id='" + topic.getId() + "';");
		return i > 0;
	}

	// 修改一个话题
	public static boolean modifyATopic(Topic topic) {
		int i = bbsDatabase.executeUpdate(ToolTopic.entityToStringModify(topic).toString());
		return i > 0;
	}

	// 根据ID查询话题
	public static Topic getATopicById(Topic topic) {
		ResultSet resultSet = bbsDatabase.executeQuery("select * from topic where id='" + topic.getId() + "';");
		return ToolTopic.resultSetToList(resultSet).get(0);
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
	
	// 通过一个用户获取topic 倒序
	public static List<Topic> getAllTopicByAUser(User user) {
		int i = user.getId();
		ResultSet resultSet = bbsDatabase.executeQuery("select * from topic where uId='" + i + "' order by id desc;");
		return ToolTopic.resultSetToList(resultSet);
	}
	
	//获取板块id号为i的所有帖子
	public static List<Topic> getTopicBySession(Session session) {
		ResultSet resultSet = bbsDatabase.executeQuery("select * from topic where sId="+session.getId()+" order by id desc;");
		return ToolTopic.resultSetToList(resultSet);
	}
	
	//设置帖子置顶
	public static boolean setTopTopic(Topic topic) {
		topic =getATopicById(topic);
		topic.setFlag(1);
		return modifyATopic(topic);
	}
	
	//设置帖子取消置顶
	public static boolean cancelTopTopic(Topic topic) {
		topic =getATopicById(topic);
		topic.setFlag(0);
		return modifyATopic(topic);
	}
	
}
