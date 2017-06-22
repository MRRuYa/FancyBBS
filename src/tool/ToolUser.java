package tool;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import configuration.Configuration;
import entity.User;

public class ToolUser {

	// ʹ��Ĭ����Ϣ��ȫһ����Ϣ���������û�
	public static User completionUser(User user) {
		User user2 = Configuration.getDefaultUser();
		user.setAccount(user.getAccount() == null ? user2.getAccount() : user.getAccount());
		user.setPassword(user.getPassword() == null ? user2.getPassword() : user.getPassword());
		user.setNickname(user.getNickname() == null ? user.getAccount() : user.getNickname());
		user.setEmail(user.getEmail() == null ? user2.getEmail() : user.getEmail());
		user.setPhoto(user.getPhoto() == null ? user2.getPhoto() : user.getPhoto());
		user.setSex(user.getSex() == null ? user2.getSex() : user.getSex());
		user.setGrade(1);
		user.setPoint(50);
		user.setRegistrationdate(new Timestamp(System.currentTimeMillis()));
		return user;
	}

	// ��ʵ����ת��ΪString
	public static StringBuilder entityToStringInsert(User user) {
		StringBuilder stringBuilder = new StringBuilder();
		stringBuilder.append("insert into user(account,password,nickName,email,photo,sex,grade,registrationdate,point) values(");
		stringBuilder.append("'" + user.getAccount() + "',");
		stringBuilder.append("'" + user.getPassword() + "',");
		stringBuilder.append("'" + user.getNickname() + "',");
		stringBuilder.append("'" + user.getEmail() + "',");
		stringBuilder.append("'" + user.getPhoto() + "',");
		stringBuilder.append("'" + user.getSex() + "',");
		stringBuilder.append("'" + user.getGrade() + "',");
		stringBuilder.append("'" + user.getRegistrationdate() + "',");
		stringBuilder.append("'" + user.getPoint() + "'");
		stringBuilder.append(");");
		return stringBuilder;
	}

	// ��ʵ����ת��ΪString
	public static StringBuilder entityToStringModify(User user) {
		StringBuilder stringBuilder = new StringBuilder();
		stringBuilder.append("update user set ");
		stringBuilder.append(" password='" + user.getPassword() + "',");
		stringBuilder.append(" nickname='" + user.getNickname() + "',");
		stringBuilder.append(" email='" + user.getEmail() + "',");
		stringBuilder.append(" photo='" + user.getPhoto() + "',");
		stringBuilder.append(" sex='" + user.getSex() + "',");
		stringBuilder.append(" grade='" + user.getGrade() + "',");
		stringBuilder.append(" point='" + user.getPoint() + "'");
		stringBuilder.append("where account='" + user.getAccount() + "';");
		return stringBuilder;
	}

	// ��һ��ResultSetת��Ϊһ��List<User>
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

}
