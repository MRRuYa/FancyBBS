package tool;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Topic;

public class ToolTopic {

	// 把一个ResultSet转化为一个List<Topic>
	public static List<Topic> resultSetToList(ResultSet resultSet) {
		List<Topic> list = new ArrayList<Topic>();
		try {
			while (resultSet.next()) {
				Topic topic = new Topic();
				topic.setuId(resultSet.getInt("id"));
				topic.setsId(resultSet.getInt("sId"));
				topic.setuId(resultSet.getInt("uId"));
				topic.setReplyCount(resultSet.getInt("replyCount"));
				topic.setFlag(resultSet.getInt("flag"));
				topic.setClickCount(resultSet.getInt("clickCount"));
				topic.setLastReplyUseID(resultSet.getInt("lastReplyUseID"));
				topic.setTopic(resultSet.getString("topic"));
				topic.setContents(resultSet.getString("contents"));
				topic.setTime(resultSet.getTimestamp("time"));
				topic.setLastReplayTime(resultSet.getTimestamp("lastReplayTime"));
				list.add(topic);
			}
			resultSet.close();
		} catch (SQLException e) {
		}
		return list;
	}

	// 将实体类转化为String
	public static StringBuilder entityToString(Topic topic) {
		StringBuilder stringBuilder = new StringBuilder();
		stringBuilder.append(
				"insert into topic (sId,uId,replyCount,topic,contents,time,flag,clickCount,lastReplyUseID,lastReplayTime) values(");
		stringBuilder.append("'" + topic.getsId() + "',");
		stringBuilder.append("'" + topic.getuId() + "',");
		stringBuilder.append("'" + topic.getReplyCount() + "',");
		stringBuilder.append("'" + topic.getTopic() + "',");
		stringBuilder.append("'" + topic.getContents() + "',");
		stringBuilder.append("'" + topic.getTime() + "',");
		stringBuilder.append("'" + topic.getFlag() + "',");
		stringBuilder.append("'" + topic.getClickCount() + "',");
		stringBuilder.append("'" + topic.getLastReplyUseID() + "',");
		stringBuilder.append("'" + topic.getLastReplayTime() + "',");
		stringBuilder.append("'" + topic.getLastReplayTime() + "'");
		stringBuilder.append(");");
		return stringBuilder;
	}

	// 使用默认信息补全一个信息不完整的话题
	public static Topic completionTopic(Topic topic) {

		return topic;
	}

}
