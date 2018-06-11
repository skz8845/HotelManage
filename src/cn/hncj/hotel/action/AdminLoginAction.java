package cn.hncj.hotel.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;

import com.opensymphony.xwork2.ActionContext;

import cn.hncj.hotel.entity.Admin;

public class AdminLoginAction extends ResultAction{
	@Action("admin_login")
	public String login_admin() {
		admins = (List<Admin>) adminService.getByName(admin.getUsername());
		if (admins == null) {
			ActionContext.getContext().getSession().put("msg", "µÇÂ¼Ê§°Ü");
			return "showAdminLoginError";
		}
		for (Admin admin1 : admins) {
			if (admin1.getUsername().equals(admin.getUsername()) && admin1.getPassword().equals(admin.getPassword())) {
				ActionContext.getContext().getSession().put("admin", admin1);
				admin = admin1;
				ActionContext.getContext().getSession().put("msg", "");
				System.out.println(admin1);
				return "findUserByAdmin";
			}
		}
		ActionContext.getContext().getSession().put("msg", "µÇÂ¼Ê§°Ü");
		return "showAdminLoginError";
	}
}
