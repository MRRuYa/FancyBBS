package operating;

import java.sql.ResultSet;
import java.util.List;

import database.BBSDatabase;
import entity.User;
import tool.ToolUser;

public class OperatingUser {
	private static BBSDatabase bbsDatabase = BBSDatabase.getDatabase();

	// ����һ���û�
	public static boolean insertAUser(User user) {
		user = ToolUser.completionUser(user);
		int i = bbsDatabase.executeUpdate(ToolUser.entityToString(user).toString());
		return i > 0;
	}

	// ɾ��һ���û�
	public static boolean deleteAUser(User user) {

		return false;
	}

	// �޸�һ���û�
	public static boolean modifyAUser(User user) {
		StringBuilder stringBuilder = new StringBuilder();
		stringBuilder.append("update user set ");
		stringBuilder.append(" password='" + user.getPassword() + "',");
		stringBuilder.append(" nickname='" + user.getNickname() + "',");
		stringBuilder.append(" email='" + user.getEmail() + "',");
		stringBuilder.append(" photo='" + user.getPhoto() + "',");
		stringBuilder.append(" sex='" + user.getSex() + "',");
		stringBuilder.append(" grade='" + user.getGrade() + "',");
		stringBuilder.append(" point='" + user.getPoint() + "'");
		stringBuilder.append(" where account='" + user.getAccount() + "';");
		int i = bbsDatabase.executeUpdate(stringBuilder.toString());
		return i > 0;
	}

	// �ж�һ���û����Ƿ����
	public static boolean verificationAUserName(User user) {
		User user2 = new User();
		user2.setAccount(user.getAccount());
		return getAUser(user2).getId() != 0;
	}

	// ��֤һ���û�����Ϣ�Ƿ���ȷ
	public static boolean verificationAUser(User user) {
		if (verificationAUserName(user)) {
			return getAUser(user).getPassword().equals(user.getPassword());
		}
		return false;
	}

	// ����һ���򵥵��û���Ϣ��ȡһ����ϸ���û���Ϣ
	public static User getAUser(User user) {
		ResultSet resultSet = bbsDatabase.executeQuery("select * from user where account='" + user.getAccount() + "';");
		List<User> list = ToolUser.resultSetToList(resultSet);
		return list.isEmpty() ? user : list.get(0);
	}

	// ��ȡϵͳ�����û���Ϣ
	public static List<User> getAllUser() {
		ResultSet resultSet = bbsDatabase.executeQuery("select * from user;");
		return ToolUser.resultSetToList(resultSet);
	}

}
