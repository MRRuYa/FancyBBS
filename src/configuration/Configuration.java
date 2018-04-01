package configuration;

import java.sql.Timestamp;
import entity.Reply;
import entity.Session;
import entity.Topic;
import entity.User;

public class Configuration {

	/////////////////// FancyBBS数据库配置开始////////////////////////////
	public static String databaseChineseName = "FancyBBS数据库";
	public static String databaseHostName = "localhost";
	public static String databaseName = "fancybbs";
	public static String databaseUserName = "root";
	public static String databaseUserPassword = "123456";
	public static int connectionSecond1 = 60;
	/////////////////// FancyBBS数据库配置结束////////////////////////////

	/////////////////// 默认User信息配置开始////////////////////////////
	private static int userId;
	private static String userAccount = "account";
	private static String userPassword = "123456";
	private static String userNickname = "nickname";
	private static String userEmail = "";
	private static String userPhoto = "img/UserPhoto/default.jpg";
	private static String userSex = "男";
	private static int userGrade;
	private static int userPoint;
	private static Timestamp userRegistrationdate;

	// 获取一个默认配置信息的User
	public static User getDefaultUser() {
		User user = new User();
		user.setId(userId);
		user.setAccount(userAccount);
		user.setPassword(userPassword);
		user.setNickname(userNickname);
		user.setEmail(userEmail);
		user.setPhoto(userPhoto);
		user.setSex(userSex);
		user.setGrade(userGrade);
		user.setPoint(userPoint);
		user.setRegistrationdate(userRegistrationdate);
		return user;
	}
	/////////////////// 默认User信息配置结束////////////////////////////

	/////////////////// 默认Session信息配置开始////////////////////////////
	private static String sessionName = "";
	private static String sessionProfile = "";
	private static int sessionId;
	private static int sessionMasterId;
	private static int sessionTopicCount;
	private static int sessionClickCount;

	// 获取一个默认配置信息的Session
	public static Session getDefaultSession() {
		Session session = new Session();
		session.setId(sessionId);
		session.setName(sessionName);
		session.setProfile(sessionProfile);
		session.setMasterId(sessionMasterId);
		session.setTopicCount(sessionTopicCount);
		session.setClickCount(sessionClickCount);
		return session;
	}
	/////////////////// 默认Session信息配置结束////////////////////////////

	/////////////////// 默认Topic信息配置开始////////////////////////////
	private static String topic = "";
	private static String topicContents = "";
	private static int topicId;
	private static int topicSId;
	private static int topicUId;
	private static int topicReplyCount;
	private static int topicFlag;
	private static int topicClickCount;
	private static int topicLastReplyUseID;
	private static Timestamp topicTime;
	private static Timestamp topicLastReplayTime;

	// 获取一个默认配置信息的Topic
	public static Topic getDefaultTopic() {
		Topic topic = new Topic();
		topic.setTopic(Configuration.topic);
		topic.setContents(topicContents);
		topic.setId(topicId);
		topic.setsId(topicSId);
		topic.setuId(topicUId);
		topic.setReplyCount(topicReplyCount);
		topic.setFlag(topicFlag);
		topic.setClickCount(topicClickCount);
		topic.setLastReplyUseID(topicLastReplyUseID);
		topic.setTime(topicTime);
		topic.setLastReplayTime(topicLastReplayTime);
		return topic;
	}
	/////////////////// 默认Topic信息配置结束////////////////////////////

	/////////////////// 默认Reply信息配置开始////////////////////////////
	private static String replyContent = "";
	private static int replyId;
	private static int replyTId;
	private static int replyUId;
	private static Timestamp replyTime;

	// 获取一个默认配置信息的Reply
	public static Reply getDefaultReply() {
		Reply reply = new Reply();
		reply.setId(replyId);
		reply.settId(replyTId);
		reply.setuId(replyUId);
		reply.setTime(replyTime);
		reply.setContent(replyContent);
		return reply;
	}
	/////////////////// 默认Reply信息配置结束////////////////////////////

}
