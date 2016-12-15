package configuration;

import entity.User;

public class Configuration {

	// ///////////////// FancyBBS数据库配置////////////////////////////
	public static final String name = "FancyBBS数据库";
	public static final String hostName = "localhost";
	public static final String databaseName = "fancybbs";
	public static final String userName = "root";
	public static final String userPassword = "Yue";
	public static final int connectionSecond1 = 60;

	// ///////////////// 默认用户信息配置////////////////////////////
	public static final User defaultUser = new User();
	public static final String password = "123456";
	public static final String nickname = "Pink";
	public static final String email = "";
	public static final String photo = "";
	public static final String sex = "女";

	// 初始化时执行的代码块
	static {
		defaultUser.setPassword(password);
		defaultUser.setNickname(nickname);
		defaultUser.setEmail(email);
		defaultUser.setPhoto(photo);
		defaultUser.setSex(sex);
	}

}
