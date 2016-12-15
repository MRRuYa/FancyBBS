package operating;

import java.sql.ResultSet;
import java.util.List;

import database.BBSDatabase;
import entity.User;
import tool.ToolUser;

public class OperatingUser {
	private static BBSDatabase bbsDatabase = BBSDatabase.getDatabase();

	// 插入一个用户
	public static boolean insertAUser(User user) {
		user = ToolUser.completionUser(user);
		int i = bbsDatabase.executeUpdate(ToolUser.entityToString(user).toString());
		return i > 0;
	}

	// 删除一个用户
	public static boolean deleteAUser(User user) {

		return false;
	}

	// 修改一个用户
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

	// 判断一个用户名是否存在
	public static boolean verificationAUserName(User user) {
		User user2 = new User();
		user2.setAccount(user.getAccount());
		return getAUser(user2).getId() != 0;
	}

	// 验证一个用户的信息是否正确
	public static boolean verificationAUser(User user) {
		if (verificationAUserName(user)) {
			return getAUser(user).getPassword().equals(user.getPassword());
		}
		return false;
	}

	// 根据一个简单的用户信息获取一个详细的用户信息
	public static User getAUser(User user) {
		ResultSet resultSet = bbsDatabase.executeQuery("select * from user where account='" + user.getAccount() + "';");
		List<User> list = ToolUser.resultSetToList(resultSet);
		return list.isEmpty() ? user : list.get(0);
	}

	// 获取系统所有用户信息
	public static List<User> getAllUser() {
		ResultSet resultSet = bbsDatabase.executeQuery("select * from user;");
		return ToolUser.resultSetToList(resultSet);
	}

}
