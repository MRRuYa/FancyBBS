package tool;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import configuration.Configuration;
import entity.Topic;

public class ToolTopic {

	// 使用默认信息补全一个信息不完整的话题
	public static Topic completionTopic(Topic topic) {
		Topic topic2 = Configuration.getDefaultTopic();
		topic.setTopic(topic.getTopic() == null ? topic2.getTopic() : topic.getTopic());
		topic.setContents(topic.getContents() == null ? topic2.getContents() : topic.getContents());
		topic.setTime(new Timestamp(System.currentTimeMillis()));
		topic.setTime(new Timestamp(System.currentTimeMillis()));
		return topic;
	}

	// 将实体类转化为String
	public static StringBuilder entityToStringInsert(Topic topic) {
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

	// 将实体类转化为String
	public static StringBuilder entityToStringModify(Topic topic) {
		StringBuilder stringBuilder = new StringBuilder();
		stringBuilder.append("update topic set ");
		stringBuilder.append(" sId='" + topic.getsId() + "',");
		stringBuilder.append(" uId='" + topic.getuId() + "',");
		stringBuilder.append(" replyCount='" + topic.getReplyCount() + "',");
		stringBuilder.append(" flag='" + topic.getFlag() + "',");
		stringBuilder.append(" clickCount='" + topic.getClickCount() + "',");
		stringBuilder.append(" lastReplyUseID='" + topic.getLastReplyUseID() + "',");
		stringBuilder.append(" time='" + topic.getTime() + "',");
		stringBuilder.append(" lastReplayTime='" + topic.getLastReplayTime() + "',");
		stringBuilder.append(" topic='" + topic.getTopic() + "',");
		stringBuilder.append(" topic='" + topic.getContents() + "',");
		stringBuilder.append(" where id='" + topic.getId() + "';");
		return stringBuilder;
	}

	// 把一个ResultSet转化为一个List<Topic>
	public static List<Topic> resultSetToList(ResultSet resultSet) {
		List<Topic> list = new ArrayList<Topic>();
		try {
			while (resultSet.next()) {
				Topic topic = new Topic();
				topic.setId(resultSet.getInt("id"));
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
			System.err.println("把一个ResultSet转化为一个List<Topic>");
		}
		return list;
	}

}
