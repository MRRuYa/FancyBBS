package entity;

import java.sql.Timestamp;

//»Ø¸´ÊµÌå
public class Reply {
	private int id, tId, uId;
	private String content;
	private Timestamp time;

	public Reply() {

	}

	public Reply(int id, int tId, int uId, String content, Timestamp time) {
		this.id = id;
		this.tId = tId;
		this.uId = uId;
		this.content = content;
		this.time = time;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int gettId() {
		return tId;
	}

	public void settId(int tId) {
		this.tId = tId;
	}

	public int getuId() {
		return uId;
	}

	public void setuId(int uId) {
		this.uId = uId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "Reply [id=" + id + ", tId=" + tId + ", uId=" + uId + ", time=" + time + "]";
	}

}
