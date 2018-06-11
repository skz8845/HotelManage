package cn.hncj.hotel.action;

import cn.hncj.hotel.utils.PageInfo;

public class PaginationAction extends UploadAction{
	protected PageInfo pageInfo;
	public PageInfo getPageInfo() {
		return pageInfo;
	}
	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}
}
