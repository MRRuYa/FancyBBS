package tool;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Reply;

public class ToolReply {
	// ��һ��ResultSetת��Ϊһ��List<Reply>
	public static List<Reply> resultSetToList(ResultSet resultSet) {
		List<Reply> list = new ArrayList<Reply>();
		try {
			while (resultSet.next()) {
				Reply reply = new Reply();
				reply.setId(resultSet.getInt("id"));
				reply.settId(resultSet.getInt("tId"));
				reply.setuId(resultSet.getInt("uId"));
				reply.setContent(resultSet.getString("content"));
				reply.setTime(resultSet.getTimestamp("time"));
				list.add(reply);
			}
			resultSet.close();
		} catch (SQLException e) {
		}
		return list;
	}

	// ��ʵ����ת��ΪString
	public static StringBuilder entityToString(Reply reply) {
		StringBuilder stringBuilder = new StringBuilder();
		stringBuilder.append("insert into reply (tId,uId,content,time) values(");
		stringBuilder.append("'" + reply.gettId() + "',");
		stringBuilder.append("'" + reply.getuId() + "',");
		stringBuilder.append("'" + reply.getContent() + "',");
		stringBuilder.append("'" + reply.getTime() + "'");
		stringBuilder.append(");");
		return stringBuilder;
	}

	// ʹ��Ĭ����Ϣ��ȫһ����Ϣ�������Ļظ�
	public static Reply completionTopic(Reply reply) {

		return reply;
	}
}
