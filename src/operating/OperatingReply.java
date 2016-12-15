package operating;

import java.sql.ResultSet;
import java.util.List;

import database.BBSDatabase;
import entity.Reply;
import entity.Topic;
import tool.ToolReply;

public class OperatingReply {
	private static BBSDatabase bbsDatabase = BBSDatabase.getDatabase();

	// ����һ���ظ�
	public static boolean insertAReply(Reply reply) {
		reply = ToolReply.completionTopic(reply);
		int i = bbsDatabase.executeUpdate(ToolReply.entityToString(reply).toString());
		return i > 0;
	}

	// ɾ��һ���ظ�
	public static boolean deleteAReply(Reply reply) {

		return false;
	}

	// �޸�һ���ظ�
	public static boolean modifyAReply(Reply reply) {

		return false;
	}

	// ����һ���򵥵Ļظ���Ϣ��ȡһ����ϸ�Ļظ���Ϣ
	public static Topic getAReply(Reply reply) {

		return null;
	}

	// ��ȡϵͳ���лظ���Ϣ
	public static List<Reply> getAllReply() {
		ResultSet resultSet = bbsDatabase.executeQuery("select * from reply;");
		return ToolReply.resultSetToList(resultSet);
	}
}
