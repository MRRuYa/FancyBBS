package tool;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import configuration.Configuration;
import entity.User;

public class ToolUser {

	// 把一个ResultSet转化为一个List<User>
	public static List<User> resultSetToList(ResultSet resultSet) {
		List<User> list = new ArrayList<User>();
		try {
			while (resultSet.next()) {
				User user = new User();
				user.setId(resultSet.getInt("id"));
				user.setAccount(resultSet.getString("account"));
				user.setPassword(resultSet.getString("password"));
				user.setNickname(resultSet.getString("nickname"));
				user.setEmail(resultSet.getString("email"));
				user.setPhoto(resultSet.getString("photo"));
				user.setSex(resultSet.getString("sex"));
				user.setGrade(resultSet.getInt("grade"));
				user.setPoint(resultSet.getInt("point"));
				user.setRegistrationdate(resultSet.getTimestamp("registrationdate"));
				list.add(user);
			}
			resultSet.close();
		} catch (SQLException e) {
		}
		return list;
	}

	// 将实体类转化为String
	public static StringBuilder entityToString(User user) {
		StringBuilder stringBuilder = new StringBuilder();
		stringBuilder.append(
				"insert into user(account,password,nickname,email,photo,sex,grade,registrationdate,point) values(");
		stringBuilder.append("'" + user.getAccount() + "',");
		stringBuilder.append("'" + user.getPassword() + "',");
		stringBuilder.append("'" + user.getNickname() + "',");
		stringBuilder.append("'" + user.getEmail() + "',");
		stringBuilder.append("'" + user.getPhoto() + "',");
		stringBuilder.append("'" + user.getSex() + "',");
		stringBuilder.append("'" + user.getGrade() + "',");
		stringBuilder.append("'" + user.getRegistrationdate() + "',");
		stringBuilder.append("'" + user.getPoint() + "',");
		stringBuilder.append("'" + user.getPoint() + "'");
		stringBuilder.append(");");
		return stringBuilder;
	}

	// 使用默认信息补全一个信息不完整的用户
	public static User completionUser(User user) {
		if (user.getPassword() == null) {
			user.setPassword(Configuration.defaultUser.getPassword());
		}
		if (user.getNickname() == null) {
			user.setNickname(Configuration.defaultUser.getNickname());
		}
		if (user.getEmail() == null) {
			user.setEmail(Configuration.defaultUser.getEmail());
		}
		if (user.getPhoto() == null) {
			user.setPhoto(Configuration.defaultUser.getPhoto());
		}
		if (user.getSex() == null) {
			user.setSex(Configuration.defaultUser.getSex());
		}
		user.setRegistrationdate(new Timestamp(System.currentTimeMillis()));
		return user;
	}

}
