package tool;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Session;

public class ToolSession {
	// 把一个ResultSet转化为一个List<Session>
	public static List<Session> resultSetToList(ResultSet resultSet) {
		List<Session> list = new ArrayList<Session>();
		try {
			while (resultSet.next()) {
				Session session = new Session();
				session.setId(resultSet.getInt("id"));
				session.setMasterId(resultSet.getInt("masterId"));
				session.setName(resultSet.getString("name"));
				session.setProfile(resultSet.getString("profile"));
				session.setTopicCount(resultSet.getInt("topicCount"));
				session.setClickCount(resultSet.getInt("clickCount"));
				list.add(session);
			}
			resultSet.close();
		} catch (SQLException e) {
		}
		return list;
	}

	// 将实体类转化为String
	public static StringBuilder entityToString(Session session) {
		StringBuilder stringBuilder = new StringBuilder();
		stringBuilder.append("insert into session (name,masterId,profile,topicCount,clickCount values(");
		stringBuilder.append("'" + session.getName() + "',");
		stringBuilder.append("'" + session.getMasterId() + "',");
		stringBuilder.append("'" + session.getProfile() + "',");
		stringBuilder.append("'" + session.getTopicCount() + "',");
		stringBuilder.append("'" + session.getClickCount() + "'");
		stringBuilder.append(");");
		return stringBuilder;
	}

	// 使用默认信息补全一个信息不完整的会话
	public static Session completionTopic(Session session) {

		return session;
	}
}
