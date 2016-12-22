package tool;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Session;

public class ToolSession {
	// ��һ��ResultSetת��Ϊһ��List<Session>
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

	// ��ʵ����ת��ΪString
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

	// ʹ��Ĭ����Ϣ��ȫһ����Ϣ�������ĻỰ
	public static Session completionTopic(Session session) {

		return session;
	}
}
