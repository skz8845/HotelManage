package cn.hncj.hotel.action;

import org.apache.struts2.convention.annotation.Action;

import cn.hncj.hotel.utils.PageInfo;

public class TouristAction extends ResultAction{
	@Action("tourist_search_room")
	public String tourist_search_room() {
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setTotal(roomService.total(0, destination, keywords));
		rooms = roomService.listByPageInfo(pageInfo,"Tourist", destination, keywords, orderRoomByCol, orderRules);
		return "listRoomByTour";
	}
}
