package operating;

import java.sql.ResultSet;
import java.util.List;

import database.BBSDatabase;
import entity.Reply;
import entity.Session;
import entity.Topic;
import tool.ToolReply;
import tool.ToolSession;

public class OperatingReply {
	private static BBSDatabase bbsDatabase = BBSDatabase.getDatabase();

	// 插入一个回复
	public static boolean insertAReply(Reply reply) {
		reply = ToolReply.completionTopic(reply);
		int i = bbsDatabase.executeUpdate(ToolReply.entityToString(reply).toString());
		return i > 0;
	}

	// 删除一个回复
	public static boolean deleteAReply(Reply reply) {

		return false;
	}

	// 修改一个回复
	public static boolean modifyAReply(Reply reply) {

		return false;
	}

	// 根据一个简单的回复信息获取一个详细的回复信息
	public static Topic getAReply(Reply reply) {

		return null;
	}

	// 获取系统所有回复信息
	public static List<Reply> getAllReply() {
		ResultSet resultSet = bbsDatabase.executeQuery("select * from reply;");
		return ToolReply.resultSetToList(resultSet);
	}
	
	//获取对应topic的reply
	public static List<Reply> getReplyByTopic(Topic topic) {
		int tId = topic.getId();
		ResultSet resultSet = bbsDatabase.executeQuery("select * from reply where tId=" + tId  +";");
		return ToolReply.resultSetToList(resultSet);
	}
}
