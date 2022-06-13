package src.camping.entity;

public class OrderStatusLog {
	private int id;
	private int oldStatus;
	private int status;
	private String logTime;
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the status
	 */
	public int getOldStatus() {
		return oldStatus;
	}
	/**
	 * @param status the status to set
	 */
	public void setOldStatus(int status) {
		this.oldStatus = status;
	}
	/**
	 * @return the status
	 */
	public int getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(int status) {
		this.status = status;
	}
	/**
	 * @return the logTime
	 */
	public String getLogTime() {
		return logTime;
	}
	/**
	 * @param logTime the logTime to set
	 */
	public void setLogTime(String logTime) {
		this.logTime = logTime;
	}
}
