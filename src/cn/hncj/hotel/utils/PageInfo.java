package cn.hncj.hotel.utils;

public class PageInfo {
	private int start;
	private int count;
	private int total;
	private String param;
	
	private static final int defaultCount = 5;
	
	public PageInfo() {
		count = defaultCount;
	}
	public PageInfo(int start, int count) {
		super();
		this.start = start;
		this.count = count;
	}
	public boolean isHasPrevious() {
		if (start == 0) {
			return false;
		}
		return true;
	}
	public boolean isHasNext() {
		if (start == getLast()) {
			return false;
		}
		return true;
	}
	public int getTotalPage() {
		if (total < count) {
			return 1;
		}
		else if (total % count == 0) {
			return total / count;
		}
		return total / count + 1;
	}
	public int getLast() {
		if (total == 0) {
			return 0;
		}
		else if (total % count == 0) {
			return total - count;
		}
		return total - total % count;
	}
	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getParam() {
		return param;
	}
	public void setParam(String param) {
		this.param = param;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Page[ start = " + start + ", count = " + count + ", total = " + total + ", param = " + param + ", isHasPreviouse() = " + isHasPrevious() + ", isHasNext() = " + isHasNext() + "";
	}
}
