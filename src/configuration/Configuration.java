package configuration;

import entity.User;

public class Configuration {

	// ///////////////// FancyBBS���ݿ�����////////////////////////////
	public static final String name = "FancyBBS���ݿ�";
	public static final String hostName = "localhost";
	public static final String databaseName = "fancybbs";
	public static final String userName = "root";
	public static final String userPassword = "Yue";
	public static final int connectionSecond1 = 60;

	// ///////////////// Ĭ���û���Ϣ����////////////////////////////
	public static final User defaultUser = new User();
	public static final String password = "123456";
	public static final String nickname = "Pink";
	public static final String email = "";
	public static final String photo = "";
	public static final String sex = "Ů";

	// ��ʼ��ʱִ�еĴ����
	static {
		defaultUser.setPassword(password);
		defaultUser.setNickname(nickname);
		defaultUser.setEmail(email);
		defaultUser.setPhoto(photo);
		defaultUser.setSex(sex);
	}

}
