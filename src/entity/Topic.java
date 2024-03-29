package entity;

import java.sql.Timestamp;

//����ʵ��
public class Topic {
	private int id, sId, uId, replyCount, flag, clickCount, lastReplyUseID;
	private String topic, contents;
	private Timestamp time, lastReplayTime;

	public Topic() {

	}

	public Topic(int id, int sId, int uId, int replyCount, int flag, int clickCount, int lastReplyUseID, String topic,
			String contents, Timestamp time, Timestamp lastReplayTime) {
		super();
		this.id = id;
		this.sId = sId;
		this.uId = uId;
		this.replyCount = replyCount;
		this.flag = flag;
		this.clickCount = clickCount;
		this.lastReplyUseID = lastReplyUseID;
		this.topic = topic;
		this.contents = contents;
		this.time = time;
		this.lastReplayTime = lastReplayTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getsId() {
		return sId;
	}

	public void setsId(int sId) {
		this.sId = sId;
	}

	public int getuId() {
		return uId;
	}

	public void setuId(int uId) {
		this.uId = uId;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public int getClickCount() {
		return clickCount;
	}

	public void setClickCount(int clickCount) {
		this.clickCount = clickCount;
	}

	public int getLastReplyUseID() {
		return lastReplyUseID;
	}

	public void setLastReplyUseID(int lastReplyUseID) {
		this.lastReplyUseID = lastReplyUseID;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public Timestamp getLastReplayTime() {
		return lastReplayTime;
	}

	public void setLastReplayTime(Timestamp lastReplayTime) {
		this.lastReplayTime = lastReplayTime;
	}

	@Override
	public String toString() {
		return "Topic [id=" + id + ", sId=" + sId + ", uId=" + uId + ", flag=" + flag + ", clickCount=" + clickCount
				+ ", topic=" + topic + ", time=" + time + ", lastReplayTime=" + lastReplayTime + "]";
	}

}
